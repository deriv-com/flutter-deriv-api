import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account_status/account_status.dart';

import 'account_status_mock_data.dart';

void main() {
  test('Account status JSON parsing', () {
    final AccountStatus accountStatus = AccountStatus.fromJson(
        jsonDecode(accountStatusJSON)['get_account_status']);

    expect(accountStatus.status[0], 'financial_information_not_complete');
    expect(accountStatus.status[1], 'trading_experience_not_complete');
    expect(accountStatus.promptClientToAuthenticate, false);
    expect(accountStatus.riskClassification, 'low');
    expect(accountStatus.authentication.document.status, 'none');
  });
}
