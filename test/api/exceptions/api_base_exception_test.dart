import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('APIBaseException tests =>', () {
    test('should return the correct message.', () {
      final BaseExceptionModel baseExceptionModel =
          BaseExceptionModel(code: 'BAD_REQUEST', message: 'Bad Request');
      final BaseAPIException exception =
          BaseAPIException(baseExceptionModel: baseExceptionModel);

      expect(exception.message, 'Bad Request');
    });

    test('should return the correct code.', () {
      final BaseExceptionModel baseExceptionModel =
          BaseExceptionModel(code: 'BAD_REQUEST', message: 'Bad Request');
      final BaseAPIException exception =
          BaseAPIException(baseExceptionModel: baseExceptionModel);

      expect(exception.code, 'BAD_REQUEST');
    });

    test('should return the correct details.', () {
      final BaseExceptionModel baseExceptionModel = BaseExceptionModel(
        code: 'BAD_REQUEST',
        message: 'Bad Request',
        details: <String, dynamic>{'key': 'value'},
      );
      final BaseAPIException exception =
          BaseAPIException(baseExceptionModel: baseExceptionModel);

      expect(exception.details, <String, dynamic>{'key': 'value'});
    });

    test('should return the correct string representation.', () {
      final BaseExceptionModel baseExceptionModel =
          BaseExceptionModel(code: 'BAD_REQUEST', message: 'Bad Request');
      final BaseAPIException exception =
          BaseAPIException(baseExceptionModel: baseExceptionModel);
      final String stringRepresentation = '$exception';

      expect(stringRepresentation, 'Bad Request');
    });
  });
}
