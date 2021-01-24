import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

/// Represents dynamic type. mostly used for unknown types.
const String dynamicType = 'dynamic';

/// Model to store schema information
class SchemaModel extends Object {
  /// Default constructor
  SchemaModel();

  /// constructor for dynamic models
  factory SchemaModel.dynamicModel() => SchemaModel()
    ..classType = dynamicType
    ..schemaType = dynamicType;

  /// Create new `SchemaModel` parrent for given children
  factory SchemaModel.newModelWithChildren(
      {@required List<SchemaModel> children, @required String className}) {
    final SchemaModel rootModel = SchemaModel()
      ..className = className
      ..children = children;

    for (final SchemaModel model in children) {
      model.parrent = rootModel;
    }
    return rootModel;
  }

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

  /// Holding all possible types of this schema when it cloud be one of them
  List<SchemaModel> multiTypes = <SchemaModel>[];

  /// Schema array type (for Arrays)
  SchemaModel schemaArrType;

  /// List of nested classes (for Objs)
  List<SchemaModel> children = <SchemaModel>[];

  /// Parrent Model
  SchemaModel parrent;

  /// Values of enum model (for now it only supports String type)
  List<String> enumValues;

  /// Field title
  String get fieldName => ReCase(schemaTitle).camelCase;

  /// Class name
  String _className;

  /// Class name
  set className(String className) {
    _className = className;
  }

  /// True if this model is an Enum
  bool get isEnum => enumValues != null;

  /// Class name
  String get className => _className ?? ReCase(schemaTitle).pascalCase;

  /// Returns enum name format of this model
  String get enumName => '${ReCase(schemaTitle).pascalCase}Enum';

  /// True if this model type is array
  bool get isArray => schemaType == 'array';

  @override
  String toString() => '''
    {
      title: $schemaTitle,
      type: $schemaType,
      classType: $classType,
      multiTypes: $multiTypes,
      children: $children,
    } 
    ''';
}
