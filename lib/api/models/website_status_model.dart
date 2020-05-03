import 'api_call_limit_model.dart';
import 'api_base_model.dart';
import 'enums.dart';
import 'website_status_crypto_config_model.dart';
import 'website_status_currency_config_model.dart';

/// Server status and other information regarding general settings
abstract class WebsiteStatusModel extends APIBaseModel {
  /// Initializes
  WebsiteStatusModel({
    this.apiCallLimits,
    this.currencyConfig,
    this.clientsCountry,
    this.cryptoConfig,
    this.siteStatus,
    this.supportedLanguages,
    this.termsConditionsVersion,
  });

  /// Maximum number of API calls during specified period of time.
  final ApiCallLimitModel apiCallLimits;

  /// Available currencies and their information
  final List<WebsiteStatusCurrencyConfigModel> currencyConfig;

  /// Country code of connected IP
  final String clientsCountry;

  /// Provides minimum withdrawal for all crypto currency in USD
  final List<WebsiteStatusCryptoConfigModel> cryptoConfig;

  /// he current status of the website.
  final SiteStatus siteStatus;

  /// Provides codes for languages supported.
  final List<String> supportedLanguages;

  /// Latest terms and conditions version.
  final String termsConditionsVersion;
}
