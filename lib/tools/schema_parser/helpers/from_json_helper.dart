part of '../schema_model.dart';

StringBuffer _generateFromJson(
  SchemaModel model, {
  bool isRoot = false,
}) {
  final String className = model.className;
  final String rootInput = model.children
      .map((SchemaModel model) => 'dynamic ${model.fieldName}Json,')
      .join();
  final StringBuffer result = StringBuffer(
    'factory $className.fromJson(${isRoot ? rootInput : 'Map<String,dynamic> json'}) => $className(',
  );

  for (final SchemaModel model in model.children) {
    if (model.fieldName == 'cashierObject' ||
        model.fieldName == 'cashierString') {
      result.write('''
    ${model.fieldName}: ${model.fieldName}Json is ${model.fieldName == 'cashierObject' ? 'Map<String,dynamic>?' : 'String'}  ? ${_getFromJsonForModel(model: model, isRoot: isRoot)} : null ,
    ''');
      continue;
    }

    result.write('''
    ${model.fieldName}: ${_getFromJsonForModel(model: model, isRoot: isRoot)},
    ''');
  }

  result.write(');');

  return result;
}

/// Recursive function for generating string of `fromJson field` for provided `model`.
String _getFromJsonForModel({
  required SchemaModel model,
  bool isRoot = false,
  String? forceSourceFieldName,
}) {
  String fromJsonStr;
  final String className = model.className;
  final String title = model.fieldName;
  final String schemaTitle = model.schemaTitle;
  final String sourceFieldName = forceSourceFieldName ??
      (isRoot ? '${title}Json' : 'json[\'$schemaTitle\']');
  final String nullCheck =
      model.isRequired ? '' : '$sourceFieldName == null ? null :';

  switch (model.schemaType) {
    case JsonSchemaParser.patternObjectType:
      final SchemaModel childrenModel = model.children.first;

      fromJsonStr = '''
       $nullCheck Map<String, ${childrenModel.classType}>.fromEntries(
            $sourceFieldName
                .entries
                .map<MapEntry<String, ${childrenModel.classType}>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, ${childrenModel.classType}>(
                            entry.key, ${_getFromJsonForModel(forceSourceFieldName: 'entry.value', model: childrenModel)})))
          ''';
      break;
    case JsonSchemaParser.arrayType:
      fromJsonStr =
          '$nullCheck ${_getFromJsonFromArray(model, isParent: true, sourceFieldName: sourceFieldName)}';
      break;
    case JsonSchemaParser.objectType:
      fromJsonStr = '$nullCheck $className.fromJson($sourceFieldName)';
      break;
    case 'number':
      fromJsonStr = 'getDouble($sourceFieldName)${model.isRequired ? '!' : ''}';
      break;
    case 'boolean':
      fromJsonStr = 'getBool($sourceFieldName)${model.isRequired ? '!' : ''}';
      break;
    case JsonSchemaParser.dateTimeType:
      fromJsonStr =
          'getDateTime($sourceFieldName)${model.isRequired ? '!' : ''}';
      break;

    default:
      fromJsonStr = model.isEnum
          ? '$nullCheck ${model.classType!.camelCase}Mapper[$sourceFieldName]${model.isRequired ? '!' : ''}'
          : '$sourceFieldName';
  }

  return fromJsonStr;
}

/// Handle FromJson function for a property that is an array(recursive function)
String _getFromJsonFromArray(
  SchemaModel model, {
  bool isParent = false,
  String? sourceFieldName,
}) {
  final String nullCheck = model.isRequired ? '' : 'item == null ? null :';

  if (model.schemaType != JsonSchemaParser.arrayType) {
    if (model.schemaType == JsonSchemaParser.objectType) {
      return '''
       ${model.className}.fromJson(item)
        ''';
    }

    if (model.schemaType == JsonSchemaParser.dateTimeType) {
      return 'getDateTime(item)';
    }

    if (model.schemaType == 'number') {
      return 'getDouble(item)';
    }

    return model.isEnum
        ? '$nullCheck ${model.classType!.camelCase}Mapper[item]${model.isRequired ? '!' : ''}'
        : 'item';
  }

  return isParent
      ? '${model.classType}.from($sourceFieldName${model.isRequired ? '' : '?'}.map((dynamic item) => ${_getFromJsonFromArray(model.schemaArrType!)},),)'
      : '${model.classType}.from(item${model.isRequired ? '' : '?'}.map((dynamic item) => ${_getFromJsonFromArray(model.schemaArrType!)},),)';
}
