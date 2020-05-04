import 'package:flutter_deriv_api/api/common/models/api_call_limit_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_crypto_config_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_currency_config_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Website status class
class WebsiteStatus extends WebsiteStatusModel {
  /// Initializes
  WebsiteStatus({
    ApiCallLimitModel apiCallLimits,
    List<WebsiteStatusCurrencyConfigModel> currencyConfig,
    String clientsCountry,
    List<WebsiteStatusCryptoConfigModel> cryptoConfig,
    SiteStatus siteStatus,
    List<String> supportedLanguages,
    String termsConditionsVersion,
  }) : super(
          apiCallLimits: apiCallLimits,
          currencyConfig: currencyConfig,
          clientsCountry: clientsCountry,
          cryptoConfig: cryptoConfig,
          siteStatus: siteStatus,
          supportedLanguages: supportedLanguages,
          termsConditionsVersion: termsConditionsVersion,
        );

  /// Initializes from map
  factory WebsiteStatus.fromJson(
    Map<String, dynamic> json,
  ) =>
      WebsiteStatus(
        currencyConfig: getListFromMap(
          json['currencies_config'].entries,
          itemToTypeCallback: (dynamic item) =>
              WebsiteStatusCurrencyConfigModel.fromJson(item.key, item.value),
        ),
        apiCallLimits: getItemFromMap(
          json['api_call_limits'],
          itemToTypeCallback: (dynamic item) =>
              ApiCallLimitModel.fromJson(item),
        ),
        clientsCountry: json['clients_country'],
        cryptoConfig: getListFromMap(
          json['crypto_config'].entries,
          itemToTypeCallback: (dynamic item) =>
              WebsiteStatusCryptoConfigModel.fromJson(item.key, item.value),
        ),
        siteStatus: getEnumFromString(
          values: SiteStatus.values,
          name: json['site_status'],
        ),
        supportedLanguages: getListFromMap(json['supported_languages']),
        termsConditionsVersion: json['terms_conditions_version'],
      );

  /// Clones a new instance
  WebsiteStatus copyWith({
    ApiCallLimitModel apiCallLimits,
    List<WebsiteStatusCurrencyConfigModel> currencyConfig,
    String clientsCountry,
    List<WebsiteStatusCryptoConfigModel> cryptoConfig,
    List<WebsiteStatusCurrencyConfigModel> localCurrenciesConfig,
    SiteStatus siteStatus,
    List<String> supportedLanguages,
    String termsConditionsVersion,
  }) =>
      WebsiteStatus(
        apiCallLimits: apiCallLimits ?? this.apiCallLimits,
        currencyConfig: currencyConfig ?? this.currencyConfig,
        clientsCountry: clientsCountry ?? this.clientsCountry,
        cryptoConfig: cryptoConfig ?? this.cryptoConfig,
        siteStatus: siteStatus ?? this.siteStatus,
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        termsConditionsVersion:
            termsConditionsVersion ?? this.termsConditionsVersion,
      );
}
