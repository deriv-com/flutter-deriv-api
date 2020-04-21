import 'package:recase/recase.dart';

/// Enum helper class
class EnumHelper<T> {
  /// Parse enum to String
  static String parse<T>({
    T enumItem,
    bool snakeCase = true,
  }) {
    if (enumItem == null) {
      return null;
    }

    final String item = enumItem.toString().split('.')[1];

    return snakeCase ? ReCase(item).snakeCase : item;
  }

  /// Gets enum form a string
  static T getEnum<T>({
    List<T> enumValues,
    String value,
  }) {
    if (enumValues == null || enumValues.isEmpty) {
      return null;
    }

    return enumValues.firstWhere(
      (T enumItem) =>
          ReCase(enumItem.toString().split('.')[1])
              .snakeCase
              .compareTo(value) ==
          0,
      orElse: () => null,
    );
  }
}
