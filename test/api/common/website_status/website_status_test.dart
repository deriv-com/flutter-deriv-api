import 'package:flutter_deriv_api/api/common/models/transfer_fee_model.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/models/transfer_account_limitation_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_crypto_config_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_currency_config_model.dart';
import 'package:flutter_deriv_api/api/common/website_status/website_status.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Website Status Test', () async {
    final WebsiteStatus websiteStatus =
        await WebsiteStatus.fetchWebsiteStatus();

    expect(websiteStatus.clientsCountry, 'us');
    expect(websiteStatus.termsConditionsVersion, 'Version 48 2019-05-10');
    expect(websiteStatus.currencyConfig!.length, 2);
    expect(websiteStatus.supportedLanguages!.length, 4);
    expect(websiteStatus.supportedLanguages!.first, 'EN');
    expect(websiteStatus.siteStatus, SiteStatus.up);

    final List<WebsiteStatusCurrencyConfigModel?> currencyConfigs =
        websiteStatus.currencyConfig!;

    expect(currencyConfigs.length, 2);

    final WebsiteStatusCurrencyConfigModel aud = currencyConfigs.first!;

    expect(aud.name, 'Australian Dollar');
    expect(aud.code, 'USD');
    expect(aud.isSuspended, false);
    expect(aud.stakeDefault, 10.0);
    expect(aud.type, CurrencyType.fiat);
    expect(aud.fractionalDigits, 2);

    final TransferAccountLimitationModel audLimitations =
        aud.transferBetweenAccounts!;

    final List<TransferFeeModel?> fees = audLimitations.fees!;
    final TransferFeeModel firstFee = fees.first!;

    expect(audLimitations.limits!.min, 1.53);
    expect(fees.length, 3);
    expect(firstFee.code, 'BTC');
    expect(firstFee.value, 2.0);

    final List<WebsiteStatusCryptoConfigModel?> cryptoConfig =
        websiteStatus.cryptoConfig!;
    final WebsiteStatusCryptoConfigModel firstCryptoConfig =
        cryptoConfig.first!;

    expect(cryptoConfig.length, 2);
    expect(firstCryptoConfig.code, 'BTC');
    expect(firstCryptoConfig.minimumWithdrawal, 0.00299415);
  });
}
