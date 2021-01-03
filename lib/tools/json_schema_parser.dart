import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

import 'package:dart_style/dart_style.dart';
import 'package:flutter_deriv_api/tools/schema_model.dart';

const String _objectType = 'object';
const String _objectUnknownType = 'objectEmpty';
const String _arrayType = 'array';
const String _arrayUnknownType = 'arrayEmpty';
const String _dateTimeType = 'dateTime';

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
/// model classes, constructor, properties, enums, toJson, fromJson, and copyWith methods.
class JsonSchemaParser {
  final List<StringBuffer> _result = <StringBuffer>[];

  /// Containing all models which are enum type
  static final List<SchemaModel> enumModels = <SchemaModel>[];

  /// Containing all generated classes name
  static final List<String> classNamesArray = <String>[];

  static final Map<String, String> _typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'double',
    'boolean': 'bool',
  };

  static String _generateClass({
    @required String className,
    @required List<SchemaModel> models,
    String methodsString = '',
    bool isRoot,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          /// ${ReCase(className).sentenceCase} model class
          abstract class ${className}Model {
            /// Initializes
            ${_generateContractor(className: '${className}Model', models: models, isSubclass: false)}
            ${_generateProperties(models)}
          }
        
          /// ${ReCase(className).sentenceCase} class
          class $className extends ${className}Model {
            /// Initializes
            ${_generateContractor(className: className, models: models)}
            /// Creates an instance from JSON
            ${_generateFromJson(className: className, models: models, isRoot: isRoot)}
            /// Converts an instance to JSON
            ${_generateToJson(models: models)}
            $methodsString
            /// Creates a copy of instance with given parameters
            ${_copyWith(className: className, models: models)}
          }

          ${_generateEnums(models)}
        ''',
      );

    return DartFormatter().format(result.toString());
  }

  static StringBuffer _generateContractor({
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

    for (final SchemaModel model in models) {
      result
        ..write('${model.isRequired ? '@required' : ''} ')
        ..write(
          isSubclass
              ? '${model.classType} ${model.fieldTitle},'
              : 'this.${model.fieldTitle},',
        );
    }

    if (isSubclass) {
      result.write('}) : super(');

      for (final SchemaModel model in models) {
        result.write('${model.fieldTitle}: ${model.fieldTitle},');
      }

      result.write(');');
    } else {
      result.write('});');
    }

    return result;
  }

  static StringBuffer _generateProperties(List<SchemaModel> models) {
    final StringBuffer result = StringBuffer();

    for (final SchemaModel model in models) {
      result.write(
        '''
          /// ${model.description}
          final ${model.classType} ${model.fieldTitle};
        ''',
      );
    }

    return result;
  }

  /// Generating enums and it's mappers from given models
  static StringBuffer _generateEnums(
    List<SchemaModel> models,
  ) {
    final StringBuffer result = StringBuffer();

    final String enumString = enumModels.map((SchemaModel model) {
      final String enumName = model.enumName;
      final String mapString = model.enumValues
          .map((String enumValue) =>
              '"${enumValue.replaceAll(r'$', r'\$')}": $enumName.${_toEnumName(enumValue)},')
          .join();

      return '''

        final Map<String,$enumName> ${enumName.camelCase}Mapper = <String,$enumName>{
            $mapString
          };

        /// ${model.schemaTitle} Enum
        enum $enumName{
          ${model.enumValues.map((String enumValue) => '${_toEnumName(enumValue)},').join('\n')}
          }

        ''';
    }).join('\n');
    result.write(enumString);
    enumModels.clear();
    return result;
  }

  static String _toEnumName(String name) {
    // TODO(mohammad): fix for all possible illegal characters
    final String formatted = name.camelCase
        .replaceAll('\'', '')
        .replaceAll(',', '')
        .replaceAll('null', '_null')
        .replaceAll('&', '');
    return formatted.startsWith(RegExp(r'\d')) ? '_$formatted' : formatted;
  }

  static StringBuffer _generateFromJson({
    @required String className,
    @required List<SchemaModel> models,
    bool isRoot = false,
  }) {
    final String rootInput = models
        .map((SchemaModel model) =>
            '${model.schemaType == _objectType ? 'Map<String,dynamic>' : 'dynamic'} ${model.fieldTitle}Json,')
        .join();
    final StringBuffer result = StringBuffer(
      'factory $className.fromJson(${isRoot ? rootInput : 'Map<String,dynamic> json'}) => $className(',
    );

    for (final SchemaModel model in models) {
      final String className = model.className;
      final String title = model.fieldTitle;
      final String schemaTitle = model.schemaTitle;
      final String sourceFieldName =
          isRoot ? '${title}Json' : 'json[\'$schemaTitle\']';

      switch (model.schemaType) {
        case _arrayType:
          result.write(
            '''
            $title: $sourceFieldName == null
              ? null
              : ${_fromJsonFromArray(model, isParrent: true, sourceFieldName: sourceFieldName)},
          ''',
          );
          break;
        case _objectType:
          result.write(
            '''
            $title: $sourceFieldName == null
              ? null
              : $className.fromJson($sourceFieldName),
          ''',
          );
          break;
        case 'number':
          result.write('''$title: getDouble($sourceFieldName),''');
          break;
        case 'boolean':
          result.write('''$title: getBool($sourceFieldName),''');
          break;
        case _dateTimeType:
          result.write('''$title: getDateTime($sourceFieldName),''');
          break;

        default:
          model.isEnum
              ? result.write(
                  '$title: ${model.enumName.camelCase}Mapper[$sourceFieldName],')
              : result.write('''$title: $sourceFieldName,''');
      }
    }

    result.write(');');

    return result;
  }

  static StringBuffer _generateToJson({
    @required List<SchemaModel> models,
  }) {
    final StringBuffer result = StringBuffer()
      ..write(
        '''
          Map<String, dynamic> toJson() {
            final Map<String, dynamic> resultMap = <String, dynamic>{};

        ''',
      );

    for (final SchemaModel model in models) {
      final String title = model.fieldTitle;
      final String schemaTitle = model.schemaTitle;
      final String schemaType = model.schemaType;

      switch (schemaType) {
        case _objectType:
          result.write(
            '''
            if ($title != null) {
              resultMap['$schemaTitle'] = $title.toJson();
            }
          ''',
          );
          break;
        case _arrayType:
          result.write(
            '''
            if ($title != null) {
              resultMap['$schemaTitle'] = ${_toJsonFromArray(model, isParrent: true)};
            }
          ''',
          );
          break;

        case _dateTimeType:
          result.write(
              '''resultMap['$schemaTitle'] = getSecondsSinceEpochDateTime($title);''');
          break;

        default:
          model.isEnum
              ? result.write(
                  '''resultMap['$schemaTitle'] = ${model.enumName.camelCase}Mapper.entries.firstWhere((entry) => entry.value == $title,orElse: () => null)?.key;''')
              : result.write('''resultMap['$schemaTitle'] = $title;''');
      }
    }

    result.write('\n\nreturn resultMap; }');
    return result;
  }

  /// Hanlde ToJson function for a property that is an array(recursive function)
  static String _toJsonFromArray(
    SchemaModel model, {
    bool isParrent = false,
  }) {
    if (model.schemaType != _arrayType) {
      if (model.schemaType == _objectType) {
        return 'item.toJson()';
      }

      if (model.schemaType == _dateTimeType) {
        return 'getSecondsSinceEpochDateTime(item)';
      }

      return model.isEnum
          ? '${model.enumName.camelCase}Mapper.entries.firstWhere((entry) => entry.value == item,orElse: () => null)?.key'
          : 'item';
    }

    return isParrent
        ? '${model.fieldTitle}.map<dynamic>((${model.schemaArrType.classType} item) => ${_toJsonFromArray(model.schemaArrType)}).toList()'
        : 'item.map((item) => ${_toJsonFromArray(model.schemaArrType)}).toList()';
  }

  /// Hanlde FromJson function for a property that is an array(recursive function)
  static String _fromJsonFromArray(
    SchemaModel model, {
    bool isParrent = false,
    String sourceFieldName,
  }) {
    if (model.schemaType != _arrayType) {
      if (model.schemaType == _objectType) {
        return '''
       ${model.className}.fromJson(item)
        ''';
      }

      if (model.schemaType == _dateTimeType) {
        return 'getDateTime(item)';
      }

      return model.isEnum ? '${model.enumName.camelCase}Mapper[item]' : 'item';
    }

    return isParrent
        ? '${model.classType}.from($sourceFieldName.map((dynamic item) => ${_fromJsonFromArray(model.schemaArrType)}))'
        : '${model.classType}.from(item.map((dynamic item) => ${_fromJsonFromArray(model.schemaArrType)}))';
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

    for (final SchemaModel model in models) {
      result.write('${model.classType} ${model.fieldTitle},');
    }

    result.write('}) => $className(');

    for (final SchemaModel model in models) {
      result.write(
          '${model.fieldTitle}: ${model.fieldTitle} ?? this.${model.fieldTitle},');
    }

    result.write(');');

    return result;
  }

  /// Pass decoded JSON schema to this method for getting list of objects
  static List<SchemaModel> preProcessModels(
    Map<String, dynamic> schema,
  ) {
    final List<SchemaModel> parentModel = <SchemaModel>[];

    if (schema != null) {
      final Map<String, dynamic> schemaProperties = schema['properties'];

      if (schemaProperties != null) {
        for (final MapEntry<String, dynamic> entry
            in schemaProperties.entries) {
          final SchemaModel processed = _processEntry(entry);

          if (processed != null) {
            parentModel.add(processed);
          }
        }
      }
    }

    return parentModel;
  }

  static SchemaModel _processEntry(MapEntry<String, dynamic> entry) {
    final String schemaTitle = entry.key;
    final String type = _getSchemaType(entry);
    final String description = entry.value['description'];
    final bool isBoolean = _isBoolean(entry);

    if (_ignoredParameters.contains(schemaTitle.toLowerCase())) {
      return null;
    }

    final SchemaModel childModel = SchemaModel()
      ..isRequired = _isRequired(entry)
      ..description = _preparePropertyDescription(
        isBoolean: isBoolean,
        description: description,
      )
      ..schemaTitle = schemaTitle
      ..schemaType = isBoolean ? 'boolean' : type
      ..children = <SchemaModel>[];

    // When entity is a string and has enum values
    if (entry.value['enum'] != null) {
      if (type == 'string') {
        childModel.enumValues = List<String>.from(
            entry.value['enum'].map((dynamic x) => x.toString()));
      }
    }

    if (childModel.schemaType == _objectType) {
      childModel.children.addAll(preProcessModels(entry.value));
    } else if (childModel.schemaType == _arrayType) {
      final Map<String, dynamic> arrChildEntry = entry.value['items'];
      childModel.schemaArrType = arrChildEntry != null
          ? _processEntry(
              MapEntry<String, dynamic>('${schemaTitle}Item', arrChildEntry))
          : SchemaModel.dynamicModel();
    }

    return childModel;
  }

  /// Get dart class types of the provided models
  static List<SchemaModel> getClassTypesFor(List<SchemaModel> models) {
    for (final SchemaModel model in models) {
      model.classType = _getClassTypeString(model);
    }
    return models;
  }

  // Returns the dart class type for provided model
  static String _getClassTypeString(SchemaModel model) {
    if (model.classType != null) {
      return model.classType;
    }

    if (model.isEnum) {
      if (enumModels.any((SchemaModel previousModel) =>
          previousModel.schemaTitle == model.schemaTitle)) {
        return model.enumName;
      }
      enumModels.add(model);
      return model.enumName;
    }

    switch (model.schemaType) {
      case _objectType:
        getClassTypesFor(model.children);
        return model.className;
      case _objectUnknownType:
        return 'Map<String,dynamic>';
      case _arrayType:
        getClassTypesFor([model.schemaArrType]);
        return 'List<${_getClassTypeString(model.schemaArrType)}>';
      case _arrayUnknownType:
        return 'List<dynamic>';
      case 'integer':
        if (model.description.toLowerCase().contains('epoch') ||
            model.schemaTitle.contains('date') ||
            model.schemaTitle.contains('time')) {
          model.schemaType = _dateTimeType;
          return 'DateTime';
        }
        return _typeMap[model.schemaType];

      default:
        return _typeMap[model.schemaType] ?? dynamicType;
    }
  }

  /// Generating main and nested classes from schema models that comes from `getModel()` method.
  List<StringBuffer> getClasses(List<SchemaModel> models,
      {String methodsString = '',
      String parrentClassName = '',
      String className = 'MainClass',
      bool isArr = false,
      bool isRoot = false}) {
    // Check if its Obj(second condition is for bypassing arrays, we just need to go through thier child, not creat class for them)
    if (models.isNotEmpty && !isArr) {
      // final String finalClassName = classNamesArray.contains(className)
      //     ? '$parrentClassName$className'
      //     : className;
      // classNamesArray.add(finalClassName);
      _result.add(
        StringBuffer(
          _generateClass(
              className: className,
              methodsString: methodsString,
              models: models,
              isRoot: isRoot),
        ),
      );
    }
    for (final SchemaModel model in models) {
      if (model.schemaType == dynamicType) {
        continue;
      }
      getClasses(
        model.children,
        parrentClassName: className,
        className: model.className,
      );

      // check for arr type of current model, it may be object.
      if (model.isArray) {
        getClasses(
          <SchemaModel>[model.schemaArrType],
          parrentClassName: className,
          className: model.className,
          isArr: true,
        );
      }
    }

    return _result;
  }

  static String _getSchemaType(MapEntry<String, dynamic> entry) {
    String type;
    // Check if there are multiple types for this entry
    if (entry.value['type'] is List) {
      final List<dynamic> types = entry.value['type'];
      // Check if its just nullable
      if (types.length == 2 &&
          types.where((dynamic e) => e == 'null').isNotEmpty) {
        type = types.firstWhere(
          (dynamic e) => e != 'null',
          orElse: () => 'string',
        );
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

  static bool _isRequired(dynamic entry) {
    final String description = entry.value['description'];
    if (description == null) {
      return true;
    }

    return entry.value['type']?.length != 2 &&
        !description.contains('[Optional]');
  }

  static String _preparePropertyDescription({
    bool isBoolean,
    String description,
  }) =>
      description == null
          ? ''
          : isBoolean
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
