import 'package:test/test.dart';

import 'package:flutter_deriv_api/helpers/boolean_helper.dart';

void main() {
  group('getBool tests =>', () {
    test('should return true for 1.', () {
      final bool? result = getBool(1);
      expect(result, true);
    });

    test('should return true for true.', () {
      final bool? result = getBool(true);
      expect(result, true);
    });

    test('should return false for 0.', () {
      final bool? result = getBool(0);
      expect(result, false);
    });

    test('should return false for false.', () {
      final bool? result = getBool(false);
      expect(result, false);
    });

    test('should return null for null.', () {
      final bool? result = getBool(null);
      expect(result, null);
    });
  });

  group('getInt tests =>', () {
    test('should return 1 for true.', () {
      final int? result = getInt(value: true);
      expect(result, 1);
    });

    test('should return 0 for false.', () {
      final int? result = getInt(value: false);
      expect(result, 0);
    });

    test('should return null for null.', () {
      final int? result = getInt();
      expect(result, null);
    });
  });
}
