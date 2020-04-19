import 'package:meta/meta.dart';
import 'package:recase/recase.dart';
import 'package:dart_style/dart_style.dart';
import 'package:inflection2/inflection2.dart';

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

/// [JsonSchemaParser] is a utility class for extracting main and nested classes from json schema contents.
/// for using this utility first you should call `getModel()` method and pass decoded json schema to it,
/// then pass the result as `models` parameter to `getClasses()` method.
/// result is a string that contains main class and all related classes of that schema file include:
/// model classes, constructor, properties,  toJson, fromJson, and copyWith methods.
class JsonSchemaParser {
  final List<StringBuffer> _result = <StringBuffer>[];

  static final Map<String, String> _typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'double',
    'boolean': 'bool',
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
    @required List<_SchemaModel> models,
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
    @required List<_SchemaModel> models,
    bool isSubclass = true,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
        $className({
      ''',
      );

    for (_SchemaModel model in models) {
      result.write(
        isSubclass ? '${model.type} ${model.title},' : 'this.${model.title},',
      );
    }

    if (isSubclass) {
      result.write('}) : super(');

      for (_SchemaModel model in models) {
        result.write('${model.title}: ${model.title},');
      }

      result.write(');');
    } else {
      result.write('});');
    }

    return result;
  }

  static StringBuffer _createProperties({List<_SchemaModel> models}) {
    final StringBuffer result = StringBuffer();

    for (_SchemaModel model in models) {
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
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer(
      'factory $className.fromJson(Map<String, dynamic> json) => $className(',
    );

    for (_SchemaModel model in models) {
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
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          Map<String, dynamic> toJson() {
            final Map<String, dynamic> result = <String, dynamic>{};

        ''',
      );

    for (_SchemaModel model in models) {
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
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
        $className copyWith({
      ''',
      );

    for (_SchemaModel model in models) {
      result.write('${model.type} ${model.title},');
    }

    result.write('}) => $className(');

    for (_SchemaModel model in models) {
      result.write('${model.title}: ${model.title} ?? this.${model.title},');
    }

    result.write(');');

    return result;
  }

  /// Pass decoded json schema to this method for getting list of objects
  static List<_SchemaModel> getModel({
    @required Map<String, dynamic> schema,
  }) {
    final List<_SchemaModel> parentModel = <_SchemaModel>[];
    final Map<String, dynamic> schemaProperties = schema['properties'];

    if (schemaProperties != null) {
      for (dynamic entry in schemaProperties.entries) {
        final String name = entry.key;
        final String type = entry.value['type'];
        final String description = entry.value['description'];
        final bool isBoolean = _isBoolean(entry);

        if (_ignoredParameters.contains(name.toLowerCase())) {
          continue;
        }

        final _SchemaModel childModel = _SchemaModel()
          ..className =
              _getClassName(name: name, type: isBoolean ? 'boolean' : type)
          ..title = ReCase(name).camelCase
          ..type =
              _getObjectType(name: name, type: isBoolean ? 'boolean' : type)
          ..description = description.replaceAll('\n', '\n/// ')
          ..schemaTitle = name
          ..schemaType = type
          ..children = <_SchemaModel>[];

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

  /// Generating main and nested classes from schema models that comes from `getModel()` method.
  List<StringBuffer> getClasses({
    String className = 'MainClass',
    @required List<_SchemaModel> models,
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

    for (_SchemaModel model in models) {
      getClasses(
        className: model.className,
        models: model.children,
        clearResult: false,
      );
    }

    return _result;
  }

  static bool _isBoolean(dynamic entry) =>
      entry.value['type'] == 'integer' &&
      entry.value['enum'] != null &&
      entry.value['enum'].length == 2 &&
      entry.value['enum'][0] == 0 &&
      entry.value['enum'][1] == 1;
}

/// Model to store schema information
class _SchemaModel {
  /// Class name
  String className;

  /// Field title
  String title;

  /// Object type
  String type;

  /// Field description
  String description;

  /// Schema object field title
  String schemaTitle;

  /// Schema object field type
  String schemaType;

  /// List of nested classes
  List<_SchemaModel> children;
}
