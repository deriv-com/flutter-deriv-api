import 'package:dart_style/dart_style.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

import '../helpers/enum_helper.dart';
import 'schema_model.dart';

const String _objectType = 'object';
const String _patternObjectType = 'patternObject';
const String _objectUnknownType = 'objectEmpty';
const String _arrayType = 'array';
const String _arrayUnknownType = 'arrayEmpty';
const String _dateTimeType = 'dateTime';
const String _limitsMultiType = 'limitsMultiType';
const String _cashierMultiType = 'cashierMultiType';

const List<String> _ignoredParameters = <String>[
  'req_id',
  'passthrough',
  'echo_req',
  'error',
  'msg_type',
  'error',
];

/// [JsonSchemaParser] is a utility class for extracting main and nested classes from JSON schema contents.
/// for using this utility first you should call `preProcessModels()` method and pass decoded JSON schema to it,
/// then pass the result as `models` parameter to `getClassTypesFor()` method.
/// result is a `List<SchemaModel>` where contains main properties(level 1) of the schema.
/// `getClasses()` method accepts parrent model of generated schemaModels.
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
    'null': 'null'
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
            ${_generateCopyWith(className: className, models: models)}
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
              ? '${model.classType} ${model.fieldName},'
              : 'this.${model.fieldName},',
        );
    }

    if (isSubclass) {
      result.write('}) : super(');

      for (final SchemaModel model in models) {
        result.write('${model.fieldName}: ${model.fieldName},');
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
          final ${model.classType} ${model.fieldName};
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
              '"${enumValue.replaceAll(r'$', r'\$')}": $enumName.${getEnumName(enumValue)},')
          .join();

      return '''

        final Map<String,$enumName> ${enumName.camelCase}Mapper = <String,$enumName>{
            $mapString
          };

        /// ${model.schemaTitle} Enum
        enum $enumName{
          ${model.enumValues.map((String enumValue) => '${getEnumName(enumValue)},').join('\n')}
          }

        ''';
    }).join('\n');
    result.write(enumString);
    enumModels.clear();
    return result;
  }

  static StringBuffer _generateFromJson({
    @required String className,
    @required List<SchemaModel> models,
    bool isRoot = false,
  }) {
    final String rootInput = models
        .map((SchemaModel model) => '${'dynamic'} ${model.fieldName}Json,')
        //'${model.schemaType == _objectType ? 'Map<String,dynamic>' : 'dynamic'} ${model.fieldName}Json,')
        .join();
    final StringBuffer result = StringBuffer(
      'factory $className.fromJson(${isRoot ? rootInput : 'Map<String,dynamic> json'}) => $className(',
    );

    for (final SchemaModel model in models) {
      if (model.fieldName == 'cashierObject' ||
          model.fieldName == 'cashierString') {
        result.write('''
    ${model.fieldName}: ${model.fieldName}Json is ${model.fieldName == 'cashierObject' ? 'Map<String,dynamic>' : 'String'}  ? ${_getFromJsonFor(model: model, isRoot: isRoot)} : null ,
    ''');
        continue;
      }

      result.write('''
    ${model.fieldName}: ${_getFromJsonFor(model: model, isRoot: isRoot)},
    ''');
    }

    result.write(');');

    return result;
  }

  static String _getFromJsonFor({
    @required SchemaModel model,
    bool isRoot = false,
    String forceSrouceFieldName,
  }) {
    String fromJsonStr;
    final String className = model.className;
    final String title = model.fieldName;
    final String schemaTitle = model.schemaTitle;
    final String sourceFieldName = forceSrouceFieldName ??
        (isRoot ? '${title}Json' : 'json[\'$schemaTitle\']');

    switch (model.schemaType) {
      case _patternObjectType:
        final SchemaModel childrenModel = model.children.first;

        fromJsonStr = '''
          $sourceFieldName == null
              ? null
              : Map<String, ${childrenModel.classType}>.fromEntries(
            $sourceFieldName
                .entries
                .map<MapEntry<String, ${childrenModel.classType}>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, ${childrenModel.classType}>(
                            entry.key, ${_getFromJsonFor(forceSrouceFieldName: 'entry.value', model: childrenModel)})))
          ''';
        break;
      case _arrayType:
        fromJsonStr = '''
           $sourceFieldName == null
              ? null
              : ${_getFromJsonFromArray(model, isParrent: true, sourceFieldName: sourceFieldName)}
          ''';
        break;
      case _objectType:
        fromJsonStr = '''
          $sourceFieldName == null
              ? null
              : $className.fromJson($sourceFieldName)
          ''';
        break;
      case 'number':
        fromJsonStr = '''getDouble($sourceFieldName)''';
        break;
      case 'boolean':
        fromJsonStr = '''getBool($sourceFieldName)''';
        break;
      case _dateTimeType:
        fromJsonStr = '''getDateTime($sourceFieldName)''';
        break;

      default:
        fromJsonStr = model.isEnum
            ? '${model.enumName.camelCase}Mapper[$sourceFieldName]'
            : '''$sourceFieldName''';
    }

    return fromJsonStr;
  }

  // TODO(mohammad): use same pattern as fromJson (create _getToJsonFor function)
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
      final String title = model.fieldName;
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
              resultMap['$schemaTitle'] = ${_getToJsonFromArray(model, isParrent: true)};
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
  static String _getToJsonFromArray(
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
        ? '${model.fieldName}.map<dynamic>((${model.schemaArrType.classType} item) => ${_getToJsonFromArray(model.schemaArrType)}).toList()'
        : 'item.map((item) => ${_getToJsonFromArray(model.schemaArrType)}).toList()';
  }

  /// Hanlde FromJson function for a property that is an array(recursive function)
  static String _getFromJsonFromArray(
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
        ? '${model.classType}.from($sourceFieldName.map((dynamic item) => ${_getFromJsonFromArray(model.schemaArrType)}))'
        : '${model.classType}.from(item.map((dynamic item) => ${_getFromJsonFromArray(model.schemaArrType)}))';
  }

  static StringBuffer _generateCopyWith({
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
      result.write('${model.classType} ${model.fieldName},');
    }

    result.write('}) => $className(');

    for (final SchemaModel model in models) {
      result.write(
          '${model.fieldName}: ${model.fieldName} ?? this.${model.fieldName},');
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
            if (processed.schemaType == _cashierMultiType) {
              parentModel.addAll(processed.multiTypes);
              continue;
            }
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

    final SchemaModel theModel = SchemaModel()
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
        theModel.enumValues = List<String>.from(
            entry.value['enum'].map((dynamic x) => x.toString()));
      }
    }

    if (theModel.schemaType == _limitsMultiType) {
      return _processEntry(MapEntry<String, dynamic>(
          theModel.schemaTitle, entry.value['oneOf'][0]));
    } else if (theModel.schemaType == _cashierMultiType) {
      for (final Map<String, dynamic> item in entry.value['oneOf']) {
        theModel.multiTypes.add(_processEntry(
            MapEntry<String, dynamic>('${schemaTitle}_${item['type']}', item)));
      }
    }

    if (theModel.schemaType == _objectType) {
      final List<SchemaModel> children = preProcessModels(entry.value);
      for (final SchemaModel child in children) {
        child.parrent = theModel;
      }
      theModel.children.addAll(children);
    } else if (theModel.schemaType == _patternObjectType) {
      final Map<String, dynamic> typeMap = entry.value['patternProperties'];
      final MapEntry<String, dynamic> typeEnty = MapEntry<String, dynamic>(
          '${entry.key}_property', typeMap.entries.first.value);
      final SchemaModel childrenType = _processEntry(typeEnty)
        ..parrent = theModel;
      theModel.children.add(childrenType);
    } else if (theModel.schemaType == _arrayType) {
      final Map<String, dynamic> arrChildEntry = entry.value['items'];
      theModel.schemaArrType = arrChildEntry != null
          ? _processEntry(
              MapEntry<String, dynamic>('${schemaTitle}Item', arrChildEntry))
          : SchemaModel.dynamicModel();
    }

    return theModel;
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
      case _patternObjectType:
        getClassTypesFor(model.children);
        final SchemaModel childrenModel = model.children.first;
        return 'Map<String,${_getClassTypeString(childrenModel)}>';
      case _cashierMultiType:
        getClassTypesFor(model.multiTypes);
        // For now we only support multiType for Cashier model(hardcoded)
        return _cashierMultiType;
      case _objectType:
        getClassTypesFor(model.children);
        _assignClassName(model);
        return model.className;
      case _objectUnknownType:
        return 'Map<String,dynamic>';
      case _arrayType:
        getClassTypesFor([model.schemaArrType]);
        return 'List<${_getClassTypeString(model.schemaArrType)}>';
      case _arrayUnknownType:
        return 'List<dynamic>';
      case 'integer':
        final bool descriptionHasEpoch =
            model.description.toLowerCase().contains('epoch');
        final bool titleHasDate = model.schemaTitle.contains('date');
        final bool titleHasTime = model.schemaTitle.contains('time');
        final bool descriptionHasInSeconds =
            model.description.toLowerCase().contains('in seconds');

        if ((descriptionHasEpoch || titleHasDate || titleHasTime) &&
            !descriptionHasInSeconds) {
          model.schemaType = _dateTimeType;
          return 'DateTime';
        }
        return _typeMap[model.schemaType];

      default:
        return _typeMap[model.schemaType] ?? dynamicType;
    }
  }

  /// Generating main and nested classes from schema models that comes from `getModel()` method.
  List<StringBuffer> getClasses(
    SchemaModel model, {
    String methodsString = '',
    bool isRoot = false,
  }) {
    // Check if its Object
    if (model.children.isNotEmpty && model.schemaType != _patternObjectType) {
      _result.add(
        StringBuffer(
          _generateClass(
              className: model.className,
              methodsString: methodsString,
              models: model.children,
              isRoot: isRoot),
        ),
      );
    }

    for (final SchemaModel theModel in model.children) {
      if (theModel.schemaType == dynamicType) {
        continue;
      }

      getClasses(
        theModel.isArray ? theModel.schemaArrType : theModel,
      );
    }

    return _result;
  }

  static void _assignClassName(SchemaModel model) {
    model.className = classNamesArray.contains(model.className)
        ? '${model.parrent.className}${ReCase(model.schemaTitle).pascalCase}'
        : ReCase(model.schemaTitle).pascalCase;
    classNamesArray.add(model.className);
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
        // if provided types are both number and integer , we apply number for the type of entity
        // else case, type is dynamic
        if (types
            .where((dynamic e) => e == 'integer' && e == 'number')
            .isNotEmpty) {
          type = 'number';
        } else if (types
            .where((dynamic e) => e == 'number' && e == 'string')
            .isNotEmpty) {
          type = 'number';
        } else {
          type = dynamicType;
        }
      }
    } else {
      type = entry.value['type'];
      // Check if it has patternProperties
      if (type == _objectType && entry.value['patternProperties'] != null) {
        type = _patternObjectType;
      }

      // Check if its Multi Type
      if (type == null && entry.value['oneOf'] != null) {
        // hardcode
        if (entry.key == 'limits') {
          return _limitsMultiType;
        } else if (entry.key == 'cashier') {
          return _cashierMultiType;
        }
      }
      if (type == _objectType && entry.value['properties'] == null) {
        // This is where the provided entry is [object] but doesn't have [properties],
        // Assume this case as Map<String,dynamic> at the end.
        type = _objectUnknownType;
      }
    }
    return type;
  }

  static bool _isBoolean(dynamic entry) {
    final bool hasTwoElement = entry.value['enum']?.length == 2;
    final bool isSuccessType = hasTwoElement &&
        entry.value['enum'][0] == 0 &&
        entry.value['enum'][1] == 1;
    return entry.value['type'] == 'integer' && isSuccessType;
  }

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
