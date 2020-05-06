import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/application/new_account/new_account_real.dart';

import 'new_account_real_model_mock_data.dart';

void main() {
  test('new account real JSON parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(newAccountRealModelMockData);
    final NewAccountReal newAccountReal =
        NewAccountReal.fromJson(mapData['new_account_real']);

    expect(newAccountReal.clientId, 'CR0000');
    expect(newAccountReal.landingCompany, 'landing_company');
    expect(newAccountReal.landingCompanyShort, 'landing_company_short');
    expect(newAccountReal.oauthToken, 'sample_token');
  });
}
