import 'dart:math';

/// Calculates the number of decimal digits for string [value] of a number
int getDecimalDigits(String value) {
  final List<String> parts = value.split('.');

  return parts.length > 1 && parts.isNotEmpty ? parts.last.length : 2;
}

/// Creates [NumberFormat] with options specified
// TODO(Morteza): The function has been commented since it need Intl lib. Unfortunately, the `json_schema` lib has conflicts with the latest version of Intl.
// NumberFormat getValueFormatter({
//   String locale = 'en_US',
//   String currency,
//   @required int decimalDigits,
//   bool showSymbol = true,
// }) {
//   final NumberFormat formatter = NumberFormat.currency(
//     decimalDigits: decimalDigits,
//     symbol: (showSymbol && currency != null)
//         ? NumberFormat().simpleCurrencySymbol(currency)
//         : '',
//   );
//
//   return formatter;
// }

/// Formats a string [value] of number [decimalDigits] and [currency] symbol
// TODO(Morteza): The funciton has been commented since it need Intl lib. Unfortunately, the `json_schema` lib has conflicts with the latest version of Intl.
// String getFormattedValue({
//   String value,
//   int decimalDigits,
//   String currency,
//   bool showSymbol = true,
// }) =>
//     getValueFormatter(
//       decimalDigits: decimalDigits ?? getDecimalDigits(value),
//       currency: currency,
//       showSymbol: showSymbol,
//     ).format(double.parse(value));

/// Checks if a string value of number is a valid number
class NumberValidator {
  /// checks if the given [stringValue] is a number
  static bool isANumber(String stringValue) {
    final String newString = stringValue.replaceAll(RegExp(r','), '');

    try {
      double.parse(
        newString,
      );
    } on Exception {
      return false;
    }

    return true;
  }

  /// Checks if [stringValue] of a number is in the range of [lowerLimit] and [upperLimit]
  static bool isBetweenLimits({
    required String stringValue,
    required double upperLimit,
    required double lowerLimit,
  }) =>
      isMoreThanLimit(stringValue: stringValue, lowerLimit: lowerLimit) &&
      isLessThanLimit(stringValue: stringValue, upperLimit: upperLimit);

  /// Checks if [stringValue] of a number is less than [upperLimit]
  static bool isLessThanLimit({
    required String stringValue,
    required double upperLimit,
  }) =>
      double.parse(stringValue) <= upperLimit;

  /// Checks if [stringValue] of number exceeds the given value
  static bool isMoreThanLimit({
    required String stringValue,
    required double lowerLimit,
  }) =>
      double.parse(stringValue) >= lowerLimit;

  /// Checks if number is positive
  static bool isAPositiveNumber(String stringValue) =>
      double.parse(stringValue) > 0;

  /// Checks if the [stringValue] of number matches with the [validDecimalNumber]
  static bool hasValidPrecision({
    required String stringValue,
    required int validDecimalNumber,
  }) {
    final List<String> splitValue = stringValue.split('.');

    if (splitValue.length >= 2) {
      if ((splitValue[1].length) <= validDecimalNumber) {
        return true;
      }
    } else {
      return true;
    }

    return false;
  }
}

/// Random int between [min] and [max]
int generateRandomInt({
  int min = 0,
  int max = 10,
}) =>
    min + Random().nextInt(max - min);

/// Parse double value from string or number value.
double? getDouble(dynamic value) => value is String
    ? double.tryParse(value)
    : value is num
        ? value.toDouble()
        : null;
