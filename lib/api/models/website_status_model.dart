import 'api_call_limit_model.dart';
import 'base_model.dart';
import 'enums.dart';
import 'website_status_crypto_config_model.dart';
import 'website_status_currency_config_model.dart';

/// Server status and other information regarding general settings
class WebsiteStatusModel extends BaseModel {
  /// Initializes
  WebsiteStatusModel({
    this.apiCallLimits,
    this.accountCurrenciesConfig,
    this.clientsCountry,
    this.cryptoConfig,
    this.siteStatus,
    this.supportedLanguages,
    this.termsConditionsVersion,
    this.localCurrenciesConfig,
  });

  /// Initializes from map
  factory WebsiteStatusModel.fromJson(
    Map<String, dynamic> websiteStatusJson,
    Map<String, dynamic> localCurrencyJson,
  ) =>
      WebsiteStatusModel(
        accountCurrenciesConfig: websiteStatusJson['currencies_config']
            .entries
            .map((MapEntry<String, dynamic> entry) =>
                WebsiteStatusCurrencyConfigModel.fromJson(
                    entry.key, entry.value))
            .toList(),
        apiCallLimits:
            ApiCallLimitModel.fromJson(websiteStatusJson['api_call_limits']),
        clientsCountry: websiteStatusJson['clients_country'],
        cryptoConfig: (websiteStatusJson['crypto_config'])
            .entries
            .map((MapEntry<String, dynamic> entry) =>
                WebsiteStatusCryptoConfigModel.fromMap(entry.key, entry.value))
            .toList(),
        localCurrenciesConfig: localCurrencyJson.entries
            .map((dynamic entry) => WebsiteStatusCurrencyConfigModel.fromJson(
                entry.key, entry.value))
            .toList(),
        siteStatus: websiteStatusJson['clients_country'] == 'up'
            ? SiteStatus.up
            : SiteStatus.down,
        supportedLanguages: websiteStatusJson['supported_languages']
            .map<String>((dynamic entry) => entry.toString())
            .toList(),
        termsConditionsVersion: websiteStatusJson['terms_conditions_version'],
      );

  /// Maximum number of API calls during specified period of time.
  final ApiCallLimitModel apiCallLimits;

  /// Available currencies and their information
  final List<WebsiteStatusCurrencyConfigModel> accountCurrenciesConfig;

  /// Country code of connected IP
  final String clientsCountry;

  /// Provides minimum withdrawal for all crypto currency in USD
  final List<WebsiteStatusCryptoConfigModel> cryptoConfig;

  /// Local currencies and their information
  final List<WebsiteStatusCurrencyConfigModel> localCurrenciesConfig;

  /// he current status of the website.
  final SiteStatus siteStatus;

  /// Provides codes for languages supported.
  final List<String> supportedLanguages;

  /// Latest terms and conditions version.
  final String termsConditionsVersion;

  /// Clones a new instance
  WebsiteStatusModel copyWith({
    ApiCallLimitModel apiCallLimits,
    List<WebsiteStatusCurrencyConfigModel> accountCurrenciesConfig,
    String clientsCountry,
    List<WebsiteStatusCryptoConfigModel> cryptoConfig,
    List<WebsiteStatusCurrencyConfigModel> localCurrenciesConfig,
    SiteStatus siteStatus,
    List<String> supportedLanguages,
    String termsConditionsVersion,
  }) =>
      WebsiteStatusModel(
        apiCallLimits: apiCallLimits ?? this.apiCallLimits,
        accountCurrenciesConfig:
            accountCurrenciesConfig ?? this.accountCurrenciesConfig,
        clientsCountry: clientsCountry ?? this.clientsCountry,
        cryptoConfig: cryptoConfig ?? this.cryptoConfig,
        localCurrenciesConfig:
            localCurrenciesConfig ?? this.localCurrenciesConfig,
        siteStatus: siteStatus ?? this.siteStatus,
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        termsConditionsVersion:
            termsConditionsVersion ?? this.termsConditionsVersion,
      );
}
