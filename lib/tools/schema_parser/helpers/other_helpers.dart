part of '../schema_model.dart';

StringBuffer _generateProperties({required SchemaModel model}) {
  final StringBuffer result = StringBuffer();

  for (final SchemaModel model in model.children) {
    result.write(
      '''
          /// ${model.description}
          final ${model.classType}${model.isRequired ? '' : '?'} ${model.fieldName};
        ''',
    );
  }

  return result;
}
