import 'package:dart_style/dart_style.dart';
import 'package:recase/recase.dart';

import 'package:flutter_deriv_api/helpers/enum_helper.dart';
import 'package:flutter_deriv_api/tools/schema_parser/schema_model.dart';

/// [JsonSchemaParser] is a utility class for extracting main and nested classes from JSON schema contents.
/// for using this utility first you should call `preProcessModels()` method and pass decoded JSON schema to it,
/// then pass the result as `models` parameter to `getClassTypesFor()` method.
/// result is a `List<SchemaModel>` where contains main properties(level 1) of the schema.
/// `getClasses()` method accepts parent model of generated schemaModels.
/// result is a string that contains main class and all related classes of that schema file include:
/// model classes, constructor, properties, enums, toJson, fromJson, and copyWith methods.
class JsonSchemaParser {
  final List<StringBuffer> _result = <StringBuffer>[];

  /// Containing all models which are enum type.
  static final List<SchemaModel> enumModels = <SchemaModel>[];

  /// Containing all generated classes name.
  static final List<String> classNamesArray = <String>[];

  static final Map<String, String> _typeMap = <String, String>{
    'integer': 'int',
    'string': 'String',
    'number': 'double',
    'boolean': 'bool',
    'null': 'null'
  };

  static const List<String> _ignoredParameters = <String>[
    'req_id',
    'passthrough',
    'echo_req',
    'error',
    'msg_type',
    'error',
  ];

// TODO(mohammad): REFACTOR - make these types enum.
  /// Object Type.
  static const String objectType = 'object';

  /// PatternObject Type.
  static const String patternObjectType = 'patternObject';

  /// Unknown object Type.
  static const String objectUnknownType = 'objectEmpty';

  /// object Type.
  static const String arrayType = 'array';

  /// Unknown array Type.
  static const String arrayUnknownType = 'arrayEmpty';

  /// DateTime Type.
  static const String dateTimeType = 'dateTime';

  /// Multi Type - limits.
  static const String limitsMultiType = 'limitsMultiType';

  /// Multi Type - cashier.
  static const String cashierMultiType = 'cashierMultiType';

  static String _generateClass({
    required SchemaModel model,
    String methodsString = '',
    bool isRoot = false,
  }) {
    final String className = model.className;

    final StringBuffer result = StringBuffer()
      ..write(
        '''
          /// ${ReCase(className).sentenceCase} model class.
          ${model.getDeceleration()} {
            /// Initializes ${ReCase(className).sentenceCase} model class .
            ${model.getConstructor(className: '${className}Model', isSubclass: false)}
            ${model.getProperties()}
          }
        
          /// ${ReCase(className).sentenceCase} class.
          class $className extends ${className}Model {
            /// Initializes ${ReCase(className).sentenceCase} class.
            ${model.getConstructor(className: className)}
            /// Creates an instance from JSON.
            ${model.getFromJson(isRoot: isRoot)}
            /// Converts an instance to JSON.
            ${model.getToJson()}

            $methodsString

            /// Creates a copy of instance with given parameters.
            ${model.getCopyWith()}

            ${model.getEquatableProbs()}
          }

          ${_generateEnums()}
        ''',
      );

    return DartFormatter().format('$result');
  }

  /// Pass decoded JSON schema to this method for getting list of objects.
  static List<SchemaModel> preProcessModels(
    Map<String, dynamic>? schema, {
    SchemaModel? parentModel,
  }) {
    final List<SchemaModel> models = <SchemaModel>[];

    if (schema != null) {
      final Map<String, dynamic>? schemaProperties = schema['properties'];

      if (schemaProperties != null) {
        for (final MapEntry<String, dynamic> entry
            in schemaProperties.entries) {
          final List<dynamic>? requiredFields = schema['required'];
          final SchemaModel? processed = _processEntry(
            entry: entry,
            parentModel: parentModel,
            isRequired: requiredFields?.contains(entry.key) ?? false,
          );

          if (processed != null) {
            if (processed.schemaType == cashierMultiType) {
              models.addAll(processed.multiTypes);
              continue;
            }

            models.add(processed);
          }
        }
      }
    }

    return models;
  }

  static SchemaModel? _processEntry({
    required MapEntry<String, dynamic> entry,
    required bool isRequired,
    SchemaModel? parentModel,
  }) {
    final String schemaTitle = entry.key;
    final String type = _getSchemaType(entry);
    final String? description = entry.value['description'];
    final bool isBoolean = _isBoolean(entry);

    if (_ignoredParameters.contains(schemaTitle.toLowerCase())) {
      return null;
    }

    final SchemaModel theModel = SchemaModel()
      ..isRequired = entry.value['isNullable'] != null
          ? !entry.value['isNullable']
          : isRequired
      ..description = _preparePropertyDescription(
        isBoolean: isBoolean,
        description: description,
      )
      ..requiredFields = entry.value['required']
      ..schemaTitle = schemaTitle
      ..schemaType = isBoolean ? 'boolean' : type
      ..parent = parentModel
      ..children = <SchemaModel>[];

    // When entity is a string and has enum values.
    if (entry.value['enum'] != null) {
      if (type == 'string') {
        theModel.enumValues = List<String>.from(
          entry.value['enum'].map((dynamic enumValue) => '$enumValue'),
        );
      }
    }

    if (theModel.schemaType == limitsMultiType) {
      return _processEntry(
        entry: MapEntry<String, dynamic>(
          theModel.schemaTitle,
          entry.value['oneOf'].first,
        ),
        isRequired: true,
      );
    } else if (theModel.schemaType == cashierMultiType) {
      for (final Map<String, dynamic> item in entry.value['oneOf']) {
        final SchemaModel? entry = _processEntry(
          entry: MapEntry<String, dynamic>(
            '${schemaTitle}_${item['type']}',
            item,
          ),
          isRequired: false,
        );

        if (entry != null) {
          theModel.multiTypes.add(entry);
        }
      }
    }

    if (theModel.schemaType == objectType) {
      final List<SchemaModel> children =
          preProcessModels(entry.value, parentModel: theModel);

      for (final SchemaModel child in children) {
        child.parent = theModel;
      }

      theModel.children.addAll(children);
    } else if (theModel.schemaType == patternObjectType) {
      final Map<String, dynamic> typeMap = entry.value['patternProperties'];
      final MapEntry<String, dynamic> typeEntry = MapEntry<String, dynamic>(
          '${entry.key}_property', typeMap.entries.first.value);
      final SchemaModel? childrenType =
          _processEntry(entry: typeEntry, isRequired: true);

      if (childrenType != null) {
        childrenType.parent = theModel;
        theModel.children.add(childrenType);
      }
    } else if (theModel.schemaType == arrayType) {
      final Map<String, dynamic>? arrChildEntry = entry.value['items'];

      theModel.schemaArrType = arrChildEntry != null
          ? _processEntry(
              entry: MapEntry<String, dynamic>(
                '${schemaTitle}Item',
                arrChildEntry,
              ),
              isRequired: false,
            )!
          : SchemaModel.dynamicModel()
        ..parent = theModel.parent;
    }

    return theModel;
  }

  /// Get dart class types of the provided models.
  static List<SchemaModel> getClassTypesFor(List<SchemaModel> models) {
    for (final SchemaModel model in models) {
      model.classType = _getClassTypeString(model);
    }

    return models;
  }

  // Returns the dart class type for provided model.
  static String _getClassTypeString(SchemaModel model) {
    if (model.classType != null) {
      return model.classType!;
    }

    if (model.isEnum) {
      final bool isDuplicateEnum = enumModels.any(
        (SchemaModel oldEnum) =>
            _isEnumsEqual(oldEnum: oldEnum, newEnum: model),
      );

      if (isDuplicateEnum) {
        return model.classType!;
      }

      final bool isDuplicateSchemaName = enumModels.any(
        (SchemaModel previousEnumModel) =>
            previousEnumModel.schemaTitle == model.schemaTitle,
      );

      if (isDuplicateSchemaName) {
        enumModels.add(model);

        final String? parentName = model.parent?.className;

        return parentName == null
            ? '${model.enumName}2' // TODO(mohammad): find better solution for duplicate name.
            : '$parentName${model.enumName}';
      }

      enumModels.add(model);

      return model.enumName;
    }

    switch (model.schemaType) {
      case patternObjectType:
        getClassTypesFor(model.children);
        final SchemaModel childrenModel = model.children.first;

        return 'Map<String,${_getClassTypeString(childrenModel)}>';
      case cashierMultiType:
        // For now we only support multiType for Cashier model(hardcoded).
        getClassTypesFor(model.multiTypes);

        return cashierMultiType;
      case objectType:
        getClassTypesFor(model.children);
        _assignClassName(model);

        return model.className;
      case objectUnknownType:
        return 'Map<String,dynamic>';
      case arrayType:
        getClassTypesFor(<SchemaModel>[model.schemaArrType!]);

        return 'List<${_getClassTypeString(model.schemaArrType!)}>';
      case arrayUnknownType:
        return 'List<dynamic>';
      case 'integer':
        if (_isDateTime(model)) {
          model.schemaType = dateTimeType;

          return 'DateTime';
        }

        return _typeMap[model.schemaType]!;

      default:
        return _typeMap[model.schemaType] ?? dynamicType;
    }
  }

  static bool _isEnumsEqual({
    required SchemaModel oldEnum,
    required SchemaModel newEnum,
  }) {
    if (oldEnum.schemaTitle != newEnum.schemaTitle) {
      return false;
    }

    if (oldEnum.enumValues!.length == newEnum.enumValues!.length) {
      for (int i = 0; i < oldEnum.enumValues!.length; i++) {
        if (oldEnum.enumValues![i] != newEnum.enumValues![i]) {
          return false;
        }
      }

      newEnum.classType = oldEnum.classType;

      return true;
    }

    return false;
  }

  /// Generating enums and it's mappers from given models.
  static StringBuffer _generateEnums() {
    final StringBuffer result = StringBuffer();

    final String enumString =
        JsonSchemaParser.enumModels.map((SchemaModel model) {
      final String enumName = model.classType!;
      final String mapString = model.enumValues!
          .map((String enumValue) =>
              '"${enumValue.replaceAll(r'$', r'\$')}": $enumName.${getEnumName(enumValue)},')
          .join();

      return '''
        /// $enumName mapper.
        final Map<String,$enumName> ${enumName.camelCase}Mapper = <String,$enumName>{
            $mapString
          };

        /// ${model.schemaTitle.pascalCase} Enum.
        enum $enumName{
          ${model.enumValues!.map((String enumValue) => '/// $enumValue.\n${getEnumName(enumValue)},').join('\n')}
          }

        ''';
    }).join('\n');
    result.write(enumString);
    JsonSchemaParser.enumModels.clear();

    return result;
  }

  static bool _isDateTime(SchemaModel model) {
    final bool descriptionHasEpoch =
        model.description?.toLowerCase().contains('epoch') ?? false;
    final bool titleHasDate = model.schemaTitle.contains('date');
    final bool titleHasTime = model.schemaTitle.contains('time');
    final bool descriptionHasInSeconds =
        model.description?.toLowerCase().contains('in seconds') ?? false;

    final bool isDateTime =
        (descriptionHasEpoch || titleHasDate || titleHasTime) &&
            !descriptionHasInSeconds;

    return isDateTime;
  }

  /// Generating main and nested classes from schema models that comes from `getModel()` method.
  List<StringBuffer> getClasses(
    SchemaModel model, {
    String methodsString = '',
    bool isRoot = false,
  }) {
    // Check if its Object.
    if (model.children.isNotEmpty && model.schemaType != patternObjectType) {
      _result.add(
        StringBuffer(
          _generateClass(
            model: model,
            methodsString: methodsString,
            isRoot: isRoot,
          ),
        ),
      );
    }

    for (final SchemaModel theModel in model.children) {
      if (theModel.schemaType == dynamicType) {
        continue;
      }

      getClasses(theModel.isArray ? theModel.schemaArrType! : theModel);
    }

    return _result;
  }

  static void _assignClassName(SchemaModel model) {
    if (classNamesArray.contains(model.className)) {
      model.className = model.parent?.className == null
          ? '${ReCase(model.schemaTitle).pascalCase}${classNamesArray.length}'
          : '${model.parent?.className}${ReCase(model.schemaTitle).pascalCase}';

      if (classNamesArray.contains(model.className)) {
        // Rare situation where new generated name already exists.
        model.className = '${model.className}${classNamesArray.length}';
      }
    }

    classNamesArray.add(model.className);
  }

  static String _getSchemaType(MapEntry<String, dynamic> entry) {
    String? schemaType;

    // Check if there are multiple types for this entry.
    if (entry.value['type'] is List) {
      final List<dynamic> types = entry.value['type'];
      final bool isNullable =
          types.where((dynamic type) => type == 'null').isNotEmpty;

      if (isNullable) {
        entry.value['isNullable'] = true;
      }

      // Check if its just nullable
      if (types.length == 2 && isNullable) {
        schemaType = types.firstWhere(
          (dynamic type) => type != 'null',
          orElse: () => 'string',
        );
      } else {
        // Check if provided types are more than 2.
        // if provided types are both number and integer , we apply number for the type of entity,
        // else case, type is dynamic.
        if (types
            .where((dynamic type) => type == 'integer' && type == 'number')
            .isNotEmpty) {
          schemaType = 'number';
        } else if (types
            .where((dynamic type) => type == 'number' && type == 'string')
            .isNotEmpty) {
          schemaType = 'number';
        } else {
          schemaType = dynamicType;
        }
      }
    } else {
      schemaType = entry.value['type'];

      // Check if it has patternProperties.
      if (schemaType == objectType &&
          entry.value['patternProperties'] != null) {
        schemaType = patternObjectType;
      }

      // Check if its Multi Type.
      if (schemaType == null && entry.value['oneOf'] != null) {
        // hard coded.
        if (entry.key == 'limits') {
          return limitsMultiType;
        } else if (entry.key == 'cashier') {
          return cashierMultiType;
        }
      }
    }

    if (schemaType == objectType && entry.value['properties'] == null) {
      // This is where the provided entry is [object] but doesn't have [properties],
      // Assume this case as Map<String,dynamic> at the end.
      schemaType = objectUnknownType;
    }

    return schemaType ?? objectUnknownType;
  }

  static bool _isBoolean(dynamic entry) {
    final List<dynamic> enumValues = entry.value['enum'] ?? <dynamic>[];
    final String description = entry.value['description'] ?? '';
    final bool hasTwoElement = enumValues.length == 2;
    final bool isSuccessType =
        hasTwoElement && enumValues.contains(1) && enumValues.contains(0);
    final bool isDescriptiveBool = description.contains('Must be `1`') ||
        description.contains('Must be 1');
    final bool isInteger = entry.value['type'] == 'integer';

    return isInteger && isSuccessType || isDescriptiveBool;
  }

  static String _preparePropertyDescription({
    required bool isBoolean,
    String? description,
  }) =>
      description == null
          ? ''
          : isBoolean
              ? description
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
              : description.replaceAll('\n', '\n/// ');
}
