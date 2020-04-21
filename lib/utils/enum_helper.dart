import 'package:recase/recase.dart';

/// Enum helper class
class EnumHelper<T> {
  /// Parse enum to String
  static String parse<T>({
    T enumItem,
    bool camelCase = true,
  }) {
    if (enumItem == null) {
      return null;
    }

    final String _tmp = enumItem.toString().split('.')[1];

    return camelCase ? ReCase(_tmp).camelCase : _tmp;
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
              .camelCase
              .compareTo(value) ==
          0,
      orElse: () => null,
    );
  }
}
