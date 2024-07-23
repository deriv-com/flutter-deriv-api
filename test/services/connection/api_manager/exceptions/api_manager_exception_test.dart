import 'package:test/test.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/exceptions/api_manager_exception.dart';

void main() {
  group('APIManagerException tests =>', () {
    test(
        'should create an APIManagerException instance with the provided message.',
        () {
      final APIManagerException exception =
          APIManagerException(message: 'Test Exception');

      expect(exception, isA<APIManagerException>());
      expect(exception.message, 'Test Exception');
    });

    test(
        'toString should return a string representation of the APIManagerException.',
        () {
      final APIManagerException exception =
          APIManagerException(message: 'Test Exception');

      expect(exception.toString(), 'APIManagerException: Test Exception');
    });
  });
}
