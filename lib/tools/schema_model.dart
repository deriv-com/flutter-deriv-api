import 'package:recase/recase.dart';

/// Represents dynamic type. mostly used for unknown types.
const String dynamicType = 'dynamic';

/// Model to store schema information
class SchemaModel {
  /// Default constructor
  SchemaModel();

  /// constructor for dynamic models
  factory SchemaModel.dynamicModel() => SchemaModel()
    ..classType = dynamicType
    ..schemaType = dynamicType;

  /// Object type
  String classType;

  /// Is required field
  bool isRequired;

  /// Field description
  String description;

  /// Schema object field title
  String schemaTitle;

  /// Schema object field type
  String schemaType;

  /// Schema array type (for Arrays)
  SchemaModel schemaArrType;

  /// List of nested classes (for Objs)
  List<SchemaModel> children;

  /// Values of enum model (for now it only supports String type)
  List<String> enumValues;

  /// Field title
  String get fieldTitle => ReCase(schemaTitle).camelCase;

  /// Class name
  String get className => ReCase(schemaTitle).pascalCase;

  /// True if this model is an Enum
  bool get isEnum => enumValues != null;

  /// Returns enum name format of this model
  String get enumName => '${ReCase(schemaTitle).pascalCase}Enum';

  /// True if this model type is array
  bool get isArray => schemaType == 'array';
}
