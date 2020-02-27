import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

///
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

///
int getDecimalDigits(String value) {
  final List<String> parts = value.split('.');
  return parts.length > 1 && parts.isNotEmpty ? parts.last.length : 2;
}

///
NumberFormat getValueFormatter({
  String locale = 'en_US',
  String currency,
  @required int decimalDigits,
  bool showSymbol = true,
}) {
  final NumberFormat formatter = NumberFormat.currency(
    decimalDigits: decimalDigits,
    symbol: (showSymbol && currency != null)
        ? NumberFormat().simpleCurrencySymbol(currency)
        : '',
  );

  return formatter;
}

///
String getFormattedValue({
  String value,
  int decimalDigits,
  String currency,
  bool showSymbol = true,
}) => getValueFormatter(
  decimalDigits: decimalDigits ?? getDecimalDigits(value),
  currency: currency,
  showSymbol: showSymbol,
).format(double.parse(value));

///
int getCurrentLocalEpoch() =>
    (DateTime.now().millisecondsSinceEpoch / 1000).round();

///
DateTime getCurrentServerTime(int timeDifference) =>
    DateTime.fromMillisecondsSinceEpoch(
      (getCurrentLocalEpoch() + timeDifference) * 1000,
    );

///
class NumberValidator {
  /// checks if the given [stringValue] is a number
  static bool isANumber(String stringValue) {
    final String newString = stringValue.replaceAll(RegExp(r','), '');
    double result;
    try {
      result = double.parse(newString);
    } on Exception{
      return false;
    }
    return result != null;
  }

  ///
  static bool isBetweenLimits({
    @required String stringValue,
    @required double upperLimit,
    @required double lowerLimit,
  }) => isMoreThanLimit(stringValue: stringValue, lowerLimit: lowerLimit) &&
      isLessThanLimit(stringValue: stringValue, upperLimit: upperLimit);

  ///
  static bool isLessThanLimit({
    @required String stringValue,
    @required double upperLimit,
  }) {
    final double num = double.parse(stringValue);
    return num <= upperLimit;
  }

  ///
  static bool isMoreThanLimit({
    @required String stringValue,
    @required double lowerLimit,
  }) {
    final double num = double.parse(stringValue);
    return num >= lowerLimit;
  }

  ///
  static bool isAPositiveNumber(String stringValue) {
    final double num = double.parse(stringValue);
    return num > 0;
  }

  ///
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

///
class RandomGenerator {
  /// Random int between [min] & [max]
  static int generateRandomInt({
    int min = 0,
    int max = 10,
  }) =>
      min + Random().nextInt(max - min);
}
