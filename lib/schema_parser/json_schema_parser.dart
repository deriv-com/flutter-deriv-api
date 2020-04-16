import 'package:meta/meta.dart';
import 'package:recase/recase.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:inflection2/inflection2.dart';

import 'package:flutter_deriv_api/schema_parser/schema_model.dart';

const String _objectType = 'object';
const String _arrayType = 'array';
const List<String> _ignoredParameters = <String>[
  'req_id',
  'passthrough',
  'echo_req',
  'error',
  'msg_type',
  'error',
];

/// A Class for Parsing Receive and Send JSON Schemas.
class JsonSchemaParser {
  final List<StringBuffer> _result = <StringBuffer>[];

  static final Map<String, String> _typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'double',
  };

  static String _getClassName({
    @required String name,
    @required String type,
    @required bool hasEnum,
  }) =>
      type == _objectType
          ? ReCase(name).pascalCase
          : type == _arrayType
              ? convertToSingular(ReCase(name).pascalCase)
              : hasEnum && type == 'integer' ? 'bool' : _typeMap[type];

  static String _getObjectType({
    @required String name,
    @required String type,
    @required bool hasEnum,
  }) =>
      type == _arrayType
          ? 'List<${_getClassName(name: name, type: type, hasEnum: hasEnum)}>'
          : _getClassName(name: name, type: type, hasEnum: hasEnum);

  static String _createClass({
    @required String className,
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          /// ${ReCase(className).sentenceCase} model class
          abstract class ${className}Model {
            /// Class constructor
            ${_createContractor(className: '${className}Model', models: models, isSubclass: false)}
            ${_createProperties(models: models)}
          }
        
          /// ${ReCase(className).sentenceCase} class
          class $className extends ${className}Model {
            /// Class constructor
            ${_createContractor(className: className, models: models)}
            /// Creates instance from json
            ${_createFromJsonMethod(className: className, models: models)}
            /// Converts to json
            ${_createToJsonMethod(models: models)}
            /// Creates copy of instance with given parameters
            ${_copyWith(className: className, models: models)}
          }
        ''',
      );

    return DartFormatter().format(result.toString());
  }

  static StringBuffer _createContractor({
    @required String className,
    @required List<SchemaModel> models,
    bool isSubclass = true,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
        $className({
      ''',
      );

    for (SchemaModel model in models) {
      result.write(
        isSubclass ? '${model.type} ${model.title},' : 'this.${model.title},',
      );
    }

    if (isSubclass) {
      result.write('}) : super(');

      for (SchemaModel model in models) {
        result.write('${model.title}: ${model.title},');
      }

      result.write(');');
    } else {
      result.write('});');
    }

    return result;
  }

  static StringBuffer _createProperties({List<SchemaModel> models}) {
    final StringBuffer result = StringBuffer();

    for (SchemaModel model in models) {
      result.write(
        '''
          /// ${model.description}
          final ${model.type} ${model.title};
        ''',
      );
    }

    return result;
  }

  static StringBuffer _createFromJsonMethod({
    @required String className,
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer(
      'factory $className.fromJson(Map<String, dynamic> json) => $className(',
    );

    for (SchemaModel model in models) {
      final String className = model.className;
      final String title = model.title;
      final String schemaTitle = model.schemaTitle;
      final String schemaType = model.schemaType;

      if (schemaType == _objectType) {
        result.write('''
          $title : json['$schemaTitle'] != null
            ? $className.fromJson(json['$schemaTitle'])
            : null,
        ''');
      } else if (schemaType == _arrayType) {
        result.write('''
          if (json['$schemaTitle'] != null) {
            $title : List<$className>(),
            
            json['$schemaTitle'].forEach((Map<String, dynamic> item) =>
              $title.add($className.fromJson(item)),
            );
          }
        ''');
      } else {
        result.write('''$title : json['$schemaTitle'],''');
      }
    }

    result.write(');');

    return result;
  }

  static StringBuffer _createToJsonMethod({
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          Map<String, dynamic> toJson() {
            final Map<String, dynamic> result = <String, dynamic>{};

        ''',
      );

    for (SchemaModel model in models) {
      final String title = model.title;
      final String schemaTitle = model.schemaTitle;
      final String schemaType = model.schemaType;

      if (schemaType == _objectType) {
        result.write('''
          if ($title != null) {
            result['$schemaTitle'] = $title.toJson();
          }
        ''');
      } else if (schemaType == _arrayType) {
        result.write('''
          if ($title != null) {
            result['$schemaTitle'] = $title.map((item) => item.toJson()).toList();
          }
        ''');
      } else {
        result.write('''result['$schemaTitle'] = $title;''');
      }
    }

    result.write('\n\nreturn result; }');

    return result;
  }

  static StringBuffer _copyWith({
    @required String className,
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
        $className copyWith({
      ''',
      );

    for (SchemaModel model in models) {
      result.write('${model.type} ${model.title},');
    }

    result.write('}) => $className(');

    for (SchemaModel model in models) {
      result.write('${model.title}: ${model.title} ?? this.${model.title},');
    }

    result.write(');');

    return result;
  }

  /// Pass Decoded JSON Schema to This Method for Getting List of Objects.
  static List<SchemaModel> getModel({
    @required Map<String, dynamic> schema,
  }) {
    final List<SchemaModel> parentModel = <SchemaModel>[];
    final Map<String, dynamic> schemaProperties = schema['properties'];

    if (schemaProperties != null) {
      for (dynamic entry in schemaProperties.entries) {
        final String name = entry.key;
        final String type = entry.value['type'];
        final String description = entry.value['description'];
        final bool hasEnum = entry.value['enum'] != null &&
            const DeepCollectionEquality().equals(
              entry.value['enum'],
              <int>[0, 1],
            );

        if (_ignoredParameters.contains(name.toLowerCase())) {
          continue;
        }

        final SchemaModel childModel = SchemaModel()
          ..className = _getClassName(name: name, type: type, hasEnum: hasEnum)
          ..title = ReCase(name).camelCase
          ..type = _getObjectType(name: name, type: type, hasEnum: hasEnum)
          ..description = description.replaceAll('\n', '\n/// ')
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

  /// Generating Main and Nested Classes from Schema Models that Comes from getModel() Method.
  List<StringBuffer> getClasses({
    @required String className,
    @required List<SchemaModel> models,
    bool clearResult = true,
  }) {
    if (clearResult) {
      _result.clear();
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
