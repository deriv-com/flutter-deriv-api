// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/website_status_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/website_status_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Website status response model class.
abstract class WebsiteStatusResponseModel {
  /// Initializes Website status response model class .
  const WebsiteStatusResponseModel({
    this.websiteStatus,
    this.subscription,
  });

  /// Server status and other information regarding general settings
  final WebsiteStatus? websiteStatus;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Website status response class.
class WebsiteStatusResponse extends WebsiteStatusResponseModel {
  /// Initializes Website status response class.
  const WebsiteStatusResponse({
    WebsiteStatus? websiteStatus,
    Subscription? subscription,
  }) : super(
          websiteStatus: websiteStatus,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory WebsiteStatusResponse.fromJson(
    dynamic websiteStatusJson,
    dynamic subscriptionJson,
  ) =>
      WebsiteStatusResponse(
        websiteStatus: websiteStatusJson == null
            ? null
            : WebsiteStatus.fromJson(websiteStatusJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (websiteStatus != null) {
      resultMap['website_status'] = websiteStatus!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector().get<BaseAPI>()!;

  /// Gets Website status.
  ///
  /// For parameters information refer to [WebsiteStatusRequest].
  /// Throws a [WebsiteStatusException] if API response contains an error.
  static Future<WebsiteStatusReceive> fetchWebsiteStatusRaw([
    WebsiteStatusRequest? request,
  ]) async {
    final WebsiteStatusReceive response = await _api.call(
      request: request ?? const WebsiteStatusRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Subscribes to website status.
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error.
  static Stream<WebsiteStatusReceive?> subscribeWebsiteStatusRaw(
    WebsiteStatusRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<WebsiteStatusReceive?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                WebsiteStatusException(baseExceptionModel: baseExceptionModel),
          );

          return response is WebsiteStatusReceive ? response : null;
        },
      );

  /// Unsubscribes from website status.
  ///
  /// Throws an [WebsiteStatusException] if the API response contains an error.
  Future<ForgetReceive?> unsubscribeWebsiteStatusRaw() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Unsubscribes all website status subscriptions.
  ///
  /// Throws an [WebsiteStatusException] if the API response contains an error.
  static Future<ForgetAllReceive> unsubscribeAllWebsiteStatusRaw() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.websiteStatus);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Gets Website status.
  ///
  /// Throws an [WebsiteStatusException] if the API response contains an error.
  static Future<WebsiteStatusResponse> fetchWebsiteStatus([
    WebsiteStatusRequest? request,
  ]) async {
    final WebsiteStatusReceive response = await fetchWebsiteStatusRaw(request);

    return WebsiteStatusResponse.fromJson(
      response.websiteStatus,
      response.subscription,
    );
  }

  /// Subscribes to website status.
  static Stream<WebsiteStatusResponse?> subscribeWebsiteStatus(
    WebsiteStatusRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeWebsiteStatusRaw(
        request,
        comparePredicate: comparePredicate,
      ).map(
        (WebsiteStatusReceive? response) => response == null
            ? null
            : WebsiteStatusResponse.fromJson(
                response.websiteStatus,
                response.subscription,
              ),
      );

  /// Unsubscribes from website status.
  ///
  /// Throws an [WebsiteStatusException] if the API response contains an error.
  Future<ForgetResponse?> unsubscribeWebsiteStatus() async {
    final ForgetReceive? response = await unsubscribeWebsiteStatusRaw();

    return ForgetResponse.fromJson(response?.forget);
  }

  /// Unsubscribes all website status subscriptions.
  ///
  /// Throws an [WebsiteStatusException] if the API response contains an error.
  static Future<ForgetAllResponse> unsubscribeAllWebsiteStatus() async {
    final ForgetAllReceive response = await unsubscribeAllWebsiteStatusRaw();

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters.
  WebsiteStatusResponse copyWith({
    WebsiteStatus? websiteStatus,
    Subscription? subscription,
  }) =>
      WebsiteStatusResponse(
        websiteStatus: websiteStatus ?? this.websiteStatus,
        subscription: subscription ?? this.subscription,
      );
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "fiat": TypeEnum.fiat,
  "crypto": TypeEnum.crypto,
};

/// Type Enum.
enum TypeEnum {
  /// fiat.
  fiat,

  /// crypto.
  crypto,
}

/// FixedRateAdvertsEnum mapper.
final Map<String, FixedRateAdvertsEnum> fixedRateAdvertsEnumMapper =
    <String, FixedRateAdvertsEnum>{
  "disabled": FixedRateAdvertsEnum.disabled,
  "enabled": FixedRateAdvertsEnum.enabled,
  "list_only": FixedRateAdvertsEnum.listOnly,
};

/// FixedRateAdverts Enum.
enum FixedRateAdvertsEnum {
  /// disabled.
  disabled,

  /// enabled.
  enabled,

  /// list_only.
  listOnly,
}

/// FloatRateAdvertsEnum mapper.
final Map<String, FloatRateAdvertsEnum> floatRateAdvertsEnumMapper =
    <String, FloatRateAdvertsEnum>{
  "disabled": FloatRateAdvertsEnum.disabled,
  "enabled": FloatRateAdvertsEnum.enabled,
  "list_only": FloatRateAdvertsEnum.listOnly,
};

/// FloatRateAdverts Enum.
enum FloatRateAdvertsEnum {
  /// disabled.
  disabled,

  /// enabled.
  enabled,

  /// list_only.
  listOnly,
}

/// SiteStatusEnum mapper.
final Map<String, SiteStatusEnum> siteStatusEnumMapper =
    <String, SiteStatusEnum>{
  "up": SiteStatusEnum.up,
  "down": SiteStatusEnum.down,
  "updating": SiteStatusEnum.updating,
};

/// SiteStatus Enum.
enum SiteStatusEnum {
  /// up.
  up,

  /// down.
  down,

  /// updating.
  updating,
}

/// Website status model class.
abstract class WebsiteStatusModel {
  /// Initializes Website status model class .
  const WebsiteStatusModel({
    required this.currenciesConfig,
    required this.apiCallLimits,
    this.clientsCountry,
    this.dxtradeStatus,
    this.message,
    this.mt5Status,
    this.p2pConfig,
    this.paymentAgents,
    this.siteStatus,
    this.supportedLanguages,
    this.termsConditionsVersion,
  });

  /// Available currencies and their information
  final Map<String, CurrenciesConfigProperty> currenciesConfig;

  /// Maximum number of API calls during specified period of time.
  final ApiCallLimits apiCallLimits;

  /// Country code of connected IP
  final String? clientsCountry;

  /// Suspension status of Dxtrade/DerivX API calls
  final DxtradeStatus? dxtradeStatus;

  /// Text for site status banner, contains problem description. shown only if set by the system.
  final String? message;

  /// Suspension status of MT5 API calls
  final Mt5Status? mt5Status;

  /// Peer-to-peer payment system settings.
  final P2pConfig? p2pConfig;

  /// Payments Agents system settings.
  final PaymentAgents? paymentAgents;

  /// The current status of the website.
  final SiteStatusEnum? siteStatus;

  /// Provides codes for languages supported.
  final List<String>? supportedLanguages;

  /// Latest terms and conditions version.
  final String? termsConditionsVersion;
}

/// Website status class.
class WebsiteStatus extends WebsiteStatusModel {
  /// Initializes Website status class.
  const WebsiteStatus({
    required ApiCallLimits apiCallLimits,
    required Map<String, CurrenciesConfigProperty> currenciesConfig,
    String? clientsCountry,
    DxtradeStatus? dxtradeStatus,
    String? message,
    Mt5Status? mt5Status,
    P2pConfig? p2pConfig,
    PaymentAgents? paymentAgents,
    SiteStatusEnum? siteStatus,
    List<String>? supportedLanguages,
    String? termsConditionsVersion,
  }) : super(
          apiCallLimits: apiCallLimits,
          currenciesConfig: currenciesConfig,
          clientsCountry: clientsCountry,
          dxtradeStatus: dxtradeStatus,
          message: message,
          mt5Status: mt5Status,
          p2pConfig: p2pConfig,
          paymentAgents: paymentAgents,
          siteStatus: siteStatus,
          supportedLanguages: supportedLanguages,
          termsConditionsVersion: termsConditionsVersion,
        );

  /// Creates an instance from JSON.
  factory WebsiteStatus.fromJson(Map<String, dynamic> json) => WebsiteStatus(
        apiCallLimits: ApiCallLimits.fromJson(json['api_call_limits']),
        currenciesConfig: Map<String, CurrenciesConfigProperty>.fromEntries(
            json['currencies_config']
                .entries
                .map<MapEntry<String, CurrenciesConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CurrenciesConfigProperty>(entry.key,
                            CurrenciesConfigProperty.fromJson(entry.value)))),
        clientsCountry: json['clients_country'],
        dxtradeStatus: json['dxtrade_status'] == null
            ? null
            : DxtradeStatus.fromJson(json['dxtrade_status']),
        message: json['message'],
        mt5Status: json['mt5_status'] == null
            ? null
            : Mt5Status.fromJson(json['mt5_status']),
        p2pConfig: json['p2p_config'] == null
            ? null
            : P2pConfig.fromJson(json['p2p_config']),
        paymentAgents: json['payment_agents'] == null
            ? null
            : PaymentAgents.fromJson(json['payment_agents']),
        siteStatus: json['site_status'] == null
            ? null
            : siteStatusEnumMapper[json['site_status']],
        supportedLanguages: json['supported_languages'] == null
            ? null
            : List<String>.from(
                json['supported_languages']?.map(
                  (dynamic item) => item,
                ),
              ),
        termsConditionsVersion: json['terms_conditions_version'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['api_call_limits'] = apiCallLimits.toJson();

    resultMap['currencies_config'] = currenciesConfig;
    resultMap['clients_country'] = clientsCountry;
    if (dxtradeStatus != null) {
      resultMap['dxtrade_status'] = dxtradeStatus!.toJson();
    }
    resultMap['message'] = message;
    if (mt5Status != null) {
      resultMap['mt5_status'] = mt5Status!.toJson();
    }
    if (p2pConfig != null) {
      resultMap['p2p_config'] = p2pConfig!.toJson();
    }
    if (paymentAgents != null) {
      resultMap['payment_agents'] = paymentAgents!.toJson();
    }
    resultMap['site_status'] = siteStatusEnumMapper.entries
        .firstWhere((MapEntry<String, SiteStatusEnum> entry) =>
            entry.value == siteStatus)
        .key;
    if (supportedLanguages != null) {
      resultMap['supported_languages'] = supportedLanguages!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['terms_conditions_version'] = termsConditionsVersion;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  WebsiteStatus copyWith({
    ApiCallLimits? apiCallLimits,
    Map<String, CurrenciesConfigProperty>? currenciesConfig,
    String? clientsCountry,
    DxtradeStatus? dxtradeStatus,
    String? message,
    Mt5Status? mt5Status,
    P2pConfig? p2pConfig,
    PaymentAgents? paymentAgents,
    SiteStatusEnum? siteStatus,
    List<String>? supportedLanguages,
    String? termsConditionsVersion,
  }) =>
      WebsiteStatus(
        apiCallLimits: apiCallLimits ?? this.apiCallLimits,
        currenciesConfig: currenciesConfig ?? this.currenciesConfig,
        clientsCountry: clientsCountry ?? this.clientsCountry,
        dxtradeStatus: dxtradeStatus ?? this.dxtradeStatus,
        message: message ?? this.message,
        mt5Status: mt5Status ?? this.mt5Status,
        p2pConfig: p2pConfig ?? this.p2pConfig,
        paymentAgents: paymentAgents ?? this.paymentAgents,
        siteStatus: siteStatus ?? this.siteStatus,
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        termsConditionsVersion:
            termsConditionsVersion ?? this.termsConditionsVersion,
      );
}

/// Api call limits model class.
abstract class ApiCallLimitsModel {
  /// Initializes Api call limits model class .
  const ApiCallLimitsModel({
    required this.maxRequestsPricing,
    required this.maxRequestsOutcome,
    required this.maxRequestesGeneral,
    required this.maxProposalSubscription,
  });

  /// Maximum number of pricing requests allowed during specified period of time.
  final MaxRequestsPricing maxRequestsPricing;

  /// Maximum number of outcome requests allowed during specified period of time.
  final MaxRequestsOutcome maxRequestsOutcome;

  /// Maximum number of general requests allowed during specified period of time.
  final MaxRequestesGeneral maxRequestesGeneral;

  /// Maximum subscription to proposal calls.
  final MaxProposalSubscription maxProposalSubscription;
}

/// Api call limits class.
class ApiCallLimits extends ApiCallLimitsModel {
  /// Initializes Api call limits class.
  const ApiCallLimits({
    required MaxProposalSubscription maxProposalSubscription,
    required MaxRequestesGeneral maxRequestesGeneral,
    required MaxRequestsOutcome maxRequestsOutcome,
    required MaxRequestsPricing maxRequestsPricing,
  }) : super(
          maxProposalSubscription: maxProposalSubscription,
          maxRequestesGeneral: maxRequestesGeneral,
          maxRequestsOutcome: maxRequestsOutcome,
          maxRequestsPricing: maxRequestsPricing,
        );

  /// Creates an instance from JSON.
  factory ApiCallLimits.fromJson(Map<String, dynamic> json) => ApiCallLimits(
        maxProposalSubscription:
            MaxProposalSubscription.fromJson(json['max_proposal_subscription']),
        maxRequestesGeneral:
            MaxRequestesGeneral.fromJson(json['max_requestes_general']),
        maxRequestsOutcome:
            MaxRequestsOutcome.fromJson(json['max_requests_outcome']),
        maxRequestsPricing:
            MaxRequestsPricing.fromJson(json['max_requests_pricing']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max_proposal_subscription'] = maxProposalSubscription.toJson();

    resultMap['max_requestes_general'] = maxRequestesGeneral.toJson();

    resultMap['max_requests_outcome'] = maxRequestsOutcome.toJson();

    resultMap['max_requests_pricing'] = maxRequestsPricing.toJson();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ApiCallLimits copyWith({
    MaxProposalSubscription? maxProposalSubscription,
    MaxRequestesGeneral? maxRequestesGeneral,
    MaxRequestsOutcome? maxRequestsOutcome,
    MaxRequestsPricing? maxRequestsPricing,
  }) =>
      ApiCallLimits(
        maxProposalSubscription:
            maxProposalSubscription ?? this.maxProposalSubscription,
        maxRequestesGeneral: maxRequestesGeneral ?? this.maxRequestesGeneral,
        maxRequestsOutcome: maxRequestsOutcome ?? this.maxRequestsOutcome,
        maxRequestsPricing: maxRequestsPricing ?? this.maxRequestsPricing,
      );
}

/// Max proposal subscription model class.
abstract class MaxProposalSubscriptionModel {
  /// Initializes Max proposal subscription model class .
  const MaxProposalSubscriptionModel({
    required this.max,
    required this.appliesTo,
  });

  /// Maximum number of allowed calls.
  final double max;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max proposal subscription class.
class MaxProposalSubscription extends MaxProposalSubscriptionModel {
  /// Initializes Max proposal subscription class.
  const MaxProposalSubscription({
    required String appliesTo,
    required double max,
  }) : super(
          appliesTo: appliesTo,
          max: max,
        );

  /// Creates an instance from JSON.
  factory MaxProposalSubscription.fromJson(Map<String, dynamic> json) =>
      MaxProposalSubscription(
        appliesTo: json['applies_to'],
        max: getDouble(json['max'])!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['max'] = max;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MaxProposalSubscription copyWith({
    String? appliesTo,
    double? max,
  }) =>
      MaxProposalSubscription(
        appliesTo: appliesTo ?? this.appliesTo,
        max: max ?? this.max,
      );
}

/// Max requestes general model class.
abstract class MaxRequestesGeneralModel {
  /// Initializes Max requestes general model class .
  const MaxRequestesGeneralModel({
    required this.minutely,
    required this.hourly,
    required this.appliesTo,
  });

  /// The maximum of allowed calls per minute.
  final double minutely;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max requestes general class.
class MaxRequestesGeneral extends MaxRequestesGeneralModel {
  /// Initializes Max requestes general class.
  const MaxRequestesGeneral({
    required String appliesTo,
    required double hourly,
    required double minutely,
  }) : super(
          appliesTo: appliesTo,
          hourly: hourly,
          minutely: minutely,
        );

  /// Creates an instance from JSON.
  factory MaxRequestesGeneral.fromJson(Map<String, dynamic> json) =>
      MaxRequestesGeneral(
        appliesTo: json['applies_to'],
        hourly: getDouble(json['hourly'])!,
        minutely: getDouble(json['minutely'])!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['hourly'] = hourly;
    resultMap['minutely'] = minutely;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MaxRequestesGeneral copyWith({
    String? appliesTo,
    double? hourly,
    double? minutely,
  }) =>
      MaxRequestesGeneral(
        appliesTo: appliesTo ?? this.appliesTo,
        hourly: hourly ?? this.hourly,
        minutely: minutely ?? this.minutely,
      );
}

/// Max requests outcome model class.
abstract class MaxRequestsOutcomeModel {
  /// Initializes Max requests outcome model class .
  const MaxRequestsOutcomeModel({
    required this.minutely,
    required this.hourly,
    required this.appliesTo,
  });

  /// The maximum of allowed calls per minute.
  final double minutely;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max requests outcome class.
class MaxRequestsOutcome extends MaxRequestsOutcomeModel {
  /// Initializes Max requests outcome class.
  const MaxRequestsOutcome({
    required String appliesTo,
    required double hourly,
    required double minutely,
  }) : super(
          appliesTo: appliesTo,
          hourly: hourly,
          minutely: minutely,
        );

  /// Creates an instance from JSON.
  factory MaxRequestsOutcome.fromJson(Map<String, dynamic> json) =>
      MaxRequestsOutcome(
        appliesTo: json['applies_to'],
        hourly: getDouble(json['hourly'])!,
        minutely: getDouble(json['minutely'])!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['hourly'] = hourly;
    resultMap['minutely'] = minutely;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MaxRequestsOutcome copyWith({
    String? appliesTo,
    double? hourly,
    double? minutely,
  }) =>
      MaxRequestsOutcome(
        appliesTo: appliesTo ?? this.appliesTo,
        hourly: hourly ?? this.hourly,
        minutely: minutely ?? this.minutely,
      );
}

/// Max requests pricing model class.
abstract class MaxRequestsPricingModel {
  /// Initializes Max requests pricing model class .
  const MaxRequestsPricingModel({
    required this.minutely,
    required this.hourly,
    required this.appliesTo,
  });

  /// The maximum of allowed calls per minute.
  final double minutely;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max requests pricing class.
class MaxRequestsPricing extends MaxRequestsPricingModel {
  /// Initializes Max requests pricing class.
  const MaxRequestsPricing({
    required String appliesTo,
    required double hourly,
    required double minutely,
  }) : super(
          appliesTo: appliesTo,
          hourly: hourly,
          minutely: minutely,
        );

  /// Creates an instance from JSON.
  factory MaxRequestsPricing.fromJson(Map<String, dynamic> json) =>
      MaxRequestsPricing(
        appliesTo: json['applies_to'],
        hourly: getDouble(json['hourly'])!,
        minutely: getDouble(json['minutely'])!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['hourly'] = hourly;
    resultMap['minutely'] = minutely;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MaxRequestsPricing copyWith({
    String? appliesTo,
    double? hourly,
    double? minutely,
  }) =>
      MaxRequestsPricing(
        appliesTo: appliesTo ?? this.appliesTo,
        hourly: hourly ?? this.hourly,
        minutely: minutely ?? this.minutely,
      );
}

/// Currencies config property model class.
abstract class CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property model class .
  const CurrenciesConfigPropertyModel({
    required this.type,
    required this.transferBetweenAccounts,
    required this.stakeDefault,
    required this.isWithdrawalSuspended,
    required this.isSuspended,
    required this.isDepositSuspended,
    required this.fractionalDigits,
    this.name,
  });

  /// Type of the currency.
  final TypeEnum type;

  /// Fees and range of allowed amount for transfer between accounts with different types of currencies.
  final TransferBetweenAccounts transferBetweenAccounts;

  /// Default stake value for the currency.
  final double stakeDefault;

  /// Current status for payment withdrawal for the currency
  final double isWithdrawalSuspended;

  /// Current status for the currency
  final double isSuspended;

  /// Current status for payment deposit for the currency
  final double isDepositSuspended;

  /// Number of fractional digits.
  final double fractionalDigits;

  /// Name of the currency.
  final String? name;
}

/// Currencies config property class.
class CurrenciesConfigProperty extends CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property class.
  const CurrenciesConfigProperty({
    required double fractionalDigits,
    required double isDepositSuspended,
    required double isSuspended,
    required double isWithdrawalSuspended,
    required double stakeDefault,
    required TransferBetweenAccounts transferBetweenAccounts,
    required TypeEnum type,
    String? name,
  }) : super(
          fractionalDigits: fractionalDigits,
          isDepositSuspended: isDepositSuspended,
          isSuspended: isSuspended,
          isWithdrawalSuspended: isWithdrawalSuspended,
          stakeDefault: stakeDefault,
          transferBetweenAccounts: transferBetweenAccounts,
          type: type,
          name: name,
        );

  /// Creates an instance from JSON.
  factory CurrenciesConfigProperty.fromJson(Map<String, dynamic> json) =>
      CurrenciesConfigProperty(
        fractionalDigits: getDouble(json['fractional_digits'])!,
        isDepositSuspended: getDouble(json['is_deposit_suspended'])!,
        isSuspended: getDouble(json['is_suspended'])!,
        isWithdrawalSuspended: getDouble(json['is_withdrawal_suspended'])!,
        stakeDefault: getDouble(json['stake_default'])!,
        transferBetweenAccounts:
            TransferBetweenAccounts.fromJson(json['transfer_between_accounts']),
        type: typeEnumMapper[json['type']]!,
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fractional_digits'] = fractionalDigits;
    resultMap['is_deposit_suspended'] = isDepositSuspended;
    resultMap['is_suspended'] = isSuspended;
    resultMap['is_withdrawal_suspended'] = isWithdrawalSuspended;
    resultMap['stake_default'] = stakeDefault;
    resultMap['transfer_between_accounts'] = transferBetweenAccounts.toJson();

    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrenciesConfigProperty copyWith({
    double? fractionalDigits,
    double? isDepositSuspended,
    double? isSuspended,
    double? isWithdrawalSuspended,
    double? stakeDefault,
    TransferBetweenAccounts? transferBetweenAccounts,
    TypeEnum? type,
    String? name,
  }) =>
      CurrenciesConfigProperty(
        fractionalDigits: fractionalDigits ?? this.fractionalDigits,
        isDepositSuspended: isDepositSuspended ?? this.isDepositSuspended,
        isSuspended: isSuspended ?? this.isSuspended,
        isWithdrawalSuspended:
            isWithdrawalSuspended ?? this.isWithdrawalSuspended,
        stakeDefault: stakeDefault ?? this.stakeDefault,
        transferBetweenAccounts:
            transferBetweenAccounts ?? this.transferBetweenAccounts,
        type: type ?? this.type,
        name: name ?? this.name,
      );
}

/// Transfer between accounts model class.
abstract class TransferBetweenAccountsModel {
  /// Initializes Transfer between accounts model class .
  const TransferBetweenAccountsModel({
    required this.limits,
    required this.fees,
    this.limitsDerivez,
    this.limitsDxtrade,
    this.limitsMt5,
  });

  ///
  final Limits limits;

  /// The fee that applies for transfer between accounts with different types of currencies.
  final Map<String, double> fees;

  /// Range of allowed amount for transfer between derivez accounts.
  final Map<String, dynamic>? limitsDerivez;

  /// Range of allowed amount for transfer between dxtrade accounts.
  final Map<String, dynamic>? limitsDxtrade;

  /// Range of allowed amount for transfer between mt5 accounts.
  final Map<String, dynamic>? limitsMt5;
}

/// Transfer between accounts class.
class TransferBetweenAccounts extends TransferBetweenAccountsModel {
  /// Initializes Transfer between accounts class.
  const TransferBetweenAccounts({
    required Map<String, double> fees,
    required Limits limits,
    Map<String, dynamic>? limitsDerivez,
    Map<String, dynamic>? limitsDxtrade,
    Map<String, dynamic>? limitsMt5,
  }) : super(
          fees: fees,
          limits: limits,
          limitsDerivez: limitsDerivez,
          limitsDxtrade: limitsDxtrade,
          limitsMt5: limitsMt5,
        );

  /// Creates an instance from JSON.
  factory TransferBetweenAccounts.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccounts(
        fees: Map<String, double>.fromEntries(json['fees']
            .entries
            .map<MapEntry<String, double>>((MapEntry<String, dynamic> entry) =>
                MapEntry<String, double>(entry.key, getDouble(entry.value)!))),
        limits: Limits.fromJson(json['limits']),
        limitsDerivez: json['limits_derivez'],
        limitsDxtrade: json['limits_dxtrade'],
        limitsMt5: json['limits_mt5'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fees'] = fees;
    resultMap['limits'] = limits.toJson();

    resultMap['limits_derivez'] = limitsDerivez;
    resultMap['limits_dxtrade'] = limitsDxtrade;
    resultMap['limits_mt5'] = limitsMt5;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TransferBetweenAccounts copyWith({
    Map<String, double>? fees,
    Limits? limits,
    Map<String, dynamic>? limitsDerivez,
    Map<String, dynamic>? limitsDxtrade,
    Map<String, dynamic>? limitsMt5,
  }) =>
      TransferBetweenAccounts(
        fees: fees ?? this.fees,
        limits: limits ?? this.limits,
        limitsDerivez: limitsDerivez ?? this.limitsDerivez,
        limitsDxtrade: limitsDxtrade ?? this.limitsDxtrade,
        limitsMt5: limitsMt5 ?? this.limitsMt5,
      );
}

/// Limits model class.
abstract class LimitsModel {
  /// Initializes Limits model class .
  const LimitsModel({
    required this.min,
    this.max,
  });

  /// Minimum allowed amount for transfer between accounts with different types of currencies.
  final double min;

  /// Maximum allowed amount for transfer between accounts with different types of currencies.
  final double? max;
}

/// Limits class.
class Limits extends LimitsModel {
  /// Initializes Limits class.
  const Limits({
    required double min,
    double? max,
  }) : super(
          min: min,
          max: max,
        );

  /// Creates an instance from JSON.
  factory Limits.fromJson(Map<String, dynamic> json) => Limits(
        min: getDouble(json['min'])!,
        max: getDouble(json['max']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['min'] = min;
    resultMap['max'] = max;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Limits copyWith({
    double? min,
    double? max,
  }) =>
      Limits(
        min: min ?? this.min,
        max: max ?? this.max,
      );
}

/// Dxtrade status model class.
abstract class DxtradeStatusModel {
  /// Initializes Dxtrade status model class .
  const DxtradeStatusModel({
    this.all,
    this.demo,
    this.real,
  });

  /// Suspension of Dxtrade/DerivX API calls on all servers.
  final int? all;

  /// Suspension of Dxtrade/DerivX API calls on demo servers.
  final int? demo;

  /// Suspension of Dxtrade/DerivX API calls on real trading servers.
  final int? real;
}

/// Dxtrade status class.
class DxtradeStatus extends DxtradeStatusModel {
  /// Initializes Dxtrade status class.
  const DxtradeStatus({
    int? all,
    int? demo,
    int? real,
  }) : super(
          all: all,
          demo: demo,
          real: real,
        );

  /// Creates an instance from JSON.
  factory DxtradeStatus.fromJson(Map<String, dynamic> json) => DxtradeStatus(
        all: json['all'],
        demo: json['demo'],
        real: json['real'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['all'] = all;
    resultMap['demo'] = demo;
    resultMap['real'] = real;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DxtradeStatus copyWith({
    int? all,
    int? demo,
    int? real,
  }) =>
      DxtradeStatus(
        all: all ?? this.all,
        demo: demo ?? this.demo,
        real: real ?? this.real,
      );
}

/// Mt5 status model class.
abstract class Mt5StatusModel {
  /// Initializes Mt5 status model class .
  const Mt5StatusModel({
    this.demo,
    this.real,
  });

  /// Suspension of MT5 API calls on demo servers.
  final List<dynamic>? demo;

  /// Suspension of MT5 API calls on real trading servers.
  final List<dynamic>? real;
}

/// Mt5 status class.
class Mt5Status extends Mt5StatusModel {
  /// Initializes Mt5 status class.
  const Mt5Status({
    List<dynamic>? demo,
    List<dynamic>? real,
  }) : super(
          demo: demo,
          real: real,
        );

  /// Creates an instance from JSON.
  factory Mt5Status.fromJson(Map<String, dynamic> json) => Mt5Status(
        demo: json['demo'] == null
            ? null
            : List<dynamic>.from(
                json['demo']?.map(
                  (dynamic item) => item,
                ),
              ),
        real: json['real'] == null
            ? null
            : List<dynamic>.from(
                json['real']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (demo != null) {
      resultMap['demo'] = demo!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    if (real != null) {
      resultMap['real'] = real!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Mt5Status copyWith({
    List<dynamic>? demo,
    List<dynamic>? real,
  }) =>
      Mt5Status(
        demo: demo ?? this.demo,
        real: real ?? this.real,
      );
}

/// P2p config model class.
abstract class P2pConfigModel {
  /// Initializes P2p config model class .
  const P2pConfigModel({
    required this.supportedCurrencies,
    required this.reviewPeriod,
    required this.paymentMethodsEnabled,
    required this.orderPaymentPeriod,
    required this.orderDailyLimit,
    required this.maximumOrderAmount,
    required this.maximumAdvertAmount,
    required this.localCurrencies,
    required this.floatRateOffsetLimit,
    required this.floatRateAdverts,
    required this.fixedRateAdverts,
    required this.featureLevel,
    required this.disabled,
    required this.cancellationLimit,
    required this.cancellationGracePeriod,
    required this.cancellationCountPeriod,
    required this.cancellationBlockDuration,
    required this.advertsActiveLimit,
    this.advertsArchivePeriod,
    this.fixedRateAdvertsEndDate,
    this.overrideExchangeRate,
  });

  /// List of currencies for which P2P is available
  final List<String> supportedCurrencies;

  /// Time after successful order completion during which reviews can be created, in hours.
  final double reviewPeriod;

  /// Indicates if the payment methods feature is enabled.
  final bool paymentMethodsEnabled;

  /// Time allowed for order payment, in minutes after order creation.
  final int orderPaymentPeriod;

  /// Maximum number of orders a user may create per day.
  final int orderDailyLimit;

  /// Maximum amount of an order, in USD.
  final double maximumOrderAmount;

  /// Maximum amount of an advert, in USD.
  final double maximumAdvertAmount;

  /// Available local currencies for p2p_advert_list request.
  final List<LocalCurrenciesItem> localCurrencies;

  /// Maximum rate offset for floating rate adverts.
  final double floatRateOffsetLimit;

  /// Availability of floating rate adverts.
  final FloatRateAdvertsEnum floatRateAdverts;

  /// Availability of fixed rate adverts.
  final FixedRateAdvertsEnum fixedRateAdverts;

  /// Indicates the availbility of certain backend features.
  final int featureLevel;

  /// When `true`, the P2P service is unavailable.
  final bool disabled;

  /// A buyer will be temporarily barred after marking this number of cancellations within cancellation_period.
  final int cancellationLimit;

  /// A buyer may cancel an order within this period without negative consequences, in minutes after order creation.
  final int cancellationGracePeriod;

  /// The period within which to count buyer cancellations, in hours.
  final int cancellationCountPeriod;

  /// A buyer will be blocked for this duration after exceeding the cancellation limit, in hours.
  final int cancellationBlockDuration;

  /// Maximum number of active ads allowed by an advertiser per currency pair and advert type (buy or sell).
  final int advertsActiveLimit;

  /// Adverts will be deactivated if no activity occurs within this period, in days.
  final int? advertsArchivePeriod;

  /// Date on which fixed rate adverts will be deactivated.
  final String? fixedRateAdvertsEndDate;

  /// Local P2P exchange rate which should be used instead of those obtained from the `exchange_rates` call.
  final String? overrideExchangeRate;
}

/// P2p config class.
class P2pConfig extends P2pConfigModel {
  /// Initializes P2p config class.
  const P2pConfig({
    required int advertsActiveLimit,
    required int cancellationBlockDuration,
    required int cancellationCountPeriod,
    required int cancellationGracePeriod,
    required int cancellationLimit,
    required bool disabled,
    required int featureLevel,
    required FixedRateAdvertsEnum fixedRateAdverts,
    required FloatRateAdvertsEnum floatRateAdverts,
    required double floatRateOffsetLimit,
    required List<LocalCurrenciesItem> localCurrencies,
    required double maximumAdvertAmount,
    required double maximumOrderAmount,
    required int orderDailyLimit,
    required int orderPaymentPeriod,
    required bool paymentMethodsEnabled,
    required double reviewPeriod,
    required List<String> supportedCurrencies,
    int? advertsArchivePeriod,
    String? fixedRateAdvertsEndDate,
    String? overrideExchangeRate,
  }) : super(
          advertsActiveLimit: advertsActiveLimit,
          cancellationBlockDuration: cancellationBlockDuration,
          cancellationCountPeriod: cancellationCountPeriod,
          cancellationGracePeriod: cancellationGracePeriod,
          cancellationLimit: cancellationLimit,
          disabled: disabled,
          featureLevel: featureLevel,
          fixedRateAdverts: fixedRateAdverts,
          floatRateAdverts: floatRateAdverts,
          floatRateOffsetLimit: floatRateOffsetLimit,
          localCurrencies: localCurrencies,
          maximumAdvertAmount: maximumAdvertAmount,
          maximumOrderAmount: maximumOrderAmount,
          orderDailyLimit: orderDailyLimit,
          orderPaymentPeriod: orderPaymentPeriod,
          paymentMethodsEnabled: paymentMethodsEnabled,
          reviewPeriod: reviewPeriod,
          supportedCurrencies: supportedCurrencies,
          advertsArchivePeriod: advertsArchivePeriod,
          fixedRateAdvertsEndDate: fixedRateAdvertsEndDate,
          overrideExchangeRate: overrideExchangeRate,
        );

  /// Creates an instance from JSON.
  factory P2pConfig.fromJson(Map<String, dynamic> json) => P2pConfig(
        advertsActiveLimit: json['adverts_active_limit'],
        cancellationBlockDuration: json['cancellation_block_duration'],
        cancellationCountPeriod: json['cancellation_count_period'],
        cancellationGracePeriod: json['cancellation_grace_period'],
        cancellationLimit: json['cancellation_limit'],
        disabled: getBool(json['disabled'])!,
        featureLevel: json['feature_level'],
        fixedRateAdverts:
            fixedRateAdvertsEnumMapper[json['fixed_rate_adverts']]!,
        floatRateAdverts:
            floatRateAdvertsEnumMapper[json['float_rate_adverts']]!,
        floatRateOffsetLimit: getDouble(json['float_rate_offset_limit'])!,
        localCurrencies: List<LocalCurrenciesItem>.from(
          json['local_currencies'].map(
            (dynamic item) => LocalCurrenciesItem.fromJson(item),
          ),
        ),
        maximumAdvertAmount: getDouble(json['maximum_advert_amount'])!,
        maximumOrderAmount: getDouble(json['maximum_order_amount'])!,
        orderDailyLimit: json['order_daily_limit'],
        orderPaymentPeriod: json['order_payment_period'],
        paymentMethodsEnabled: getBool(json['payment_methods_enabled'])!,
        reviewPeriod: getDouble(json['review_period'])!,
        supportedCurrencies: List<String>.from(
          json['supported_currencies'].map(
            (dynamic item) => item,
          ),
        ),
        advertsArchivePeriod: json['adverts_archive_period'],
        fixedRateAdvertsEndDate: json['fixed_rate_adverts_end_date'],
        overrideExchangeRate: json['override_exchange_rate'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['adverts_active_limit'] = advertsActiveLimit;
    resultMap['cancellation_block_duration'] = cancellationBlockDuration;
    resultMap['cancellation_count_period'] = cancellationCountPeriod;
    resultMap['cancellation_grace_period'] = cancellationGracePeriod;
    resultMap['cancellation_limit'] = cancellationLimit;
    resultMap['disabled'] = disabled;
    resultMap['feature_level'] = featureLevel;
    resultMap['fixed_rate_adverts'] = fixedRateAdvertsEnumMapper.entries
        .firstWhere((MapEntry<String, FixedRateAdvertsEnum> entry) =>
            entry.value == fixedRateAdverts)
        .key;
    resultMap['float_rate_adverts'] = floatRateAdvertsEnumMapper.entries
        .firstWhere((MapEntry<String, FloatRateAdvertsEnum> entry) =>
            entry.value == floatRateAdverts)
        .key;
    resultMap['float_rate_offset_limit'] = floatRateOffsetLimit;
    resultMap['local_currencies'] = localCurrencies
        .map<dynamic>(
          (LocalCurrenciesItem item) => item.toJson(),
        )
        .toList();

    resultMap['maximum_advert_amount'] = maximumAdvertAmount;
    resultMap['maximum_order_amount'] = maximumOrderAmount;
    resultMap['order_daily_limit'] = orderDailyLimit;
    resultMap['order_payment_period'] = orderPaymentPeriod;
    resultMap['payment_methods_enabled'] = paymentMethodsEnabled;
    resultMap['review_period'] = reviewPeriod;
    resultMap['supported_currencies'] = supportedCurrencies
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    resultMap['adverts_archive_period'] = advertsArchivePeriod;
    resultMap['fixed_rate_adverts_end_date'] = fixedRateAdvertsEndDate;
    resultMap['override_exchange_rate'] = overrideExchangeRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pConfig copyWith({
    int? advertsActiveLimit,
    int? cancellationBlockDuration,
    int? cancellationCountPeriod,
    int? cancellationGracePeriod,
    int? cancellationLimit,
    bool? disabled,
    int? featureLevel,
    FixedRateAdvertsEnum? fixedRateAdverts,
    FloatRateAdvertsEnum? floatRateAdverts,
    double? floatRateOffsetLimit,
    List<LocalCurrenciesItem>? localCurrencies,
    double? maximumAdvertAmount,
    double? maximumOrderAmount,
    int? orderDailyLimit,
    int? orderPaymentPeriod,
    bool? paymentMethodsEnabled,
    double? reviewPeriod,
    List<String>? supportedCurrencies,
    int? advertsArchivePeriod,
    String? fixedRateAdvertsEndDate,
    String? overrideExchangeRate,
  }) =>
      P2pConfig(
        advertsActiveLimit: advertsActiveLimit ?? this.advertsActiveLimit,
        cancellationBlockDuration:
            cancellationBlockDuration ?? this.cancellationBlockDuration,
        cancellationCountPeriod:
            cancellationCountPeriod ?? this.cancellationCountPeriod,
        cancellationGracePeriod:
            cancellationGracePeriod ?? this.cancellationGracePeriod,
        cancellationLimit: cancellationLimit ?? this.cancellationLimit,
        disabled: disabled ?? this.disabled,
        featureLevel: featureLevel ?? this.featureLevel,
        fixedRateAdverts: fixedRateAdverts ?? this.fixedRateAdverts,
        floatRateAdverts: floatRateAdverts ?? this.floatRateAdverts,
        floatRateOffsetLimit: floatRateOffsetLimit ?? this.floatRateOffsetLimit,
        localCurrencies: localCurrencies ?? this.localCurrencies,
        maximumAdvertAmount: maximumAdvertAmount ?? this.maximumAdvertAmount,
        maximumOrderAmount: maximumOrderAmount ?? this.maximumOrderAmount,
        orderDailyLimit: orderDailyLimit ?? this.orderDailyLimit,
        orderPaymentPeriod: orderPaymentPeriod ?? this.orderPaymentPeriod,
        paymentMethodsEnabled:
            paymentMethodsEnabled ?? this.paymentMethodsEnabled,
        reviewPeriod: reviewPeriod ?? this.reviewPeriod,
        supportedCurrencies: supportedCurrencies ?? this.supportedCurrencies,
        advertsArchivePeriod: advertsArchivePeriod ?? this.advertsArchivePeriod,
        fixedRateAdvertsEndDate:
            fixedRateAdvertsEndDate ?? this.fixedRateAdvertsEndDate,
        overrideExchangeRate: overrideExchangeRate ?? this.overrideExchangeRate,
      );
}

/// Local currencies item model class.
abstract class LocalCurrenciesItemModel {
  /// Initializes Local currencies item model class .
  const LocalCurrenciesItemModel({
    required this.symbol,
    required this.hasAdverts,
    required this.displayName,
    this.isDefault,
  });

  /// Local currency symbol
  final String symbol;

  /// Indicates that there are adverts available for this currency.
  final bool hasAdverts;

  /// Local currency name
  final String displayName;

  /// Indicates that this is local currency for the current country.
  final int? isDefault;
}

/// Local currencies item class.
class LocalCurrenciesItem extends LocalCurrenciesItemModel {
  /// Initializes Local currencies item class.
  const LocalCurrenciesItem({
    required String displayName,
    required bool hasAdverts,
    required String symbol,
    int? isDefault,
  }) : super(
          displayName: displayName,
          hasAdverts: hasAdverts,
          symbol: symbol,
          isDefault: isDefault,
        );

  /// Creates an instance from JSON.
  factory LocalCurrenciesItem.fromJson(Map<String, dynamic> json) =>
      LocalCurrenciesItem(
        displayName: json['display_name'],
        hasAdverts: getBool(json['has_adverts'])!,
        symbol: json['symbol'],
        isDefault: json['is_default'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['has_adverts'] = hasAdverts;
    resultMap['symbol'] = symbol;
    resultMap['is_default'] = isDefault;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LocalCurrenciesItem copyWith({
    String? displayName,
    bool? hasAdverts,
    String? symbol,
    int? isDefault,
  }) =>
      LocalCurrenciesItem(
        displayName: displayName ?? this.displayName,
        hasAdverts: hasAdverts ?? this.hasAdverts,
        symbol: symbol ?? this.symbol,
        isDefault: isDefault ?? this.isDefault,
      );
}

/// Payment agents model class.
abstract class PaymentAgentsModel {
  /// Initializes Payment agents model class .
  const PaymentAgentsModel({
    required this.initialDepositPerCountry,
  });

  /// Initial deposit requirement per country.
  final Map<String, double> initialDepositPerCountry;
}

/// Payment agents class.
class PaymentAgents extends PaymentAgentsModel {
  /// Initializes Payment agents class.
  const PaymentAgents({
    required Map<String, double> initialDepositPerCountry,
  }) : super(
          initialDepositPerCountry: initialDepositPerCountry,
        );

  /// Creates an instance from JSON.
  factory PaymentAgents.fromJson(Map<String, dynamic> json) => PaymentAgents(
        initialDepositPerCountry: Map<String, double>.fromEntries(json[
                'initial_deposit_per_country']
            .entries
            .map<MapEntry<String, double>>((MapEntry<String, dynamic> entry) =>
                MapEntry<String, double>(entry.key, getDouble(entry.value)!))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['initial_deposit_per_country'] = initialDepositPerCountry;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentAgents copyWith({
    Map<String, double>? initialDepositPerCountry,
  }) =>
      PaymentAgents(
        initialDepositPerCountry:
            initialDepositPerCountry ?? this.initialDepositPerCountry,
      );
}

/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
