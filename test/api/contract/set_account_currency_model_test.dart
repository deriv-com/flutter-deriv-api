import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/contract/models/set_account_currency_model.dart';

import 'set_account_currency_model_mock_data.dart';

void main() {
  test('set account currency json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(setAccountExceptionModelMockData);
    final SetAccountCurrencyModel setAccountCurrency =
        SetAccountCurrencyModel.fromJson(mapData);

    expect(setAccountCurrency.succeeded, true);
  });
}
