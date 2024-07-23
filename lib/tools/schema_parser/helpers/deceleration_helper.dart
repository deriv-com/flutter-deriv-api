part of '../schema_model.dart';

// abstract class ${className}Model extends Equatable

StringBuffer _generateDeceleration(SchemaModel model) {
  final StringBuffer result = StringBuffer();
  final String schemaTitle = model.schemaTitle;

  result.write(
    'abstract class ${model.className}Model ${_getClassExtensions(schemaTitle)}',
  );

  return result;
}

String _getClassExtensions(String schemaTitle) {
  if (equatableProbs.containsKey(schemaTitle)) {
    return 'extends Equatable';
  }

  return '';
}
