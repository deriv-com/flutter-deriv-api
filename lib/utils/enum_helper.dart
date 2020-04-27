import 'package:recase/recase.dart';

/// Enum helper class
class EnumHelper<T> {
  /// Converts enum to string
  static String getString<T>({
    T value,
    bool snakeCase = true,
  }) {
    if (value == null) {
      return null;
    }

    final String item = value.toString().split('.')[1];

    return snakeCase ? ReCase(item).snakeCase : item;
  }

  /// Gets enum form a string
  static T getEnum<T>({
    List<T> values,
    String name,
    bool snakeCase = true,
  }) {
    if (name == null || values == null || values.isEmpty) {
      return null;
    }

    return values.firstWhere(
      (T enumItem) {
        final String item = enumItem.toString().split('.')[1];

        return (snakeCase ? ReCase(item).snakeCase : item).compareTo(name) == 0;
      },
      orElse: () => null,
    );
  }
}
