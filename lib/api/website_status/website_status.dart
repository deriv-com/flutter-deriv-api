import 'package:flutter_deriv_api/api/models/api_call_limit_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/website_status_crypto_config_model.dart';
import 'package:flutter_deriv_api/api/models/website_status_currency_config_model.dart';
import 'package:flutter_deriv_api/api/models/website_status_model.dart';
import 'package:flutter_deriv_api/utils/enum_helper.dart';

/// Website status class
class WebsiteStatus extends WebsiteStatusModel {
  /// Initializes
  WebsiteStatus({
    ApiCallLimitModel apiCallLimits,
    List<WebsiteStatusCurrencyConfigModel> accountCurrenciesConfig,
    String clientsCountry,
    List<WebsiteStatusCryptoConfigModel> cryptoConfig,
    SiteStatus siteStatus,
    List<String> supportedLanguages,
    String termsConditionsVersion,
  }) : super(
          apiCallLimits: apiCallLimits,
          accountCurrenciesConfig: accountCurrenciesConfig,
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
        accountCurrenciesConfig: json['currencies_config'] == null ||
                json['currencies_config'].isEmpty
            ? null
            : json['currencies_config']
                .entries
                .map<WebsiteStatusCurrencyConfigModel>(
                    (MapEntry<String, dynamic> entry) =>
                        WebsiteStatusCurrencyConfigModel.fromJson(
                            entry.key, entry.value))
                .toList(),
        apiCallLimits: json['api_call_limits'] == null
            ? null
            : ApiCallLimitModel.fromJson(json['api_call_limits']),
        clientsCountry: json['clients_country'],
        cryptoConfig:
            json['crypto_config'] == null || json['crypto_config'].isEmpty
                ? null
                : json['crypto_config']
                    .entries
                    .map<WebsiteStatusCryptoConfigModel>(
                        (MapEntry<String, dynamic> entry) =>
                            WebsiteStatusCryptoConfigModel.fromJson(
                                entry.key, entry.value))
                    .toList(),
        siteStatus: EnumHelper.getEnum(
          values: SiteStatus.values,
          name: json['site_status'],
        ),
        supportedLanguages: json['supported_languages'] == null
            ? null
            : json['supported_languages']
                .map<String>((dynamic entry) => entry.toString())
                .toList(),
        termsConditionsVersion: json['terms_conditions_version'],
      );

  /// Clones a new instance
  WebsiteStatus copyWith({
    ApiCallLimitModel apiCallLimits,
    List<WebsiteStatusCurrencyConfigModel> accountCurrenciesConfig,
    String clientsCountry,
    List<WebsiteStatusCryptoConfigModel> cryptoConfig,
    List<WebsiteStatusCurrencyConfigModel> localCurrenciesConfig,
    SiteStatus siteStatus,
    List<String> supportedLanguages,
    String termsConditionsVersion,
  }) =>
      WebsiteStatus(
        apiCallLimits: apiCallLimits ?? this.apiCallLimits,
        accountCurrenciesConfig:
            accountCurrenciesConfig ?? this.accountCurrenciesConfig,
        clientsCountry: clientsCountry ?? this.clientsCountry,
        cryptoConfig: cryptoConfig ?? this.cryptoConfig,
        siteStatus: siteStatus ?? this.siteStatus,
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        termsConditionsVersion:
            termsConditionsVersion ?? this.termsConditionsVersion,
      );
}
