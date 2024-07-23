// ignore_for_file: avoid_redundant_argument_values

import 'package:test/test.dart';

import 'package:flutter_deriv_api/helpers/date_time_helper.dart';

void main() {
  group('getCurrentLocalEpoch tests =>', () {
    test('should return current epoch time in seconds.', () {
      final int result = getCurrentLocalEpoch();

      expect(result, isA<int>());
    });
  });

  group('getCurrentServerTime tests =>', () {
    test('should return current server time.', () {
      const int timeDifference = 3600;
      final DateTime result = getCurrentServerTime(timeDifference);

      expect(result, isA<DateTime>());
    });
  });

  group('getDateTime tests =>', () {
    test('should return DateTime from time in seconds.', () {
      const int timeInSeconds = 1633459200;
      final DateTime? result = getDateTime(timeInSeconds);

      expect(result, isA<DateTime>());
      expect(result?.year, 2021);
      expect(result?.month, 10);
      expect(result?.day, 5);
      expect(result?.hour, 18);
      expect(result?.minute, 40);
      expect(result?.second, 0);
    });

    test('should return null for null time in seconds.', () {
      final DateTime? result = getDateTime(null);

      expect(result, null);
    });
  });

  group('getDateTimeFromString tests =>', () {
    test('should return DateTime from string in seconds.', () {
      const String timeInSeconds = '1633459200';
      final DateTime? result = getDateTimeFromString(timeInSeconds);

      expect(result, isA<DateTime>());
      expect(result?.year, 2021);
      expect(result?.month, 10);
      expect(result?.day, 5);
      expect(result?.hour, 18);
      expect(result?.minute, 40);
      expect(result?.second, 0);
    });

    test('should return null for null string.', () {
      final DateTime? result = getDateTimeFromString(null);

      expect(result, null);
    });

    test('should return null for invalid string.', () {
      final DateTime? result = getDateTimeFromString('invalid');

      expect(result, null);
    });
  });

  group('getSecondsSinceEpoch tests =>', () {
    test('should return seconds since epoch from milliseconds since epoch.',
        () {
      const int millisecondsSinceEpoch = 1633459200000;
      final int result = getSecondsSinceEpoch(millisecondsSinceEpoch);

      expect(result, 1633459200);
    });
  });

  group('getSecondsSinceEpochDateTime tests =>', () {
    test('should return seconds since epoch from DateTime object.', () {
      final DateTime dateTime = DateTime.utc(2021, 10, 6, 0, 0, 0);
      final int? result = getSecondsSinceEpochDateTime(dateTime);

      expect(result, 1633478400);
    });

    test('should return null for null DateTime.', () {
      final int? result = getSecondsSinceEpochDateTime(null);

      expect(result, null);
    });
  });

  group('getStringFromDateTime tests =>', () {
    test('should return formatted string from DateTime object.', () {
      final DateTime dateTime = DateTime.utc(2021, 10, 6);
      final String? result = getStringFromDateTime(dateTime);

      expect(result, '2021-10-06');
    });

    test('should return null for null DateTime.', () {
      final String? result = getStringFromDateTime(null);

      expect(result, null);
    });

    test('should return formatted string with custom pattern.', () {
      final DateTime dateTime = DateTime.utc(2021, 10, 6);
      final String? result =
          getStringFromDateTime(dateTime, pattern: 'MM/dd/yyyy');

      expect(result, '10/06/2021');
    });
  });
}
