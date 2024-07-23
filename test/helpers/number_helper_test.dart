import 'package:test/test.dart';

import 'package:flutter_deriv_api/helpers/number_helper.dart';

void main() {
  group('getDecimalDigits tests =>', () {
    test('should return 2 for a whole number string.', () {
      expect(getDecimalDigits('123'), equals(2));
    });

    test('should return 2 for a decimal number string.', () {
      expect(getDecimalDigits('123.45'), equals(2));
    });

    test(
        'should return 4 for a decimal number string with more than 2 decimal places.',
        () {
      expect(getDecimalDigits('123.4567'), equals(4));
    });

    test('should return 2 for an empty string.', () {
      expect(getDecimalDigits(''), equals(2));
    });
  });

  group('NumberValidator tests =>', () {
    test('isANumber should return true for a valid number string.', () {
      expect(NumberValidator.isANumber('123'), isTrue);
    });

    test('isANumber should return true for a valid decimal number string.', () {
      expect(NumberValidator.isANumber('123.45'), isTrue);
    });

    test('isANumber should return false for an invalid number string.', () {
      expect(NumberValidator.isANumber('abc'), isFalse);
    });

    test(
        'isBetweenLimits should return true when the value is within the limits.',
        () {
      expect(
        NumberValidator.isBetweenLimits(
          stringValue: '5',
          lowerLimit: 1,
          upperLimit: 10,
        ),
        isTrue,
      );
    });

    test(
        'isBetweenLimits should return false when the value is below the lower limit.',
        () {
      expect(
        NumberValidator.isBetweenLimits(
          stringValue: '5',
          lowerLimit: 10,
          upperLimit: 20,
        ),
        isFalse,
      );
    });

    test(
        'isBetweenLimits should return false when the value is above the upper limit.',
        () {
      expect(
        NumberValidator.isBetweenLimits(
          stringValue: '25',
          lowerLimit: 10,
          upperLimit: 20,
        ),
        isFalse,
      );
    });

    test(
        'isLessThanLimit should return true when the value is less than the upper limit.',
        () {
      expect(
        NumberValidator.isLessThanLimit(stringValue: '5', upperLimit: 10),
        isTrue,
      );
    });

    test(
        'isLessThanLimit should return true when the value is equal to the upper limit.',
        () {
      expect(
        NumberValidator.isLessThanLimit(stringValue: '10', upperLimit: 10),
        isTrue,
      );
    });

    test(
        'isLessThanLimit should return false when the value is greater than the upper limit.',
        () {
      expect(
        NumberValidator.isLessThanLimit(stringValue: '15', upperLimit: 10),
        isFalse,
      );
    });

    test(
        'isMoreThanLimit should return true when the value is greater than the lower limit.',
        () {
      expect(
        NumberValidator.isMoreThanLimit(stringValue: '5', lowerLimit: 1),
        isTrue,
      );
    });

    test(
        'isMoreThanLimit should return true when the value is equal to the lower limit.',
        () {
      expect(
        NumberValidator.isMoreThanLimit(stringValue: '1', lowerLimit: 1),
        isTrue,
      );
    });

    test(
        'isMoreThanLimit should return false when the value is less than the lower limit.',
        () {
      expect(
        NumberValidator.isMoreThanLimit(stringValue: '0', lowerLimit: 1),
        isFalse,
      );
    });

    test('isAPositiveNumber should return true for a positive number string.',
        () {
      expect(NumberValidator.isAPositiveNumber('5'), isTrue);
    });

    test('isAPositiveNumber should return false for a negative number string.',
        () {
      expect(NumberValidator.isAPositiveNumber('-5'), isFalse);
    });

    test('isAPositiveNumber should return false for zero.', () {
      expect(NumberValidator.isAPositiveNumber('0'), isFalse);
    });

    test(
        'hasValidPrecision should return true when the decimal number has valid precision.',
        () {
      expect(
        NumberValidator.hasValidPrecision(
          stringValue: '1.23',
          validDecimalNumber: 2,
        ),
        isTrue,
      );
    });

    test(
        'hasValidPrecision should return true when the whole number is provided.',
        () {
      expect(
        NumberValidator.hasValidPrecision(
          stringValue: '5',
          validDecimalNumber: 2,
        ),
        isTrue,
      );
    });

    test(
        'hasValidPrecision should return false when the decimal number has more decimal places than the valid precision.',
        () {
      expect(
        NumberValidator.hasValidPrecision(
          stringValue: '1.2345',
          validDecimalNumber: 2,
        ),
        isFalse,
      );
    });
  });

  group('generateRandomInt tests =>', () {
    test('should generate a random int between min and max (inclusive).', () {
      final int randomInt = generateRandomInt(min: 1);

      expect(randomInt, greaterThanOrEqualTo(1));
      expect(randomInt, lessThanOrEqualTo(10));
    });

    test('should generate a random int with default min and max values.', () {
      final int randomInt = generateRandomInt();

      expect(randomInt, greaterThanOrEqualTo(0));
      expect(randomInt, lessThanOrEqualTo(10));
    });
  });

  group('getDouble tests =>', () {
    test('should parse double value from a string.', () {
      expect(getDouble('123.45'), equals(123.45));
    });

    test('should parse double value from a number.', () {
      expect(getDouble(123.45), equals(123.45));
    });

    test('should return null for an invalid value.', () {
      expect(getDouble('abc'), isNull);
    });
  });
}
