part of '../schema_model.dart';

/// Generating enums and it's mappers from given models.
StringBuffer _generateEnums({required SchemaModel model}) {
  final StringBuffer result = StringBuffer();

  final String enumString =
      JsonSchemaParser.enumModels.map((SchemaModel model) {
    final String enumName = model.enumName;
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
