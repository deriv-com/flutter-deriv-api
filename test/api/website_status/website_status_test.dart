import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/website_status/website_status.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/website_status_currency_config_model.dart';
import 'package:flutter_deriv_api/api/models/website_status_crypto_config_model.dart';
import 'package:flutter_deriv_api/api/models/transfer_account_limitation_model.dart';

import 'website_status_mock_data.dart';

void main() {
  test('Website status', () {
    final Map<String, dynamic> websiteStatusMap = jsonDecode(websiteStatusJSON);
    final WebsiteStatus websiteStatus =
        WebsiteStatus.fromJson(websiteStatusMap['website_status']);

    expect(websiteStatus.clientsCountry, 'us');
    expect(websiteStatus.termsConditionsVersion, 'Version 48 2019-05-10');
    expect(websiteStatus.accountCurrenciesConfig.length, 2);
    expect(websiteStatus.supportedLanguages.length, 4);
    expect(websiteStatus.supportedLanguages.first, 'EN');
    expect(websiteStatus.siteStatus, SiteStatus.up);

    final List<WebsiteStatusCurrencyConfigModel> currencyConfigs =
        websiteStatus.accountCurrenciesConfig;

    expect(currencyConfigs.length, 2);

    final WebsiteStatusCurrencyConfigModel aud = currencyConfigs.first;

    expect(aud.name, 'Australian Dollar');
    expect(aud.code, 'AUD');
    expect(aud.isSuspended, false);
    expect(aud.stakeDefault, 10.0);
    expect(aud.type, CurrencyType.fiat);
    expect(aud.fractionalDigits, 2);

    final TransferAccountLimitationModel audLimitations =
        aud.transferBetweenAccounts;

    expect(audLimitations.limits.min, 1.53);
    expect(audLimitations.fees.length, 3);
    expect(audLimitations.fees.first.code, 'BTC');
    expect(audLimitations.fees.first.value, 2.0);

    final List<WebsiteStatusCryptoConfigModel> cryptos =
        websiteStatus.cryptoConfig;

    expect(cryptos.length, 2);
    expect(cryptos.first.code, 'BTC');
    expect(cryptos.first.minimumWithdrawal, 0.00299415);
  });
}
