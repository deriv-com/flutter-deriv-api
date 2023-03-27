import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/website_status_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Website Status Test', () async {
    final WebsiteStatusResponse websiteStatusResponse =
        await WebsiteStatusResponse.fetchWebsiteStatus();

    final WebsiteStatus websiteStatus = websiteStatusResponse.websiteStatus!;

    expect(websiteStatus.clientsCountry, 'de');
    expect(websiteStatus.termsConditionsVersion, 'Version 48 2019-05-10');
    expect(websiteStatus.currenciesConfig.length, 18);
    expect(websiteStatus.supportedLanguages?.length, 13);
    expect(websiteStatus.supportedLanguages?.first, 'EN');
    expect(websiteStatus.siteStatus, SiteStatusEnum.up);

    final Map<String, CurrenciesConfigProperty> currencyConfigs =
        websiteStatus.currenciesConfig;

    expect(currencyConfigs.length, 18);

    final MapEntry<String, CurrenciesConfigProperty> aud =
        currencyConfigs.entries.first;

    expect(aud.key, 'AUD');
    expect(aud.value.isSuspended, 0.0);
    expect(aud.value.stakeDefault, 10.0);
    expect(aud.value.type, TypeEnum.fiat);
    expect(aud.value.fractionalDigits, 2);

    final TransferBetweenAccounts audLimitations =
        aud.value.transferBetweenAccounts;

    expect(audLimitations.limits.min, 1.33);
    expect(audLimitations.fees.length, 17);
    expect(audLimitations.fees.entries.first.key, 'BTC');
    expect(audLimitations.fees.entries.first.value, 2.0);
  });
}
