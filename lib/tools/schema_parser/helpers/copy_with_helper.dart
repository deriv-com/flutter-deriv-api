part of '../schema_model.dart';

StringBuffer _generateCopyWith({
  required SchemaModel model,
}) {
  final String className = model.className;
  final List<SchemaModel> children = model.children;
  final StringBuffer result = StringBuffer()
    ..write(
      '''
          $className copyWith({
        ''',
    );

  for (final SchemaModel model in children) {
    result.write(
        '${model.isRequired ? 'required' : ''} ${model.classType}${model.isRequired ? '' : '?'} ${model.fieldName},');
  }

  result.write('}) => $className(');

  for (final SchemaModel model in children) {
    result.write(
        '${model.fieldName}: ${model.fieldName} ${model.isRequired ? '' : '?? this.${model.fieldName}'},');
  }

  result.write(');');

  return result;
}
