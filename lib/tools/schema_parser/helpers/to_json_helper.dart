part of '../schema_model.dart';

// TODO(mohammad): use same pattern as fromJson (create _getToJsonFor function)
StringBuffer _generateToJson(SchemaModel model) {
  final StringBuffer result = StringBuffer()
    ..write(
      '''
          Map<String, dynamic> toJson() {
            final Map<String, dynamic> resultMap = <String, dynamic>{};

        ''',
    );

  for (final SchemaModel model in model.children) {
    final String title = model.fieldName;
    final String schemaTitle = model.schemaTitle;
    final String? schemaType = model.schemaType;
    final bool isRequired = model.isRequired;

    switch (schemaType) {
      case JsonSchemaParser.objectType:
        result.write(
          '''
            ${isRequired ? '' : 'if ($title != null) {'}
              resultMap['$schemaTitle'] = $title${isRequired ? '' : '!'}.toJson();
            ${isRequired ? '' : '}'}
          ''',
        );
        break;
      case JsonSchemaParser.arrayType:
        result.write(
          '''
           ${isRequired ? '' : 'if ($title != null) {'}
              resultMap['$schemaTitle'] = ${_getToJsonFromArray(model, isParent: true)};
            ${isRequired ? '' : '}'}
          ''',
        );
        break;

      case JsonSchemaParser.dateTimeType:
        result.write(
            'resultMap[\'$schemaTitle\'] = getSecondsSinceEpochDateTime($title);');
        break;

      default:
        model.isEnum
            ? result.write(
                'resultMap[\'$schemaTitle\'] = ${model.classType!.camelCase}Mapper.entries.firstWhere((MapEntry<String, ${model.classType}> entry) => entry.value == $title).key;')
            : result.write('resultMap[\'$schemaTitle\'] = $title;');
    }
  }

  result.write('\n\nreturn resultMap; }');
  return result;
}

/// Handle ToJson function for a property that is an array(recursive function)
String _getToJsonFromArray(
  SchemaModel model, {
  bool isParent = false,
}) {
  if (model.schemaType != JsonSchemaParser.arrayType) {
    if (model.schemaType == JsonSchemaParser.objectType) {
      return 'item.toJson()';
    }

    if (model.schemaType == JsonSchemaParser.dateTimeType) {
      return 'getSecondsSinceEpochDateTime(item)';
    }

    return model.isEnum
        ? '${model.classType!.camelCase}Mapper.entries.firstWhere((MapEntry<String, ${model.classType}> entry) => entry.value == item).key'
        : 'item';
  }

  return isParent
      ? '${model.fieldName}${model.isRequired ? '' : '!'}.map<dynamic>((${model.schemaArrType?.classType ?? 'dynamic'} item) => ${_getToJsonFromArray(model.schemaArrType!)},).toList()'
      : 'item.map((${model.schemaArrType!.classType} item) => ${_getToJsonFromArray(model.schemaArrType!)},).toList()';
}
