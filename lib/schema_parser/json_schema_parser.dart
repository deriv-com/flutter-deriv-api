import 'package:meta/meta.dart';
import 'package:recase/recase.dart';
import 'package:dart_style/dart_style.dart';
import 'package:inflection2/inflection2.dart';

import 'package:flutter_deriv_api/schema_parser/schema_model.dart';

const String _objectType = 'object';
const String _arrayType = 'array';

class JsonSchemaParser {
  List<StringBuffer> _result;

  static final Map<String, String> _typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'num',
  };

  static String _getClassName({
    @required String name,
    @required String type,
  }) =>
      type == _objectType
          ? ReCase(name).pascalCase
          : type == _arrayType
              ? convertToSingular(ReCase(name).pascalCase)
              : _typeMap[type];

  static String _getObjectType({
    @required String name,
    @required String type,
  }) =>
      type == _arrayType
          ? 'List<${_getClassName(name: name, type: type)}>'
          : _getClassName(name: name, type: type);

  static String _createClass({
    @required String className,
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write('class $className {')
      ..write(_createContractor(className: className, models: models))
      ..write(_createFromJsonMethod(className: className, models: models))
      ..write(_createToJsonMethod(models: models))
      ..write('}');

    return DartFormatter().format(result.toString());
  }

  static StringBuffer _createContractor({
    @required String className,
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer();

    for (SchemaModel model in models) {
      result.write('${model.type} ${model.title};');
    }

    result.write('$className({');

    for (SchemaModel model in models) {
      result.write('${model.title},');
    }

    result.write('});');

    return result;
  }

  static StringBuffer _createFromJsonMethod({
    @required String className,
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer(
      '$className.fromJson(Map<String, dynamic> json) {',
    );

    for (SchemaModel model in models) {
      final String className = model.className;
      final String title = model.title;
      final String schemaTitle = model.schemaTitle;
      final String schemaType = model.schemaType;

      if (schemaType == _objectType) {
        result.write('''
          $title = json['$schemaTitle'] != null
            ? $className.fromJson(json['$schemaTitle'])
            : null;
        ''');
      } else if (schemaType == _arrayType) {
        result.write('''
          if (json['$schemaTitle'] != null) {
            $title = List<$className>();
            
            json['$schemaTitle'].forEach((item) {
              $title.add($className.fromJson(item));
            });
          }
        ''');
      } else {
        result.write('''$title = json['$schemaTitle'];''');
      }
    }

    result.write('}');

    return result;
  }

  static StringBuffer _createToJsonMethod({
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write('Map<String, dynamic> toJson() {')
      ..write('final Map<String, dynamic> data = Map<String, dynamic>();');

    for (SchemaModel model in models) {
      final String title = model.title;
      final String schemaTitle = model.schemaTitle;
      final String schemaType = model.schemaType;

      if (schemaType == _objectType) {
        result.write('''
          if ($title != null) {
            data['$schemaTitle'] = $title.toJson();
          }
        ''');
      } else if (schemaType == _arrayType) {
        result.write('''
          if ($title != null) {
            data['$schemaTitle'] =
                $title.map((item) => item.toJson()).toList();
          }
        ''');
      } else {
        result.write('''data['$schemaTitle'] = $title;''');
      }
    }

    result.write('return data; }');

    return result;
  }

  static List<SchemaModel> getModel({@required Map<String, dynamic> schema}) {
    final List<SchemaModel> parentModel = <SchemaModel>[];
    final Map<String, dynamic> schemaProperties = schema['properties'];

    if (schemaProperties != null) {
      for (dynamic entry in schemaProperties.entries) {
        final String name = entry.key;
        final String type = entry.value['type'];

        final SchemaModel childModel = SchemaModel()
          ..className = _getClassName(name: name, type: type)
          ..title = ReCase(name).camelCase
          ..type = _getObjectType(name: name, type: type)
          ..schemaTitle = name
          ..schemaType = type
          ..children = <SchemaModel>[];

        if (type == _objectType) {
          childModel.children.addAll(getModel(schema: entry.value));
        } else if (type == _arrayType) {
          childModel.children.addAll(getModel(schema: entry.value['items']));
        }

        parentModel.add(childModel);
      }
    }

    return parentModel;
  }

  List<StringBuffer> getClasses({
    @required String className,
    @required List<SchemaModel> models,
    bool clearResult = true,
  }) {
    if (clearResult) {
      _result = <StringBuffer>[];
    }

    if (models.isNotEmpty) {
      _result.add(
        StringBuffer(
          _createClass(
            className: className,
            models: models,
          ),
        ),
      );
    }

    for (SchemaModel model in models) {
      getClasses(
        className: model.className,
        models: model.children,
        clearResult: false,
      );
    }

    return _result;
  }
}
