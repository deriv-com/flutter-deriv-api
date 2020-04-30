import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/verify_email_model.dart';
import 'verify_email_mock_data.dart';

void main() {
  test('Verify email JSON parsing', () {
    final VerifyEmailModel verifyEmailModel =
        VerifyEmailModel.fromJson(jsonDecode(verifyEmailJSON));
    expect(verifyEmailModel.verified, true);
  });
}
