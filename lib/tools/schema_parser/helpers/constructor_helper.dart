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
    final String typePostfix = model.classType == 'dynamic'
        ? ''
        : model.isRequired
            ? ''
            : '?';

    result
      ..write('${model.isRequired ? 'required' : ''} ')
      ..write(
        isSubclass
            ? '${model.classType}$typePostfix ${model.fieldName},'
            : 'this.${model.fieldName},',
      );
  }

  if (isSubclass) {
    result.write('}) : super(');

    for (final SchemaModel model in children) {
      result.write('${model.fieldName}: ${model.fieldName},');
    }

    result.write(');');
  } else {
    result.write('});');
  }

  return result;
}
