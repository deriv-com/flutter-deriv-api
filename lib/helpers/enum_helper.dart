import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

/// Enum case type
enum EnumCase {
  /// Snake case (e.g. snake_case)
  snakeCase,

  /// Param case (e.g. param-case)
  paramCase,

  /// Uppercase (e.g. uppercase)
  upperCase,
}

/// Simple converter for converting strings to valid enum names which dart would accepts.
String getEnumName(String rawName) {
  final String formatted = rawName.camelCase
      .replaceAll('\'', '')
      .replaceAll(',', '')
      .replaceAll('null', '_null')
      .replaceAll('&', '');
  return formatted.startsWith(RegExp(r'\d')) ? '_$formatted' : formatted;
}

/// Converts enum to string
String getStringFromEnum<T>(
  T value, {
  EnumCase enumCase = EnumCase.snakeCase,
}) {
  if (value == null) {
    return null;
  }

  final String item = value.toString().split('.')[1];

  switch (enumCase) {
    case EnumCase.snakeCase:
      return ReCase(item).snakeCase;
    case EnumCase.paramCase:
      return ReCase(item).paramCase;
    case EnumCase.upperCase:
      return item.toUpperCase();

    default:
      return item;
  }
}

/// Gets enum form a string
T getEnumFromString<T>({
  @required List<T> values,
  @required String name,
  EnumCase enumCase = EnumCase.snakeCase,
}) =>
    name == null || values == null || values.isEmpty
        ? null
        : values.firstWhere(
            (T enumItem) {
              final String item = enumItem.toString().split('.')[1];

              switch (enumCase) {
                case EnumCase.snakeCase:
                  return ReCase(item).snakeCase.compareTo(name) == 0;
                case EnumCase.paramCase:
                  return ReCase(item).paramCase.compareTo(name) == 0;
                case EnumCase.upperCase:
                  return item.toUpperCase().compareTo(name) == 0;

                default:
                  return item.compareTo(name) == 0;
              }
            },
            orElse: () => null,
          );

/// Converts a list of enums to a string list
List<String> getStringListFromEnums<T>(
  List<T> values, {
  EnumCase enumCase = EnumCase.snakeCase,
}) =>
    values == null || values.isEmpty
        ? null
        : values
            .map((T value) => getStringFromEnum(value, enumCase: enumCase))
            .toList();

/// Converts a list of strings to a enum list
List<T> getEnumListFromStrings<T>({
  @required List<T> values,
  @required List<String> names,
  EnumCase enumCase = EnumCase.snakeCase,
}) =>
    names == null || names.isEmpty
        ? null
        : names
            .map((String name) => getEnumFromString(
                  values: values,
                  name: name,
                  enumCase: enumCase,
                ))
            .toList();
