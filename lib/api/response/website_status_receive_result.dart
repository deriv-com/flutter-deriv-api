// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_receive_result.dart';
import 'package:flutter_deriv_api/api/response/forget_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/website_status_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/website_status_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Website status response model class.
abstract class WebsiteStatusResponseModel {
  /// Initializes Website status response model class .
  WebsiteStatusResponseModel({
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
  WebsiteStatusResponse({
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets Website status
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error
  static Future<WebsiteStatusResponse> fetchWebsiteStatus([
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

    return WebsiteStatusResponse.fromJson(
        response.websiteStatus, response.subscription);
  }

  /// Subscribes to website status
  static Stream<WebsiteStatusResponse?> subscribeWebsiteStatus(
    WebsiteStatusRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<WebsiteStatusResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                WebsiteStatusException(baseExceptionModel: baseExceptionModel),
          );

          return response is WebsiteStatusReceive
              ? WebsiteStatusResponse.fromJson(
                  response.websiteStatus,
                  response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from website status
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error
  Future<ForgetResponse?> unsubscribeWebsiteStatus() async {
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

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all website status subscriptions.
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllWebsiteStatus() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.websiteStatus);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

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
  WebsiteStatusModel({
    required this.p2pConfig,
    required this.currenciesConfig,
    required this.cryptoConfig,
    required this.apiCallLimits,
    this.clientsCountry,
    this.message,
    this.siteStatus,
    this.supportedLanguages,
    this.termsConditionsVersion,
  });

  /// Peer-to-peer payment system settings.
  final P2pConfig p2pConfig;

  /// Available currencies and their information
  final Map<String, CurrenciesConfigProperty> currenciesConfig;

  /// Provides minimum withdrawal for all crypto currency in USD
  final Map<String, CryptoConfigProperty> cryptoConfig;

  /// Maximum number of API calls during specified period of time.
  final ApiCallLimits apiCallLimits;

  /// Country code of connected IP
  final String? clientsCountry;

  /// Text for site status banner, contains problem description. shown only if set by the system.
  final String? message;

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
  WebsiteStatus({
    required ApiCallLimits apiCallLimits,
    required Map<String, CryptoConfigProperty> cryptoConfig,
    required Map<String, CurrenciesConfigProperty> currenciesConfig,
    required P2pConfig p2pConfig,
    String? clientsCountry,
    String? message,
    SiteStatusEnum? siteStatus,
    List<String>? supportedLanguages,
    String? termsConditionsVersion,
  }) : super(
          apiCallLimits: apiCallLimits,
          cryptoConfig: cryptoConfig,
          currenciesConfig: currenciesConfig,
          p2pConfig: p2pConfig,
          clientsCountry: clientsCountry,
          message: message,
          siteStatus: siteStatus,
          supportedLanguages: supportedLanguages,
          termsConditionsVersion: termsConditionsVersion,
        );

  /// Creates an instance from JSON.
  factory WebsiteStatus.fromJson(Map<String, dynamic> json) => WebsiteStatus(
        apiCallLimits: ApiCallLimits.fromJson(json['api_call_limits']),
        cryptoConfig: Map<String, CryptoConfigProperty>.fromEntries(
            json['crypto_config']
                .entries
                .map<MapEntry<String, CryptoConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CryptoConfigProperty>(entry.key,
                            CryptoConfigProperty.fromJson(entry.value)))),
        currenciesConfig: Map<String, CurrenciesConfigProperty>.fromEntries(
            json['currencies_config']
                .entries
                .map<MapEntry<String, CurrenciesConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CurrenciesConfigProperty>(entry.key,
                            CurrenciesConfigProperty.fromJson(entry.value)))),
        p2pConfig: P2pConfig.fromJson(json['p2p_config']),
        clientsCountry: json['clients_country'],
        message: json['message'],
        siteStatus: json['site_status'] == null
            ? null
            : siteStatusEnumMapper[json['site_status']]!,
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

    resultMap['crypto_config'] = cryptoConfig;
    resultMap['currencies_config'] = currenciesConfig;
    resultMap['p2p_config'] = p2pConfig.toJson();

    resultMap['clients_country'] = clientsCountry;
    resultMap['message'] = message;
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
    required ApiCallLimits apiCallLimits,
    required Map<String, CryptoConfigProperty> cryptoConfig,
    required Map<String, CurrenciesConfigProperty> currenciesConfig,
    required P2pConfig p2pConfig,
    String? clientsCountry,
    String? message,
    SiteStatusEnum? siteStatus,
    List<String>? supportedLanguages,
    String? termsConditionsVersion,
  }) =>
      WebsiteStatus(
        apiCallLimits: apiCallLimits,
        cryptoConfig: cryptoConfig,
        currenciesConfig: currenciesConfig,
        p2pConfig: p2pConfig,
        clientsCountry: clientsCountry ?? this.clientsCountry,
        message: message ?? this.message,
        siteStatus: siteStatus ?? this.siteStatus,
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        termsConditionsVersion:
            termsConditionsVersion ?? this.termsConditionsVersion,
      );
}
/// Api call limits model class.
abstract class ApiCallLimitsModel {
  /// Initializes Api call limits model class .
  ApiCallLimitsModel({
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
  ApiCallLimits({
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
    required MaxProposalSubscription maxProposalSubscription,
    required MaxRequestesGeneral maxRequestesGeneral,
    required MaxRequestsOutcome maxRequestsOutcome,
    required MaxRequestsPricing maxRequestsPricing,
  }) =>
      ApiCallLimits(
        maxProposalSubscription: maxProposalSubscription,
        maxRequestesGeneral: maxRequestesGeneral,
        maxRequestsOutcome: maxRequestsOutcome,
        maxRequestsPricing: maxRequestsPricing,
      );
}
/// Max proposal subscription model class.
abstract class MaxProposalSubscriptionModel {
  /// Initializes Max proposal subscription model class .
  MaxProposalSubscriptionModel({
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
  MaxProposalSubscription({
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
    required String appliesTo,
    required double max,
  }) =>
      MaxProposalSubscription(
        appliesTo: appliesTo,
        max: max,
      );
}
/// Max requestes general model class.
abstract class MaxRequestesGeneralModel {
  /// Initializes Max requestes general model class .
  MaxRequestesGeneralModel({
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
  MaxRequestesGeneral({
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
    required String appliesTo,
    required double hourly,
    required double minutely,
  }) =>
      MaxRequestesGeneral(
        appliesTo: appliesTo,
        hourly: hourly,
        minutely: minutely,
      );
}
/// Max requests outcome model class.
abstract class MaxRequestsOutcomeModel {
  /// Initializes Max requests outcome model class .
  MaxRequestsOutcomeModel({
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
  MaxRequestsOutcome({
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
    required String appliesTo,
    required double hourly,
    required double minutely,
  }) =>
      MaxRequestsOutcome(
        appliesTo: appliesTo,
        hourly: hourly,
        minutely: minutely,
      );
}
/// Max requests pricing model class.
abstract class MaxRequestsPricingModel {
  /// Initializes Max requests pricing model class .
  MaxRequestsPricingModel({
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
  MaxRequestsPricing({
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
    required String appliesTo,
    required double hourly,
    required double minutely,
  }) =>
      MaxRequestsPricing(
        appliesTo: appliesTo,
        hourly: hourly,
        minutely: minutely,
      );
}
/// Crypto config property model class.
abstract class CryptoConfigPropertyModel {
  /// Initializes Crypto config property model class .
  CryptoConfigPropertyModel({
    required this.minimumWithdrawal,
  });

  /// Minimum withdrawal for the currency in USD.
  final double minimumWithdrawal;
}

/// Crypto config property class.
class CryptoConfigProperty extends CryptoConfigPropertyModel {
  /// Initializes Crypto config property class.
  CryptoConfigProperty({
    required double minimumWithdrawal,
  }) : super(
          minimumWithdrawal: minimumWithdrawal,
        );

  /// Creates an instance from JSON.
  factory CryptoConfigProperty.fromJson(Map<String, dynamic> json) =>
      CryptoConfigProperty(
        minimumWithdrawal: getDouble(json['minimum_withdrawal'])!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['minimum_withdrawal'] = minimumWithdrawal;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CryptoConfigProperty copyWith({
    required double minimumWithdrawal,
  }) =>
      CryptoConfigProperty(
        minimumWithdrawal: minimumWithdrawal,
      );
}
/// Currencies config property model class.
abstract class CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property model class .
  CurrenciesConfigPropertyModel({
    required this.type,
    required this.transferBetweenAccounts,
    required this.stakeDefault,
    required this.isWithdrawalSuspended,
    required this.isSuspended,
    required this.isDepositSuspended,
    required this.fractionalDigits,
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
}

/// Currencies config property class.
class CurrenciesConfigProperty extends CurrenciesConfigPropertyModel {
  /// Initializes Currencies config property class.
  CurrenciesConfigProperty({
    required double fractionalDigits,
    required double isDepositSuspended,
    required double isSuspended,
    required double isWithdrawalSuspended,
    required double stakeDefault,
    required TransferBetweenAccounts transferBetweenAccounts,
    required TypeEnum type,
  }) : super(
          fractionalDigits: fractionalDigits,
          isDepositSuspended: isDepositSuspended,
          isSuspended: isSuspended,
          isWithdrawalSuspended: isWithdrawalSuspended,
          stakeDefault: stakeDefault,
          transferBetweenAccounts: transferBetweenAccounts,
          type: type,
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrenciesConfigProperty copyWith({
    required double fractionalDigits,
    required double isDepositSuspended,
    required double isSuspended,
    required double isWithdrawalSuspended,
    required double stakeDefault,
    required TransferBetweenAccounts transferBetweenAccounts,
    required TypeEnum type,
  }) =>
      CurrenciesConfigProperty(
        fractionalDigits: fractionalDigits,
        isDepositSuspended: isDepositSuspended,
        isSuspended: isSuspended,
        isWithdrawalSuspended: isWithdrawalSuspended,
        stakeDefault: stakeDefault,
        transferBetweenAccounts: transferBetweenAccounts,
        type: type,
      );
}
/// Transfer between accounts model class.
abstract class TransferBetweenAccountsModel {
  /// Initializes Transfer between accounts model class .
  TransferBetweenAccountsModel({
    required this.limits,
    required this.fees,
  });

  ///
  final Limits limits;

  /// The fee that applies for transfer between accounts with different types of currencies.
  final Map<String, double> fees;
}

/// Transfer between accounts class.
class TransferBetweenAccounts extends TransferBetweenAccountsModel {
  /// Initializes Transfer between accounts class.
  TransferBetweenAccounts({
    required Map<String, double> fees,
    required Limits limits,
  }) : super(
          fees: fees,
          limits: limits,
        );

  /// Creates an instance from JSON.
  factory TransferBetweenAccounts.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccounts(
        fees: Map<String, double>.fromEntries(json['fees']
            .entries
            .map<MapEntry<String, double>>((MapEntry<String, dynamic> entry) =>
                MapEntry<String, double>(entry.key, getDouble(entry.value)!))),
        limits: Limits.fromJson(json['limits']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fees'] = fees;
    resultMap['limits'] = limits.toJson();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TransferBetweenAccounts copyWith({
    required Map<String, double> fees,
    required Limits limits,
  }) =>
      TransferBetweenAccounts(
        fees: fees,
        limits: limits,
      );
}
/// Limits model class.
abstract class LimitsModel {
  /// Initializes Limits model class .
  LimitsModel({
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
  Limits({
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
    required double min,
    double? max,
  }) =>
      Limits(
        min: min,
        max: max ?? this.max,
      );
}
/// P2p config model class.
abstract class P2pConfigModel {
  /// Initializes P2p config model class .
  P2pConfigModel({
    required this.orderPaymentPeriod,
    required this.orderDailyLimit,
    required this.maximumOrderAmount,
    required this.maximumAdvertAmount,
    required this.cancellationLimit,
    required this.cancellationGracePeriod,
    required this.cancellationCountPeriod,
    required this.cancellationBlockDuration,
    required this.advertsActiveLimit,
    this.advertsArchivePeriod,
  });

  /// Time allowed for order payment, in minutes after order creation.
  final int orderPaymentPeriod;

  /// Maximum number of orders a user may create per day.
  final int orderDailyLimit;

  /// Maximum amount of an order, in USD.
  final double maximumOrderAmount;

  /// Maximum amount of an advert, in USD.
  final double maximumAdvertAmount;

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
}

/// P2p config class.
class P2pConfig extends P2pConfigModel {
  /// Initializes P2p config class.
  P2pConfig({
    required int advertsActiveLimit,
    required int cancellationBlockDuration,
    required int cancellationCountPeriod,
    required int cancellationGracePeriod,
    required int cancellationLimit,
    required double maximumAdvertAmount,
    required double maximumOrderAmount,
    required int orderDailyLimit,
    required int orderPaymentPeriod,
    int? advertsArchivePeriod,
  }) : super(
          advertsActiveLimit: advertsActiveLimit,
          cancellationBlockDuration: cancellationBlockDuration,
          cancellationCountPeriod: cancellationCountPeriod,
          cancellationGracePeriod: cancellationGracePeriod,
          cancellationLimit: cancellationLimit,
          maximumAdvertAmount: maximumAdvertAmount,
          maximumOrderAmount: maximumOrderAmount,
          orderDailyLimit: orderDailyLimit,
          orderPaymentPeriod: orderPaymentPeriod,
          advertsArchivePeriod: advertsArchivePeriod,
        );

  /// Creates an instance from JSON.
  factory P2pConfig.fromJson(Map<String, dynamic> json) => P2pConfig(
        advertsActiveLimit: json['adverts_active_limit'],
        cancellationBlockDuration: json['cancellation_block_duration'],
        cancellationCountPeriod: json['cancellation_count_period'],
        cancellationGracePeriod: json['cancellation_grace_period'],
        cancellationLimit: json['cancellation_limit'],
        maximumAdvertAmount: getDouble(json['maximum_advert_amount'])!,
        maximumOrderAmount: getDouble(json['maximum_order_amount'])!,
        orderDailyLimit: json['order_daily_limit'],
        orderPaymentPeriod: json['order_payment_period'],
        advertsArchivePeriod: json['adverts_archive_period'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['adverts_active_limit'] = advertsActiveLimit;
    resultMap['cancellation_block_duration'] = cancellationBlockDuration;
    resultMap['cancellation_count_period'] = cancellationCountPeriod;
    resultMap['cancellation_grace_period'] = cancellationGracePeriod;
    resultMap['cancellation_limit'] = cancellationLimit;
    resultMap['maximum_advert_amount'] = maximumAdvertAmount;
    resultMap['maximum_order_amount'] = maximumOrderAmount;
    resultMap['order_daily_limit'] = orderDailyLimit;
    resultMap['order_payment_period'] = orderPaymentPeriod;
    resultMap['adverts_archive_period'] = advertsArchivePeriod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pConfig copyWith({
    required int advertsActiveLimit,
    required int cancellationBlockDuration,
    required int cancellationCountPeriod,
    required int cancellationGracePeriod,
    required int cancellationLimit,
    required double maximumAdvertAmount,
    required double maximumOrderAmount,
    required int orderDailyLimit,
    required int orderPaymentPeriod,
    int? advertsArchivePeriod,
  }) =>
      P2pConfig(
        advertsActiveLimit: advertsActiveLimit,
        cancellationBlockDuration: cancellationBlockDuration,
        cancellationCountPeriod: cancellationCountPeriod,
        cancellationGracePeriod: cancellationGracePeriod,
        cancellationLimit: cancellationLimit,
        maximumAdvertAmount: maximumAdvertAmount,
        maximumOrderAmount: maximumOrderAmount,
        orderDailyLimit: orderDailyLimit,
        orderPaymentPeriod: orderPaymentPeriod,
        advertsArchivePeriod: advertsArchivePeriod ?? this.advertsArchivePeriod,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  Subscription({
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
    required String id,
  }) =>
      Subscription(
        id: id,
      );
}
