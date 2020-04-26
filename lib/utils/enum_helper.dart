import 'package:recase/recase.dart';

/// Enum helper class
class EnumHelper<T> {
  /// Parse enum to String
  static String parse<T>({
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
    if (values == null || values.isEmpty) {
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
