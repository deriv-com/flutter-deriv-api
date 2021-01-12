import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/website_status_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Website Status Test', () async {
    final WebsiteStatusResponse websiteStatusResponse =
        await WebsiteStatusResponse.fetchWebsiteStatus();

    final WebsiteStatus websiteStatus = websiteStatusResponse.websiteStatus;

    expect(websiteStatus.clientsCountry, 'us');
    expect(websiteStatus.termsConditionsVersion, 'Version 48 2019-05-10');
    expect(websiteStatus.currenciesConfig.length, 2);
    expect(websiteStatus.supportedLanguages.length, 4);
    expect(websiteStatus.supportedLanguages.first, 'EN');
    expect(websiteStatus.siteStatus, SiteStatusEnum.up);

    // final List<WebsiteStatusCurrencyConfigModel> currencyConfigs =
    //     websiteStatus.currenciesConfig;

    // expect(currencyConfigs.length, 2);

    // final WebsiteStatusCurrencyConfigModel aud = currencyConfigs.first;

    // expect(aud.name, 'Australian Dollar');
    // expect(aud.code, 'USD');
    // expect(aud.isSuspended, false);
    // expect(aud.stakeDefault, 10.0);
    // expect(aud.type, CurrencyType.fiat);
    // expect(aud.fractionalDigits, 2);

    // final TransferAccountLimitationModel audLimitations =
    //     aud.transferBetweenAccounts;

    // expect(audLimitations.limits.min, 1.53);
    // expect(audLimitations.fees.length, 3);
    // expect(audLimitations.fees.first.code, 'BTC');
    // expect(audLimitations.fees.first.value, 2.0);

    // final List<WebsiteStatusCryptoConfigModel> cryptoConfig =
    //     websiteStatus.cryptoConfig;

    // expect(cryptoConfig.length, 2);
    // expect(cryptoConfig.first.code, 'BTC');
    // expect(cryptoConfig.first.minimumWithdrawal, 0.00299415);
  });
}
