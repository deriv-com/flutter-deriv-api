part of '../helpers.dart';

/// Enum case type
enum EnumCase {
  /// Snake case (e.g. snake_case)
  snakeCase,

  /// Param case (e.g. param-case)
  paramCase,
}

/// Converts enum to string
String getStringFromEnum<T>(
  T value, {
  bool snakeCase = true,
}) {
  if (value == null) {
    return null;
  }

  final String item = value.toString().split('.')[1];

  return snakeCase ? ReCase(item).snakeCase : item;
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

                default:
                  return item.compareTo(name) == 0;
              }
            },
            orElse: () => null,
          );

/// Converts a list of enums to a string list
List<String> getStringListFromEnums<T>(
  List<T> values, {
  bool snakeCase = true,
}) =>
    values == null || values.isEmpty
        ? null
        : values
            .map((T value) => getStringFromEnum(value, snakeCase: snakeCase))
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
