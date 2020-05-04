import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_status/account_status.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

import 'account_status_mock_data.dart';

void main() {
  test('Account status JSON parsing', () {
    final Map<String, dynamic> accountStatusMap = jsonDecode(accountStatusJSON);
    final AccountStatus accountStatus =
        AccountStatus.fromJson(accountStatusMap['get_account_status']);

    expect(
      accountStatus.status[0],
      AccountStatusType.financialInformationNotComplete,
    );
    expect(
      accountStatus.status[1],
      AccountStatusType.tradingExperienceNotComplete,
    );
    expect(accountStatus.promptClientToAuthenticate, false);
    expect(accountStatus.riskClassification, AccountRiskClassification.low);
    expect(
      accountStatus.authentication.document.status,
      AccountIdentityStatus.none,
    );
    expect(
      accountStatus.authentication.identity.status,
      AccountIdentityStatus.none,
    );
  });
}
