import 'package:meta/meta.dart';

import '../../basic_api/generated/forget_all_receive.dart';
import '../../basic_api/generated/forget_receive.dart';
import '../../basic_api/generated/website_status_receive.dart';
import '../../basic_api/generated/website_status_send.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import '../models/enums.dart';
import 'forget_all_receive_result.dart';
import 'forget_receive_result.dart';

/// Website status response model class
abstract class WebsiteStatusResponseModel {
  /// Initializes
  WebsiteStatusResponseModel({
    @required this.subscription,
    @required this.websiteStatus,
  });

  /// For subscription requests only.
  final Subscription subscription;

  /// Server status and other information regarding general settings
  final WebsiteStatus websiteStatus;
}

/// Website status response class
class WebsiteStatusResponse extends WebsiteStatusResponseModel {
  /// Initializes
  WebsiteStatusResponse({
    @required WebsiteStatus websiteStatus,
    @required Subscription subscription,
  }) : super(
          websiteStatus: websiteStatus,
          subscription: subscription,
        );

  /// Creates an instance from JSON
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

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (websiteStatus != null) {
      resultMap['website_status'] = websiteStatus.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets Website status
  ///
  /// Throws a [WebsiteStatusException] if API response contains an error
  static Future<WebsiteStatusResponse> fetchWebsiteStatus([
    WebsiteStatusSend request,
  ]) async {
    final WebsiteStatusReceive response = await _api.call(
      request: request ?? const WebsiteStatusSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return WebsiteStatusResponse.fromJson(
        response.websiteStatus, response.subscription);
  }

  /// Subscribes to website status
  static Stream<WebsiteStatusResponse> subscribeWebsiteStatus(
    WebsiteStatusSend request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<WebsiteStatusResponse>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
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
  Future<ForgetResponse> unsubscribeWebsiteStatus() async {
    if (subscription?.id == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
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
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          WebsiteStatusException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters
  WebsiteStatusResponse copyWith({
    WebsiteStatus websiteStatus,
    Subscription subscription,
  }) =>
      WebsiteStatusResponse(
        websiteStatus: websiteStatus ?? this.websiteStatus,
        subscription: subscription ?? this.subscription,
      );
}

final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "fiat": TypeEnum.fiat,
  "crypto": TypeEnum.crypto,
};

/// type Enum
enum TypeEnum {
  fiat,
  crypto,
}

final Map<String, SiteStatusEnum> siteStatusEnumMapper =
    <String, SiteStatusEnum>{
  "up": SiteStatusEnum.up,
  "down": SiteStatusEnum.down,
  "updating": SiteStatusEnum.updating,
};

/// site_status Enum
enum SiteStatusEnum {
  up,
  down,
  updating,
}
/// Website status model class
abstract class WebsiteStatusModel {
  /// Initializes
  WebsiteStatusModel({
    @required this.termsConditionsVersion,
    @required this.supportedLanguages,
    @required this.siteStatus,
    @required this.message,
    @required this.currenciesConfig,
    @required this.cryptoConfig,
    @required this.clientsCountry,
    @required this.apiCallLimits,
  });

  /// Latest terms and conditions version.
  final String termsConditionsVersion;

  /// Provides codes for languages supported.
  final List<String> supportedLanguages;

  /// The current status of the website.
  final SiteStatusEnum siteStatus;

  /// Text for site status banner, contains problem description. shown only if set by the system.
  final String message;

  /// Available currencies and their information
  final Map<String, CurrenciesConfigProperty> currenciesConfig;

  /// Provides minimum withdrawal for all crypto currency in USD
  final Map<String, CryptoConfigProperty> cryptoConfig;

  /// Country code of connected IP
  final String clientsCountry;

  /// Maximum number of API calls during specified period of time.
  final ApiCallLimits apiCallLimits;
}

/// Website status class
class WebsiteStatus extends WebsiteStatusModel {
  /// Initializes
  WebsiteStatus({
    @required ApiCallLimits apiCallLimits,
    @required String clientsCountry,
    @required Map<String, CryptoConfigProperty> cryptoConfig,
    @required Map<String, CurrenciesConfigProperty> currenciesConfig,
    @required String message,
    @required SiteStatusEnum siteStatus,
    @required List<String> supportedLanguages,
    @required String termsConditionsVersion,
  }) : super(
          apiCallLimits: apiCallLimits,
          clientsCountry: clientsCountry,
          cryptoConfig: cryptoConfig,
          currenciesConfig: currenciesConfig,
          message: message,
          siteStatus: siteStatus,
          supportedLanguages: supportedLanguages,
          termsConditionsVersion: termsConditionsVersion,
        );

  /// Creates an instance from JSON
  factory WebsiteStatus.fromJson(Map<String, dynamic> json) => WebsiteStatus(
        apiCallLimits: json['api_call_limits'] == null
            ? null
            : ApiCallLimits.fromJson(json['api_call_limits']),
        clientsCountry: json['clients_country'],
        cryptoConfig: json['crypto_config'] == null
            ? null
            : Map<String, CryptoConfigProperty>.fromEntries(json[
                    'crypto_config']
                .entries
                .map<MapEntry<String, CryptoConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CryptoConfigProperty>(
                            entry.key,
                            entry.value == null
                                ? null
                                : CryptoConfigProperty.fromJson(entry.value)))),
        currenciesConfig: json['currencies_config'] == null
            ? null
            : Map<String, CurrenciesConfigProperty>.fromEntries(
                json['currencies_config']
                    .entries
                    .map<MapEntry<String, CurrenciesConfigProperty>>(
                        (MapEntry<String, dynamic> entry) =>
                            MapEntry<String, CurrenciesConfigProperty>(
                                entry.key,
                                entry.value == null
                                    ? null
                                    : CurrenciesConfigProperty.fromJson(
                                        entry.value)))),
        message: json['message'],
        siteStatus: siteStatusEnumMapper[json['site_status']],
        supportedLanguages: json['supported_languages'] == null
            ? null
            : List<String>.from(
                json['supported_languages'].map((dynamic item) => item)),
        termsConditionsVersion: json['terms_conditions_version'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (apiCallLimits != null) {
      resultMap['api_call_limits'] = apiCallLimits.toJson();
    }
    resultMap['clients_country'] = clientsCountry;
    resultMap['crypto_config'] = cryptoConfig;
    resultMap['currencies_config'] = currenciesConfig;
    resultMap['message'] = message;
    resultMap['site_status'] = siteStatusEnumMapper.entries
        .firstWhere((entry) => entry.value == siteStatus, orElse: () => null)
        ?.key;
    if (supportedLanguages != null) {
      resultMap['supported_languages'] =
          supportedLanguages.map<dynamic>((String item) => item).toList();
    }
    resultMap['terms_conditions_version'] = termsConditionsVersion;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  WebsiteStatus copyWith({
    ApiCallLimits apiCallLimits,
    String clientsCountry,
    Map<String, CryptoConfigProperty> cryptoConfig,
    Map<String, CurrenciesConfigProperty> currenciesConfig,
    String message,
    SiteStatusEnum siteStatus,
    List<String> supportedLanguages,
    String termsConditionsVersion,
  }) =>
      WebsiteStatus(
        apiCallLimits: apiCallLimits ?? this.apiCallLimits,
        clientsCountry: clientsCountry ?? this.clientsCountry,
        cryptoConfig: cryptoConfig ?? this.cryptoConfig,
        currenciesConfig: currenciesConfig ?? this.currenciesConfig,
        message: message ?? this.message,
        siteStatus: siteStatus ?? this.siteStatus,
        supportedLanguages: supportedLanguages ?? this.supportedLanguages,
        termsConditionsVersion:
            termsConditionsVersion ?? this.termsConditionsVersion,
      );
}
/// Api call limits model class
abstract class ApiCallLimitsModel {
  /// Initializes
  ApiCallLimitsModel({
    @required this.maxRequestsPricing,
    @required this.maxRequestsOutcome,
    @required this.maxRequestesGeneral,
    @required this.maxProposalSubscription,
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

/// Api call limits class
class ApiCallLimits extends ApiCallLimitsModel {
  /// Initializes
  ApiCallLimits({
    @required MaxProposalSubscription maxProposalSubscription,
    @required MaxRequestesGeneral maxRequestesGeneral,
    @required MaxRequestsOutcome maxRequestsOutcome,
    @required MaxRequestsPricing maxRequestsPricing,
  }) : super(
          maxProposalSubscription: maxProposalSubscription,
          maxRequestesGeneral: maxRequestesGeneral,
          maxRequestsOutcome: maxRequestsOutcome,
          maxRequestsPricing: maxRequestsPricing,
        );

  /// Creates an instance from JSON
  factory ApiCallLimits.fromJson(Map<String, dynamic> json) => ApiCallLimits(
        maxProposalSubscription: json['max_proposal_subscription'] == null
            ? null
            : MaxProposalSubscription.fromJson(
                json['max_proposal_subscription']),
        maxRequestesGeneral: json['max_requestes_general'] == null
            ? null
            : MaxRequestesGeneral.fromJson(json['max_requestes_general']),
        maxRequestsOutcome: json['max_requests_outcome'] == null
            ? null
            : MaxRequestsOutcome.fromJson(json['max_requests_outcome']),
        maxRequestsPricing: json['max_requests_pricing'] == null
            ? null
            : MaxRequestsPricing.fromJson(json['max_requests_pricing']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (maxProposalSubscription != null) {
      resultMap['max_proposal_subscription'] = maxProposalSubscription.toJson();
    }
    if (maxRequestesGeneral != null) {
      resultMap['max_requestes_general'] = maxRequestesGeneral.toJson();
    }
    if (maxRequestsOutcome != null) {
      resultMap['max_requests_outcome'] = maxRequestsOutcome.toJson();
    }
    if (maxRequestsPricing != null) {
      resultMap['max_requests_pricing'] = maxRequestsPricing.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ApiCallLimits copyWith({
    MaxProposalSubscription maxProposalSubscription,
    MaxRequestesGeneral maxRequestesGeneral,
    MaxRequestsOutcome maxRequestsOutcome,
    MaxRequestsPricing maxRequestsPricing,
  }) =>
      ApiCallLimits(
        maxProposalSubscription:
            maxProposalSubscription ?? this.maxProposalSubscription,
        maxRequestesGeneral: maxRequestesGeneral ?? this.maxRequestesGeneral,
        maxRequestsOutcome: maxRequestsOutcome ?? this.maxRequestsOutcome,
        maxRequestsPricing: maxRequestsPricing ?? this.maxRequestsPricing,
      );
}
/// Max proposal subscription model class
abstract class MaxProposalSubscriptionModel {
  /// Initializes
  MaxProposalSubscriptionModel({
    @required this.max,
    @required this.appliesTo,
  });

  /// Maximum number of allowed calls.
  final double max;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max proposal subscription class
class MaxProposalSubscription extends MaxProposalSubscriptionModel {
  /// Initializes
  MaxProposalSubscription({
    @required String appliesTo,
    @required double max,
  }) : super(
          appliesTo: appliesTo,
          max: max,
        );

  /// Creates an instance from JSON
  factory MaxProposalSubscription.fromJson(Map<String, dynamic> json) =>
      MaxProposalSubscription(
        appliesTo: json['applies_to'],
        max: getDouble(json['max']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['max'] = max;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MaxProposalSubscription copyWith({
    String appliesTo,
    double max,
  }) =>
      MaxProposalSubscription(
        appliesTo: appliesTo ?? this.appliesTo,
        max: max ?? this.max,
      );
}
/// Max requestes general model class
abstract class MaxRequestesGeneralModel {
  /// Initializes
  MaxRequestesGeneralModel({
    @required this.minutely,
    @required this.hourly,
    @required this.appliesTo,
  });

  /// The maximum of allowed calls per minute.
  final double minutely;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max requestes general class
class MaxRequestesGeneral extends MaxRequestesGeneralModel {
  /// Initializes
  MaxRequestesGeneral({
    @required String appliesTo,
    @required double hourly,
    @required double minutely,
  }) : super(
          appliesTo: appliesTo,
          hourly: hourly,
          minutely: minutely,
        );

  /// Creates an instance from JSON
  factory MaxRequestesGeneral.fromJson(Map<String, dynamic> json) =>
      MaxRequestesGeneral(
        appliesTo: json['applies_to'],
        hourly: getDouble(json['hourly']),
        minutely: getDouble(json['minutely']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['hourly'] = hourly;
    resultMap['minutely'] = minutely;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MaxRequestesGeneral copyWith({
    String appliesTo,
    double hourly,
    double minutely,
  }) =>
      MaxRequestesGeneral(
        appliesTo: appliesTo ?? this.appliesTo,
        hourly: hourly ?? this.hourly,
        minutely: minutely ?? this.minutely,
      );
}
/// Max requests outcome model class
abstract class MaxRequestsOutcomeModel {
  /// Initializes
  MaxRequestsOutcomeModel({
    @required this.minutely,
    @required this.hourly,
    @required this.appliesTo,
  });

  /// The maximum of allowed calls per minute.
  final double minutely;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max requests outcome class
class MaxRequestsOutcome extends MaxRequestsOutcomeModel {
  /// Initializes
  MaxRequestsOutcome({
    @required String appliesTo,
    @required double hourly,
    @required double minutely,
  }) : super(
          appliesTo: appliesTo,
          hourly: hourly,
          minutely: minutely,
        );

  /// Creates an instance from JSON
  factory MaxRequestsOutcome.fromJson(Map<String, dynamic> json) =>
      MaxRequestsOutcome(
        appliesTo: json['applies_to'],
        hourly: getDouble(json['hourly']),
        minutely: getDouble(json['minutely']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['hourly'] = hourly;
    resultMap['minutely'] = minutely;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MaxRequestsOutcome copyWith({
    String appliesTo,
    double hourly,
    double minutely,
  }) =>
      MaxRequestsOutcome(
        appliesTo: appliesTo ?? this.appliesTo,
        hourly: hourly ?? this.hourly,
        minutely: minutely ?? this.minutely,
      );
}
/// Max requests pricing model class
abstract class MaxRequestsPricingModel {
  /// Initializes
  MaxRequestsPricingModel({
    @required this.minutely,
    @required this.hourly,
    @required this.appliesTo,
  });

  /// The maximum of allowed calls per minute.
  final double minutely;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// Describes which calls this limit applies to.
  final String appliesTo;
}

/// Max requests pricing class
class MaxRequestsPricing extends MaxRequestsPricingModel {
  /// Initializes
  MaxRequestsPricing({
    @required String appliesTo,
    @required double hourly,
    @required double minutely,
  }) : super(
          appliesTo: appliesTo,
          hourly: hourly,
          minutely: minutely,
        );

  /// Creates an instance from JSON
  factory MaxRequestsPricing.fromJson(Map<String, dynamic> json) =>
      MaxRequestsPricing(
        appliesTo: json['applies_to'],
        hourly: getDouble(json['hourly']),
        minutely: getDouble(json['minutely']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['applies_to'] = appliesTo;
    resultMap['hourly'] = hourly;
    resultMap['minutely'] = minutely;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MaxRequestsPricing copyWith({
    String appliesTo,
    double hourly,
    double minutely,
  }) =>
      MaxRequestsPricing(
        appliesTo: appliesTo ?? this.appliesTo,
        hourly: hourly ?? this.hourly,
        minutely: minutely ?? this.minutely,
      );
}
/// Crypto config property model class
abstract class CryptoConfigPropertyModel {
  /// Initializes
  CryptoConfigPropertyModel({
    @required this.minimumWithdrawal,
  });

  /// Minimum withdrawal for the currency in USD.
  final double minimumWithdrawal;
}

/// Crypto config property class
class CryptoConfigProperty extends CryptoConfigPropertyModel {
  /// Initializes
  CryptoConfigProperty({
    @required double minimumWithdrawal,
  }) : super(
          minimumWithdrawal: minimumWithdrawal,
        );

  /// Creates an instance from JSON
  factory CryptoConfigProperty.fromJson(Map<String, dynamic> json) =>
      CryptoConfigProperty(
        minimumWithdrawal: getDouble(json['minimum_withdrawal']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['minimum_withdrawal'] = minimumWithdrawal;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  CryptoConfigProperty copyWith({
    double minimumWithdrawal,
  }) =>
      CryptoConfigProperty(
        minimumWithdrawal: minimumWithdrawal ?? this.minimumWithdrawal,
      );
}
/// Currencies config property model class
abstract class CurrenciesConfigPropertyModel {
  /// Initializes
  CurrenciesConfigPropertyModel({
    @required this.type,
    @required this.transferBetweenAccounts,
    @required this.stakeDefault,
    @required this.isWithdrawalSuspended,
    @required this.isSuspended,
    @required this.isDepositSuspended,
    @required this.fractionalDigits,
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

/// Currencies config property class
class CurrenciesConfigProperty extends CurrenciesConfigPropertyModel {
  /// Initializes
  CurrenciesConfigProperty({
    @required double fractionalDigits,
    @required double isDepositSuspended,
    @required double isSuspended,
    @required double isWithdrawalSuspended,
    @required double stakeDefault,
    @required TransferBetweenAccounts transferBetweenAccounts,
    @required TypeEnum type,
  }) : super(
          fractionalDigits: fractionalDigits,
          isDepositSuspended: isDepositSuspended,
          isSuspended: isSuspended,
          isWithdrawalSuspended: isWithdrawalSuspended,
          stakeDefault: stakeDefault,
          transferBetweenAccounts: transferBetweenAccounts,
          type: type,
        );

  /// Creates an instance from JSON
  factory CurrenciesConfigProperty.fromJson(Map<String, dynamic> json) =>
      CurrenciesConfigProperty(
        fractionalDigits: getDouble(json['fractional_digits']),
        isDepositSuspended: getDouble(json['is_deposit_suspended']),
        isSuspended: getDouble(json['is_suspended']),
        isWithdrawalSuspended: getDouble(json['is_withdrawal_suspended']),
        stakeDefault: getDouble(json['stake_default']),
        transferBetweenAccounts: json['transfer_between_accounts'] == null
            ? null
            : TransferBetweenAccounts.fromJson(
                json['transfer_between_accounts']),
        type: typeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fractional_digits'] = fractionalDigits;
    resultMap['is_deposit_suspended'] = isDepositSuspended;
    resultMap['is_suspended'] = isSuspended;
    resultMap['is_withdrawal_suspended'] = isWithdrawalSuspended;
    resultMap['stake_default'] = stakeDefault;
    if (transferBetweenAccounts != null) {
      resultMap['transfer_between_accounts'] = transferBetweenAccounts.toJson();
    }
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((entry) => entry.value == type, orElse: () => null)
        ?.key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  CurrenciesConfigProperty copyWith({
    double fractionalDigits,
    double isDepositSuspended,
    double isSuspended,
    double isWithdrawalSuspended,
    double stakeDefault,
    TransferBetweenAccounts transferBetweenAccounts,
    TypeEnum type,
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
      );
}
/// Transfer between accounts model class
abstract class TransferBetweenAccountsModel {
  /// Initializes
  TransferBetweenAccountsModel({
    @required this.limits,
    @required this.fees,
  });

  ///
  final Limits limits;

  /// The fee that applies for transfer between accounts with different types of currencies.
  final Map<String, double> fees;
}

/// Transfer between accounts class
class TransferBetweenAccounts extends TransferBetweenAccountsModel {
  /// Initializes
  TransferBetweenAccounts({
    @required Map<String, double> fees,
    @required Limits limits,
  }) : super(
          fees: fees,
          limits: limits,
        );

  /// Creates an instance from JSON
  factory TransferBetweenAccounts.fromJson(Map<String, dynamic> json) =>
      TransferBetweenAccounts(
        fees: json['fees'] == null
            ? null
            : Map<String, double>.fromEntries(json['fees']
                .entries
                .map<MapEntry<String, double>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, double>(
                            entry.key, getDouble(entry.value)))),
        limits: json['limits'] == null ? null : Limits.fromJson(json['limits']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fees'] = fees;
    if (limits != null) {
      resultMap['limits'] = limits.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TransferBetweenAccounts copyWith({
    Map<String, double> fees,
    Limits limits,
  }) =>
      TransferBetweenAccounts(
        fees: fees ?? this.fees,
        limits: limits ?? this.limits,
      );
}
/// Limits model class
abstract class LimitsModel {
  /// Initializes
  LimitsModel({
    @required this.min,
    @required this.max,
  });

  /// Minimum allowed amount for transfer between accounts with different types of currencies.
  final double min;

  /// Maximum allowed amount for transfer between accounts with different types of currencies.
  final double max;
}

/// Limits class
class Limits extends LimitsModel {
  /// Initializes
  Limits({
    @required double max,
    @required double min,
  }) : super(
          max: max,
          min: min,
        );

  /// Creates an instance from JSON
  factory Limits.fromJson(Map<String, dynamic> json) => Limits(
        max: getDouble(json['max']),
        min: getDouble(json['min']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max'] = max;
    resultMap['min'] = min;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Limits copyWith({
    double max,
    double min,
  }) =>
      Limits(
        max: max ?? this.max,
        min: min ?? this.min,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
