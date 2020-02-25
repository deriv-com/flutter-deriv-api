/// A Model to Store Schema Information
class SchemaModel {
  /// Dart Class Name
  String className;

  /// Dart Field Title
  String title;

  /// Dart Object Type
  String type;

  /// Field Description
  String description;

  /// Schema Object Field Title
  String schemaTitle;

  /// Schema Object Field Type
  String schemaType;

  /// List of Nested Classes
  List<SchemaModel> children;
}
