import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/common/models/api_call_limit_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_crypto_config_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_currency_config_model.dart';
import 'package:flutter_deriv_api/api/common/models/website_status_model.dart';
import 'package:flutter_deriv_api/api/common/website_status/exceptions/website_status_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

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
    this.subscriptionInformation,
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
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      WebsiteStatus(
        currencyConfig: getListFromMap(
          json['currencies_config']?.entries,
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
          json['crypto_config']?.entries,
          itemToTypeCallback: (dynamic item) =>
              WebsiteStatusCryptoConfigModel.fromJson(item.key, item.value),
        ),
        siteStatus: getEnumFromString(
          values: SiteStatus.values,
          name: json['site_status'],
        ),
        supportedLanguages: getListFromMap(json['supported_languages']),
        termsConditionsVersion: json['terms_conditions_version'],
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Subscription information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets Website status
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error
  static Future<WebsiteStatus> fetchWebsiteStatus([
    WebsiteStatusRequest request,
  ]) async {
    final WebsiteStatusResponse response = await _api.call(
      request: request ?? const WebsiteStatusRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return WebsiteStatus.fromJson(response.websiteStatus);
  }

  /// Subscribes to website status
  static Stream<WebsiteStatus> subscribeWebsiteStatus(
    WebsiteStatusRequest request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<WebsiteStatus>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
                WebsiteStatusException(baseExceptionModel: baseExceptionModel),
          );

          return response is WebsiteStatusResponse
              ? WebsiteStatus.fromJson(
                  response.websiteStatus,
                  subscriptionJson: response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from website status
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error
  Future<Forget> unsubscribeWebsiteStatus() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all website status subscriptions.
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllWebsiteStatus() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.ticks);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAll.fromResponse(response);
  }

  /// Generate a copy of instance with given parameters
  WebsiteStatus copyWith({
    ApiCallLimitModel apiCallLimits,
    List<WebsiteStatusCurrencyConfigModel> currencyConfig,
    String clientsCountry,
    List<WebsiteStatusCryptoConfigModel> cryptoConfig,
    List<WebsiteStatusCurrencyConfigModel> localCurrenciesConfig,
    SiteStatus siteStatus,
    List<String> supportedLanguages,
    String termsConditionsVersion,
    SubscriptionModel subscriptionInformation,
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
        subscriptionInformation:
            subscriptionInformation ?? this.subscriptionInformation,
      );
}
