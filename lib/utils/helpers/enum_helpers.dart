part of '../helpers.dart';

/// ReCase of enum
enum EnumCase {
  /// snake_case
  snakeCase,

  /// param-case
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
}) {
  if (name == null || values == null || values.isEmpty) {
    return null;
  }

  return values.firstWhere(
    (T enumItem) {
      final String item = enumItem.toString().split('.')[1];

      String itemReCase;
      switch (enumCase) {
        case EnumCase.snakeCase:
          itemReCase = ReCase(item).snakeCase;
          break;
        case EnumCase.paramCase:
          itemReCase = ReCase(item).paramCase;
          break;
        default:
          itemReCase = item;
      }

      return itemReCase.compareTo(name) == 0;
    },
    orElse: () => null,
  );
}

/// Converts a list of enums to a string list
List<String> getStringListFromEnums<T>(
  List<T> values, {
  bool snakeCase = true,
}) {
  if (values == null || values.isEmpty) {
    return null;
  }

  return values
      .map((T value) => getStringFromEnum(value, snakeCase: snakeCase))
      .toList();
}

/// Converts a list of strings to a enum list
List<T> getEnumListFromStrings<T>({
  @required List<T> values,
  @required List<String> names,
  EnumCase enumCase = EnumCase.snakeCase,
}) {
  if (names == null || names.isEmpty) {
    return null;
  }

  return names
      .map((String name) => getEnumFromString(
            values: values,
            name: name,
            enumCase: enumCase,
          ))
      .toList();
}
