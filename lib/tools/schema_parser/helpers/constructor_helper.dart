part of '../schema_model.dart';

StringBuffer _generateConstructor(
  SchemaModel model, {
  required String className,
  bool isSubclass = true,
}) {
  final List<SchemaModel> children = model.children;
  final StringBuffer result = StringBuffer()
    ..write(
      '''
          const $className({
        ''',
    );

  for (int i = 0; i < children.length; i++) {
    final SchemaModel model = children[i];
    if (children[i].isRequired) {
      children.removeAt(i);
      // ignore: cascade_invocations
      children.insert(0, model);
    }
  }

  for (final SchemaModel model in children) {
    result
      ..write('${model.isRequired ? 'required' : ''} ')
      ..write(
        isSubclass ? 'super.${model.fieldName},' : 'this.${model.fieldName},',
      );
  }

  result.write('});');

  return result;
}
