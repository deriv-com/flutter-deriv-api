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
    List<T> enumItems,
    String value,
    bool snakeCase = true,
  }) {
    if (enumItems == null || enumItems.isEmpty) {
      return null;
    }

    return enumItems.firstWhere(
      (T enumItem) {
        final String item = enumItem.toString().split('.')[1];

        return (snakeCase ? ReCase(item).snakeCase : item).compareTo(value) ==
            0;
      },
      orElse: () => null,
    );
  }
}
