import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('APIBaseException tests =>', () {
    test('should return the correct message.', () {
      final BaseExceptionModel baseExceptionModel =
          BaseExceptionModel(code: '400', message: 'Bad Request');
      final APIBaseException exception =
          APIBaseException(baseExceptionModel: baseExceptionModel);

      expect(exception.message, 'Bad Request');
    });

    test('should return the correct code.', () {
      final BaseExceptionModel baseExceptionModel =
          BaseExceptionModel(code: '400', message: 'Bad Request');
      final APIBaseException exception =
          APIBaseException(baseExceptionModel: baseExceptionModel);

      expect(exception.code, '400');
    });

    test('should return the correct details.', () {
      final BaseExceptionModel baseExceptionModel = BaseExceptionModel(
        code: '400',
        message: 'Bad Request',
        details: <String, dynamic>{'key': 'value'},
      );
      final APIBaseException exception =
          APIBaseException(baseExceptionModel: baseExceptionModel);

      expect(exception.details, <String, dynamic>{'key': 'value'});
    });

    test('should return the correct string representation.', () {
      final BaseExceptionModel baseExceptionModel =
          BaseExceptionModel(code: '400', message: 'Bad Request');
      final APIBaseException exception =
          APIBaseException(baseExceptionModel: baseExceptionModel);
      final String stringRepresentation = '$exception';

      expect(stringRepresentation, 'Bad Request');
    });
  });
}
