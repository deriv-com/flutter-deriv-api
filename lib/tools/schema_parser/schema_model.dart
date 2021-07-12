import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/tools/schema_parser/json_schema_parser.dart';
import 'package:recase/recase.dart';

part 'helpers/from_json_helper.dart';
part 'helpers/to_json_helper.dart';
part 'helpers/copy_with_helper.dart';
part 'helpers/constructor_helper.dart';
part 'helpers/enum_helper.dart';
part 'helpers/other_helpers.dart';

/// Represents dynamic type. mostly used for unknown types.
const String dynamicType = 'dynamic';

/// Model to store schema information.
class SchemaModel extends Object {
  /// Default constructor
  SchemaModel();

  /// constructor for dynamic models.
  factory SchemaModel.dynamicModel() => SchemaModel()
    ..classType = dynamicType
    ..schemaType = dynamicType;

  /// Create new `SchemaModel` parent for given children.
  factory SchemaModel.newModelWithChildren(
      {required List<SchemaModel> children, required String className}) {
    final SchemaModel rootModel = SchemaModel()
      ..className = className
      ..children = children;

    for (final SchemaModel model in children) {
      model.parent = rootModel;
    }
    return rootModel;
  }

  /// Object type.
  String? classType;

  /// Is required field.
  bool isRequired = false;

  /// Field description.
  String? description;

  /// Schema object field title.
  late String schemaTitle;

  /// Schema object field type.
  String? schemaType;

  /// Holding all possible types of this schema when it cloud be one of them.
  List<SchemaModel> multiTypes = <SchemaModel>[];

  /// Schema array type (for Arrays).
  SchemaModel? schemaArrType;

  /// List of nested classes (for Objects).
  List<SchemaModel> children = <SchemaModel>[];

  /// Parent Model.
  SchemaModel? parent;

  /// Values of enum model (for now it only supports String type).
  List<String>? enumValues;

  /// Required fields.
  List<dynamic>? requiredFields = <String>[];

  /// Field title.
  String get fieldName => ReCase(schemaTitle).camelCase;

  /// Class name.
  String? _className;

  /// Set class name.
  set className(String className) {
    _className = className;
  }

  /// True if this model is an Enum.
  bool get isEnum => enumValues != null;

  /// Get class name.
  String get className => _className ?? ReCase(schemaTitle).pascalCase;

  /// Returns enum name format of this model.
  String get enumName => '${ReCase(schemaTitle).pascalCase}Enum';

  /// True if this model type is array.
  bool get isArray => schemaType == 'array';

  /// Gets String of FromJson function for this model.
  StringBuffer getFromJson({bool isRoot = false}) =>
      _generateFromJson(model: this, isRoot: isRoot);

  /// Gets String of ToJson function for this model.
  StringBuffer getToJson() => _generateToJson(model: this);

  /// Gets String of copyWith function for this model.
  StringBuffer getCopyWith() => _generateCopyWith(model: this);

  /// Gets String of constructor function for this model.
  StringBuffer getConstructor({
    required String className,
    bool isSubclass = true,
  }) =>
      _generateConstructor(
        model: this,
        className: className,
        isSubclass: isSubclass,
      );

  /// Gets String of enums for this model.
  StringBuffer getEnum() => _generateEnums(model: this);

  /// Gets String of properties for this model.
  StringBuffer getProperties() => _generateProperties(model: this);

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
