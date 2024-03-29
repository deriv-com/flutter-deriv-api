import 'package:dart_style/dart_style.dart';
import 'package:recase/recase.dart';
import 'package:flutter_deriv_api/tools/singular_encoder/singular_encoder.dart';

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

/// [JsonSchemaParser] is a utility class for extracting main and nested classes from JSON schema contents.
/// for using this utility first you should call `getModel()` method and pass decoded JSON schema to it,
/// then pass the result as `models` parameter to `getClasses()` method.
/// result is a string that contains main class and all related classes of that schema file include:
/// model classes, constructor, properties,  toJson, fromJson, and copyWith methods.
class JsonSchemaParser {
  final List<StringBuffer> _result = <StringBuffer>[];

  static final List<String> _primaryTypes = <String>[
    'int',
    'String',
    'double',
    'bool',
  ];

  static final Map<String, String> _typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'double',
    'boolean': 'bool',
  };

  static String? _getClassName({
    required String name,
    required String? type,
    String? arrayType,
  }) =>
      type == _objectType
          ? ReCase(name).pascalCase
          : type == _arrayType
              ? arrayType != null && _typeMap.containsKey(arrayType)
                  ? _typeMap[arrayType]
                  : SingularEncoder().convert(ReCase(name).pascalCase)
              : _typeMap[type!] ?? 'UNKNOWN_TYPE';

  static String? _getObjectType({
    required String name,
    required String? type,
    String? arrayType,
  }) =>
      type == _arrayType
          ? 'List<${_getClassName(name: name, type: type, arrayType: arrayType)}>'
          : _getClassName(name: name, type: type, arrayType: arrayType);

  static String _generateClass({
    required String className,
    required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          /// ${ReCase(className).sentenceCase} model class
          abstract class ${className}Model {
            /// Initializes
            ${_generateContractor(className: '${className}Model', models: models, isSubclass: false)}
            ${_generateProperties(models: models)}
          }
        
          /// ${ReCase(className).sentenceCase} class
          class $className extends ${className}Model {
            /// Initializes
            ${_generateContractor(className: className, models: models)}
            /// Creates an instance from JSON
            ${_generateFromJson(className: className, models: models)}
            /// Converts an instance to JSON
            ${_generateToJson(models: models)}
            /// Creates a copy of instance with given parameters
            ${_copyWith(className: className, models: models)}
          }
        ''',
      );

    return DartFormatter().format(result.toString());
  }

  static StringBuffer _generateContractor({
    required String className,
    required List<_SchemaModel> models,
    bool isSubclass = true,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          $className({
        ''',
      );

    for (final _SchemaModel model in models) {
      result
        ..write('${model.isRequired ? 'required' : ''} ')
        ..write(
          isSubclass
              ? '${model.type}${model.isRequired ? '' : '?'} ${model.title},'
              : 'this.${model.title},',
        );
    }

    if (isSubclass) {
      result.write('}) : super(');

      for (final _SchemaModel model in models) {
        result.write('${model.title}: ${model.title},');
      }

      result.write(');');
    } else {
      result.write('});');
    }

    return result;
  }

  static StringBuffer _generateProperties(
      {required List<_SchemaModel> models}) {
    final StringBuffer result = StringBuffer();

    for (final _SchemaModel model in models) {
      result.write(
        '''
          /// ${model.description}
          final ${model.type} ${model.title};
        ''',
      );
    }

    return result;
  }

  static StringBuffer _generateFromJson({
    required String className,
    required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer(
      'factory $className.fromJson(Map<String, dynamic> json) => $className(',
    );

    for (final _SchemaModel model in models) {
      final String? className = model.className;
      final String? title = model.title;
      final String? schemaTitle = model.schemaTitle;
      final String? schemaType = model.schemaType;

      if (schemaType == _objectType) {
        result.write(
          '''
            $title: json['$schemaTitle'] == null
              ? null
              : $className.fromJson(json['$schemaTitle']),
          ''',
        );
      } else if (schemaType == _arrayType) {
        result.write(
          '''
            $title: json['$schemaTitle'] == null
              ? null
              : json['$schemaTitle'].map<$className>((dynamic item) => 
                  ${_primaryTypes.contains(className) ? 'item' : '$className.fromJson(item)'}).toList(),
          ''',
        );
      } else {
        result.write('''$title: json['$schemaTitle'],''');
      }
    }

    result.write(');');

    return result;
  }

  static StringBuffer _generateToJson({
    required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          Map<String, dynamic> toJson() {
            final Map<String, dynamic> result = <String, dynamic>{};

        ''',
      );

    for (final _SchemaModel model in models) {
      final String? title = model.title;
      final String? schemaTitle = model.schemaTitle;
      final String? schemaType = model.schemaType;

      if (schemaType == _objectType) {
        result.write(
          '''
            if ($title != null) {
              result['$schemaTitle'] = $title.toJson();
            }
          ''',
        );
      } else if (schemaType == _arrayType) {
        result.write(
          '''
            if ($title != null) {
              result['$schemaTitle'] = $title.map((item) => item.toJson()).toList();
            }
          ''',
        );
      } else {
        result.write('''result['$schemaTitle'] = $title;''');
      }
    }

    result.write('\n\nreturn result; }');

    return result;
  }

  static StringBuffer _copyWith({
    required String className,
    required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          $className copyWith({
        ''',
      );

    for (final _SchemaModel model in models) {
      result.write('${model.type}? ${model.title},');
    }

    result.write('}) => $className(');

    for (final _SchemaModel model in models) {
      result.write('${model.title}: ${model.title} ?? this.${model.title},');
    }

    result.write(');');

    return result;
  }

  /// Pass decoded JSON schema to this method for getting list of objects
  static List<_SchemaModel> getModels({
    required Map<String, dynamic>? schema,
  }) {
    final List<_SchemaModel> parentModel = <_SchemaModel>[];

    if (schema != null && schema.containsKey('properties')) {
      final Map<String, dynamic>? schemaProperties = schema['properties'];

      if (schemaProperties != null) {
        for (final dynamic entry in schemaProperties.entries) {
          final String name = entry.key;
          final String? type = _getType(entry);
          final String? arrayType = entry.value['type'] == 'array'
              ? entry.value['items']['type']
              : null;
          final String? description = entry.value['description'];
          final bool isBoolean = _isBoolean(entry);

          if (_ignoredParameters.contains(name.toLowerCase())) {
            continue;
          }

          final _SchemaModel childModel = _SchemaModel()
            ..className = _getClassName(
              name: name,
              type: isBoolean ? 'boolean' : type,
              arrayType: arrayType,
            )
            ..title = ReCase(name).camelCase
            ..type = _getObjectType(
              name: name,
              type: isBoolean ? 'boolean' : type,
              arrayType: arrayType,
            )
            ..isRequired = _isRequired(entry)
            ..description = _preparePropertyDescription(
              isBoolean: isBoolean,
              description: description,
            )
            ..schemaTitle = name
            ..schemaType = type
            ..children = <_SchemaModel>[];

          if (type == _objectType) {
            childModel.children.addAll(getModels(schema: entry.value));
          } else if (type == _arrayType) {
            childModel.children.addAll(getModels(schema: entry.value['items']));
          }

          parentModel.add(childModel);
        }
      }
    }

    return parentModel;
  }

  /// Generating main and nested classes from schema models that comes from `getModel()` method.
  List<StringBuffer> getClasses({
    required List<_SchemaModel> models,
    String? className = 'MainClass',
    bool clearResult = true,
  }) {
    if (clearResult) {
      _result.clear();
    }

    if (models.isNotEmpty) {
      _result.add(
        StringBuffer(
          _generateClass(
            className: className!,
            models: models,
          ),
        ),
      );
    }

    for (final _SchemaModel model in models) {
      getClasses(
        models: model.children,
        className: model.className,
        clearResult: false,
      );
    }

    return _result;
  }

  static String? _getType(dynamic entry) => entry.value['type']?.length == 2
      ? entry.value['type'][0] != 'null'
          ? entry.value['type'][0]
          : entry.value['type'][1]
      : entry.value['type'];

  static bool _isBoolean(dynamic entry) =>
      entry.value['type'] == 'integer' && entry.value['enum']?.length == 2;

  static bool _isRequired(dynamic entry) =>
      entry.value['type']?.length != 2 &&
      !entry.value['description'].contains('[Optional]');

  static String _preparePropertyDescription({
    required bool isBoolean,
    String? description,
  }) =>
      isBoolean
          ? description!
              .replaceAll('\n', '\n/// ')
              .replaceAllMapped(
                RegExp(r'`1`| 1| 1 '),
                (Match match) => match
                    .group(0)!
                    .replaceAllMapped(RegExp(r'`1`|1'), (_) => '`true`'),
              )
              .replaceAllMapped(
                RegExp(r'`0`| 0| 0 '),
                (Match match) => match
                    .group(0)!
                    .replaceAllMapped(RegExp(r'`0`|0'), (_) => '`false`'),
              )
          : description!.replaceAll('\n', '\n/// ');
}

/// Model to store schema information
class _SchemaModel {
  /// Class name
  String? className;

  /// Field title
  String? title;

  /// Object type
  String? type;

  /// Is required field
  late bool isRequired;

  /// Field description
  String? description;

  /// Schema object field title
  String? schemaTitle;

  /// Schema object field type
  String? schemaType;

  /// List of nested classes
  late List<_SchemaModel> children;
}
