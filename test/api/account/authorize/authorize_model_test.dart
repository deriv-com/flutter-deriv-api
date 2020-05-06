import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/authorize/account.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/api/account/models/local_currency_model.dart';

import 'authorize_model_mock_data.dart';

void main() {
  test('authorize JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(authorizeModelMockData);
    final Authorize authorize = Authorize.fromJson(mapData['authorize']);
    final List<Account> accounts = authorize.accountList;
    final List<LocalCurrencyModel> localCurrencies = authorize.localCurrencies;

    expect(accounts.length, 2);

    expect(accounts[0].currency, 'USD');
    expect(accounts[1].excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000));
    expect(accounts[0].isDisabled, false);
    expect(accounts[0].isVirtual, false);
    expect(accounts[0].landingCompanyName, 'svg');
    expect(accounts[0].loginId, 'CR90000028');

    expect(accounts[1].currency, 'USD');
    expect(accounts[1].excludedUntil,
        DateTime.fromMillisecondsSinceEpoch(1587486726000));
    expect(accounts[1].isDisabled, false);
    expect(accounts[1].isVirtual, true);
    expect(accounts[1].landingCompanyName, 'virtual');
    expect(accounts[1].loginId, 'VRTC90000028');

    expect(localCurrencies.length, 2);

    expect(localCurrencies[0].currencyCode, 'ZAR');
    expect(localCurrencies[0].fractionalDigits, 2);

    expect(localCurrencies[1].currencyCode, 'USD');
    expect(localCurrencies[1].fractionalDigits, 3);

    expect(authorize.balance, 10000);
    expect(authorize.country, 'za');
    expect(authorize.currency, 'USD');
    expect(authorize.email, 'test@site.com');
    expect(authorize.fullName, 'Ms QA script testSTX');
    expect(authorize.isVirtual, false);
    expect(authorize.landingCompanyFullName, 'Binary (SVG) Ltd.');
    expect(authorize.landingCompanyName, 'svg');
    expect(authorize.loginId, 'CR90000028');
    expect(authorize.scopes.length, 4);
    expect(authorize.upgradeableLandingCompanies.length, 1);
    expect(authorize.userId, 29);
  });
}
