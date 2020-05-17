import 'dart:math';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

part 'date_time_helpers.dart';

part 'number_helpers.dart';

/// Parses the [url] and gets the endpoint out of it
String parseWebSocketUrl(String url, {bool isAuthUrl = false}) {
  if (url == null) {
    return null;
  }

  String result = url;
  final RegExp qaRegx = RegExp('^(qa[0-9]{2})\$', caseSensitive: false);
  final RegExp derivRegx =
      RegExp('((binary|deriv)ws\.(com|app))\$', caseSensitive: false);

  if (qaRegx.hasMatch(result)) {
    result = 'www.binary$result.com';
  }

  if (isAuthUrl && derivRegx.hasMatch(result)) {
    result = derivRegx.stringMatch(result);
  }

  return result;
}

/// Convert int to boolean
bool getBool(int value) => value == null ? null : value == 1;

/// Get list of models from Map
List<T> getListFromMap<T>(
  Iterable<dynamic> mapList, {
  T Function(dynamic item) itemToTypeCallback,
}) {
  if (mapList == null || mapList.isEmpty) {
    return null;
  }

  return mapList
      .map<T>(
        (dynamic item) => itemToTypeCallback == null
            ? item.toString()
            : itemToTypeCallback(item),
      )
      .toList();
}

/// Get model from Map
T getItemFromMap<T>(
  Map<String, dynamic> map, {
  T Function(dynamic item) itemToTypeCallback,
}) {
  if (map == null) {
    return null;
  }

  return itemToTypeCallback(map);
}

/// Converts enum to string
String getStringFromEnum<T>({
  T value,
  bool snakeCase = true,
}) {
  if (value == null) {
    return null;
  }

  final String item = value.toString().split('.')[1];

  return snakeCase ? ReCase(item).snakeCase : item;
}

/// ReCase of enum
enum EnumCase {
  /// snake_case
  snakeCase,

  /// param-case
  paramCase,
}

/// Gets enum form a string
T getEnumFromString<T>({
  List<T> values,
  String name,
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
