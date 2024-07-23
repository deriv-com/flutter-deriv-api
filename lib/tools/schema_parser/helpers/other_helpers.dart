part of '../schema_model.dart';

StringBuffer _generateProperties(SchemaModel model) {
  final StringBuffer result = StringBuffer();

  for (final SchemaModel model in model.children) {
    final String typePostfix = model.classType == 'dynamic'
        ? ''
        : model.isRequired
            ? ''
            : '?';

    result.write(
      '''
          /// ${model.description}
          final ${model.classType}$typePostfix ${model.fieldName};
        ''',
    );
  }

  return result;
}
