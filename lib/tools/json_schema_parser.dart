import 'dart:math';

import 'package:dart_style/dart_style.dart';
import 'package:inflection2/inflection2.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

const String _objectType = 'object';
const String _objectUnknownType = 'objectEmpty';
const String _arrayType = 'array';
const String _arrayUnknownType = 'arrayEmpty';
const String _arrayEnumType = 'arrayEnum';
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

  static String _getClassNameOrType({
    @required String name,
    @required String type,
    String arrayType,
  }) {
    if (type != _objectType) {
      if (type == _arrayType) {
        if (arrayType == _arrayEnumType) {
          return '${ReCase(name).pascalCase}Enum';
        }
        if (arrayType != null && _typeMap.containsKey(arrayType)) {
          return _typeMap[arrayType];
        }
        return convertToSingular(ReCase(name).pascalCase);
      }
      return _typeMap[type] ?? 'dynamic';
    }
    return ReCase(name).pascalCase;
  }

  // TODO(Mohammad): We must go through the model children to obtain a model type completely(for types like nested Lists and maps, it won't work)
  // Need Refactor for this feature, cause the _getObjectType process get called before all parrent's children get completed.

  static String _getObjectType({
    @required String name,
    @required String type,
    String arrayType,
  }) {
    if (type == _arrayType) {
      // Array Type
      if (arrayType == _arrayUnknownType) {
        return 'List<dynamic>';
      }
      if(arrayType == _arrayType){
        
      }
      return 'List<${_getClassNameOrType(name: name, type: type, arrayType: arrayType)}>';
    } else {
      // Obj Type
      if (type == _objectUnknownType) {
        return 'Map<String,dynamic>';
      }
      return _getClassNameOrType(name: name, type: type, arrayType: arrayType);
    }
  }

  static String _generateClass({
    @required String className,
    @required List<_SchemaModel> models,
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
            ${_generateEnumMappers(className: className, models: models)}
          }

          ${_generateEnums(className: className, models: models)}
        ''',
      );

    return DartFormatter().format(result.toString());
  }

  static StringBuffer _generateContractor({
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

    for (final _SchemaModel model in models) {
      result
        ..write('${model.isRequired ? '@required' : ''} ')
        ..write(
          isSubclass ? '${model.type} ${model.title},' : 'this.${model.title},',
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

  static StringBuffer _generateProperties({List<_SchemaModel> models}) {
    final StringBuffer result = StringBuffer();

    for (final _SchemaModel model in models) {
      result.write(
        '''
          /// ${model.description}
          final ${model.isEnum && !model.isArray ? model.enumName : model.type} ${model.title};
        ''',
      );
    }

    return result;
  }

  static StringBuffer _generateEnumMappers({
    @required String className,
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer();
    final bool hasEnum = models.any((_SchemaModel model) => model.isEnum);
    if (hasEnum) {
      result.write('''
      // Creating Enum Mappers
      ''');
      final String enumString = models.map((_SchemaModel model) {
        if (model.isEnum) {
          final String enumName = model.enumName;
          final String mapStr = model.enumValues
              .map((String e) =>
                  '$enumName.${_toEnumName(e)}: r\'$e\',') // There are some cases where enum values has ['], so should be scaped.
              .join();
          return '''
       static final Map<$enumName, String> ${enumName.camelCase}Mapper = {
            $mapStr
          };
          
        ''';
        }
        return '';
      }).join('\n');
      result.write(enumString);
    }
    return result;
  }

  static StringBuffer _generateEnums({
    @required String className,
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer();
    final bool hasEnum = models.any((_SchemaModel model) => model.isEnum);
    if (hasEnum) {
      result.write('''
      // Creating Enums
      ''');
      final String enumString = models.map((_SchemaModel model) {
        if (model.isEnum) {
          final String enumName = model.enumName;
          return '''
        enum $enumName{
          ${model.enumValues.map((String e) => '${_toEnumName(e)},').join('\n')}
          }

        ''';
        }
        return '';
      }).join('\n');
      result.write(enumString);
    }
    return result;
  }
  /*
   final Map<$enumName, String> ${enumName}Mapper = {
            ${model.enumValues.map((String e) => '$enumName.${_toEnumName(e)}: \'$e\',')}
          };
  */

  static String _toEnumName(String name) {
    final String formatted = name.snakeCase
        .replaceAll('\'', '')
        .replaceAll(',', '')
        .replaceAll('&', '');
    return formatted.startsWith(RegExp(r'\d')) ? '_$formatted' : formatted;
  }

  static StringBuffer _generateFromJson({
    @required String className,
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer(
      'factory $className.fromJson(Map<String, dynamic> json) => $className(',
    );

    for (final _SchemaModel model in models) {
      final String className = model.className;
      final String title = model.title;
      final String schemaTitle = model.schemaTitle;
      final String schemaType = model.schemaType;
      final String schemaArrType = model.schemaArrType;

      if (model.isEnum) {
        if (model.isArray) {
          result.write('''
          $title: List<${model.enumName}>.from(json['$schemaTitle'].map((x) => ${model.enumName.camelCase}Mapper.entries
          .firstWhere((entry) => entry.value == x,
              orElse: () => null)
          ?.key)),
          ''');
        } else {
          result.write('''
            $title: json['$schemaTitle'] == null
              ? null
              : ${model.enumName.camelCase}Mapper.entries
          .firstWhere((entry) => entry.value == json['$schemaTitle'],
              orElse: () => null)
          ?.key,
          ''');
        }
      } else if (schemaType == _objectType) {
        result.write(
          '''
            $title: json['$schemaTitle'] == null
              ? null
              : $className.fromJson(json['$schemaTitle']),
          ''',
        );
        // TODO: check if we need to process List<BaseTypes> too.
      } else if (schemaType == _arrayType) {
        if (schemaArrType == _objectType) {
          result.write(
            '''
            $title: json['$schemaTitle'] == null
              ? null
              : json['$schemaTitle'].map<$className>((dynamic item) => 
                  ${'$className.fromJson(item)'}).toList(),
          ''',
          );
        } else if (schemaArrType != _arrayUnknownType) {
          result.write('''
          $title: List<${_typeMap[schemaArrType]}>.from(json['$schemaTitle'].map((x) => x)),
          ''');
        }
      } else if (schemaType == 'number') {
        result.write('''$title: getDouble(json['$schemaTitle']),''');
      } else if (schemaType == 'boolean') {
        result.write('''$title: getBool(json['$schemaTitle']),''');
      } else {
        result.write('''$title: json['$schemaTitle'],''');
      }
    }

    result.write(');');

    return result;
  }

  static StringBuffer _generateToJson({
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          Map<String, dynamic> toJson() {
            final Map<String, dynamic> result = <String, dynamic>{};

        ''',
      );

    for (final _SchemaModel model in models) {
      final String title = model.title;
      final String schemaTitle = model.schemaTitle;
      final String schemaType = model.schemaType;
      final String schemaArrType = model.schemaArrType;

      if (model.isEnum) {
        if (model.isArray) {
          result.write(
            '''
            if ($title != null) {
              result['$schemaTitle'] = $title.map((item) => ${model.enumName.camelCase}Mapper[item]).toList();
            }
          ''',
          );
        } else {
          result.write(
              '''result['$schemaTitle'] = ${model.enumName.camelCase}Mapper[$title];''');
        }
      } else if (schemaType == _objectType) {
        result.write(
          '''
            if ($title != null) {
              result['$schemaTitle'] = $title.toJson();
            }
          ''',
        );
      } else if (schemaType == _arrayType && schemaArrType == _objectType) {
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
    @required String className,
    @required List<_SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          $className copyWith({
        ''',
      );

    for (final _SchemaModel model in models) {
      result.write('${model.type} ${model.title},');
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
    @required Map<String, dynamic> schema,
  }) {
    final List<_SchemaModel> parentModel = <_SchemaModel>[];

    if (schema != null && schema.containsKey('properties')) {
      final Map<String, dynamic> schemaProperties = schema['properties'];

      if (schemaProperties != null) {
        for (final dynamic entry in schemaProperties.entries) {
          final String name = entry.key;
          final String type = _getType(entry);
          final String arrayType = type == 'array' ? _getArrType(entry) : null;
          final String description = entry.value['description'];
          final bool isBoolean = _isBoolean(entry);

          if (_ignoredParameters.contains(name.toLowerCase())) {
            continue;
          }

          final _SchemaModel childModel = _SchemaModel()
            ..className = _getClassNameOrType(
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
            ..schemaType = isBoolean ? 'boolean' : type
            ..schemaArrType = arrayType
            ..children = <_SchemaModel>[];

          // When entity is a string and has enum values
          if (entry.value['enum'] != null) {
            if (type == 'string') {
              childModel.enumValues = List<String>.from(
                  entry.value['enum'].map((dynamic x) => x.toString()));
            }
          }
          // When entity is an array of strings which has enum values
          if (arrayType == _arrayEnumType) {
            childModel.enumValues = List<String>.from(
                entry.value['items']['enum'].map((dynamic x) => x.toString()));
          }
          if (type == _objectType) {
            if (type == _objectUnknownType) {
              // TODO: may need some mark for this condition.

            } else {
              childModel.children.addAll(getModels(schema: entry.value));
            }
          } else if (type == _arrayType) {
            if (arrayType == _arrayUnknownType) {
              // TODO: may need some mark for this condition.
            } else {
              childModel.children
                  .addAll(getModels(schema: entry.value['items']));
            }
          }

          parentModel.add(childModel);
        }
      }
    }

    return parentModel;
  }

  /// Generating main and nested classes from schema models that comes from `getModel()` method.
  List<StringBuffer> getClasses({
    @required List<_SchemaModel> models,
    String className = 'MainClass',
    bool clearResult = true,
  }) {
    if (clearResult) {
      _result.clear();
    }

    if (models.isNotEmpty) {
      _result.add(
        StringBuffer(
          _generateClass(
            className: className,
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

  static String _getArrType(dynamic entry) {
    final Map<String, dynamic> items = entry.value['items'];
    if (items == null) {
      // It's a condition where provided shcema has a entry which is an Array, but doesn't have [Properties], so we don't know the type of Array.
      // Assuming this case as object(map) for now (but it may not be map).
      return _arrayUnknownType;
    }
    // For now, we just handle string type for array of enums
    else if (items['enum'] != null && items['type'] == 'string') {
      return _arrayEnumType;
    } else {
      return items['type'];
    }
  }

  static String _getType(MapEntry<String, dynamic> entry) {
    String type;
    // Check if there are multiple types for this entry
    if (entry.value['type'] is List) {
      final List<dynamic> types = entry.value['type'];
      // Check if its just nullable
      if (types.length == 2 &&
          types.where((dynamic e) => e == null).isNotEmpty) {
        type =
            types.firstWhere((dynamic e) => e != null, orElse: () => 'string');
      } else {
        // Check if povided types are more than 2
        // in this case, we apply [number] for the type of entity
        // If there are no number types available, take the first type as default.
        if (types
            .where((dynamic e) => e == 'integer' || e == 'number')
            .isNotEmpty) {
          type = 'number';
        } else {
          type = types.firstWhere((dynamic e) => e != null,
              orElse: () => 'string');
        }
      }
    } else {
      type = entry.value['type'];
      if (type == _objectType && entry.value['properties'] == null) {
        // This is where the provided entry is [object] but doesn't have [properties],
        // Assume this case as Map<String,dynamic> at the end.
        type = _objectUnknownType;
      }
    }

    return type;
  }

  static bool _isBoolean(dynamic entry) =>
      entry.value['type'] == 'integer' && entry.value['enum']?.length == 2;

  static bool _isRequired(dynamic entry) =>
      entry.value['type']?.length != 2 &&
      !entry.value['description'].contains('[Optional]');

  static String _preparePropertyDescription({
    bool isBoolean,
    String description,
  }) =>
      isBoolean
          ? description
              .replaceAll('\n', '\n/// ')
              .replaceAllMapped(
                RegExp(r'`1`| 1| 1 '),
                (Match match) => match
                    .group(0)
                    .replaceAllMapped(RegExp(r'`1`|1'), (_) => '`true`'),
              )
              .replaceAllMapped(
                RegExp(r'`0`| 0| 0 '),
                (Match match) => match
                    .group(0)
                    .replaceAllMapped(RegExp(r'`0`|0'), (_) => '`false`'),
              )
          : description.replaceAll('\n', '\n/// ');
}

/// Model to store schema information
class _SchemaModel {
  /// Class name
  String className;

  /// Field title
  String title;

  /// Object type
  String type;

  /// Is required field
  bool isRequired;

  /// Field description
  String description;

  /// Schema object field title
  String schemaTitle;

  /// Schema object field type
  String schemaType;

  /// Schema array type
  String schemaArrType;

  /// List of nested classes
  List<_SchemaModel> children;

  List<String> enumValues;

  bool get isEnum =>
      enumValues != null &&
      (schemaType == 'string' || schemaArrType == _arrayEnumType);

  String get enumName => '${ReCase(schemaTitle).pascalCase}Enum';

  bool get isArray => schemaType == 'array';
}
