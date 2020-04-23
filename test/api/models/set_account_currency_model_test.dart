import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/set_account_currency.dart';

import 'set_account_currency_model_mock_data.dart';

void main() {
  test('set account currency json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(setAccountExceptionModelMockData);
    final SetAccountCurrency setAccountCurrency =
        SetAccountCurrency.fromJson(mapData);

    expect(setAccountCurrency.setAccountCurrency, true);
  });
}
