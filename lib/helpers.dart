import 'dart:math';
// TODO(Morteza): Unfortunately, the `json_schema` lib has conflicts with the latest version of Intl.
// import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

/// Parses the [url] and gets the endpoint out of it
String parseWSUrl(String url, {bool isAuthUrl = false}) {
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

/// Calculates the number of decimal digits for string [value] of a number
int getDecimalDigits(String value) {
  final List<String> parts = value.split('.');
  return parts.length > 1 && parts.isNotEmpty ? parts.last.length : 2;
}

/// Creates [NumberFormat] with options specified
// TODO(Morteza): The funciton has been commented since it need Intl lib. Unfortunately, the `json_schema` lib has conflicts with the latest version of Intl.
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

/// Fetches the device time
int getCurrentLocalEpoch() =>
    (DateTime.now().millisecondsSinceEpoch / 1000).round();

/// Calculates the server time
DateTime getCurrentServerTime(int timeDifference) =>
    DateTime.fromMillisecondsSinceEpoch(
      (getCurrentLocalEpoch() + timeDifference) * 1000,
    );

/// Checks if a string value of number is a valid number
class NumberValidator {
  /// checks if the given [stringValue] is a number
  static bool isANumber(String stringValue) {
    final String newString = stringValue.replaceAll(RegExp(r','), '');
    double result;
    try {
      result = double.parse(newString);
    } on Exception {
      return false;
    }
    return result != null;
  }

  /// Checks if [stringValue] of a number is in the range of
  /// [lowerLimit] & [upperLimit]
  static bool isBetweenLimits({
    @required String stringValue,
    @required double upperLimit,
    @required double lowerLimit,
  }) =>
      isMoreThanLimit(stringValue: stringValue, lowerLimit: lowerLimit) &&
      isLessThanLimit(stringValue: stringValue, upperLimit: upperLimit);

  /// Checks if [stringValue] of a number is less than [upperLimit]
  static bool isLessThanLimit({
    @required String stringValue,
    @required double upperLimit,
  }) {
    final double num = double.parse(stringValue);
    return num <= upperLimit;
  }

  /// Checks if [stringValue] of number exceeds the given value
  static bool isMoreThanLimit({
    @required String stringValue,
    @required double lowerLimit,
  }) {
    final double num = double.parse(stringValue);
    return num >= lowerLimit;
  }

  /// Checks if number is positive
  static bool isAPositiveNumber(String stringValue) {
    final double num = double.parse(stringValue);
    return num > 0;
  }

  /// Checks if the [stringValue] of number matches
  /// with the [validDecimalNumber]
  static bool hasValidPrecision({
    @required String stringValue,
    @required int validDecimalNumber,
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

/// Generates random int numbers
class RandomGenerator {
  /// Random int between [min] & [max]
  static int generateRandomInt({
    int min = 0,
    int max = 10,
  }) =>
      min + Random().nextInt(max - min);
}
