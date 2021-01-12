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
    @required this.websiteStatus,
    @required this.subscription,
  });

  /// Server status and other information regarding general settings
  final WebsiteStatus websiteStatus;

  /// For subscription requests only.
  final Subscription subscription;
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

final Map<String, SiteStatusEnum> siteStatusEnumMapper =
    <String, SiteStatusEnum>{
  "up": SiteStatusEnum.up,
  "down": SiteStatusEnum.down,
};

/// site_status Enum
enum SiteStatusEnum {
  up,
  down,
}
/// Website status model class
abstract class WebsiteStatusModel {
  /// Initializes
  WebsiteStatusModel({
    @required this.apiCallLimits,
    @required this.clientsCountry,
    @required this.cryptoConfig,
    @required this.currenciesConfig,
    @required this.message,
    @required this.siteStatus,
    @required this.supportedLanguages,
    @required this.termsConditionsVersion,
  });

  /// Maximum number of API calls during specified period of time.
  final ApiCallLimits apiCallLimits;

  /// Country code of connected IP
  final String clientsCountry;

  /// Provides minimum withdrawal for all crypto currency in USD
  final Map<String, dynamic> cryptoConfig;

  /// Available currencies and their information
  final Map<String, dynamic> currenciesConfig;

  /// Text for site status banner, contains problem description. shown only if set by the system.
  final String message;

  /// The current status of the website.
  final SiteStatusEnum siteStatus;

  /// Provides codes for languages supported.
  final List<String> supportedLanguages;

  /// Latest terms and conditions version.
  final String termsConditionsVersion;
}

/// Website status class
class WebsiteStatus extends WebsiteStatusModel {
  /// Initializes
  WebsiteStatus({
    @required ApiCallLimits apiCallLimits,
    @required String clientsCountry,
    @required Map<String, dynamic> cryptoConfig,
    @required Map<String, dynamic> currenciesConfig,
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
        cryptoConfig: json['crypto_config'],
        currenciesConfig: json['currencies_config'],
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
    Map<String, dynamic> cryptoConfig,
    Map<String, dynamic> currenciesConfig,
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
    @required this.maxProposalSubscription,
    @required this.maxRequestesGeneral,
    @required this.maxRequestsOutcome,
    @required this.maxRequestsPricing,
  });

  /// Maximum subscription to proposal calls.
  final MaxProposalSubscription maxProposalSubscription;

  /// Maximum number of general requests allowed during specified period of time.
  final MaxRequestesGeneral maxRequestesGeneral;

  /// Maximum number of outcome requests allowed during specified period of time.
  final MaxRequestsOutcome maxRequestsOutcome;

  /// Maximum number of pricing requests allowed during specified period of time.
  final MaxRequestsPricing maxRequestsPricing;
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
    @required this.appliesTo,
    @required this.max,
  });

  /// Describes which calls this limit applies to.
  final String appliesTo;

  /// Maximum number of allowed calls.
  final double max;
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
    @required this.appliesTo,
    @required this.hourly,
    @required this.minutely,
  });

  /// Describes which calls this limit applies to.
  final String appliesTo;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// The maximum of allowed calls per minute.
  final double minutely;
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
    @required this.appliesTo,
    @required this.hourly,
    @required this.minutely,
  });

  /// Describes which calls this limit applies to.
  final String appliesTo;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// The maximum of allowed calls per minute.
  final double minutely;
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
    @required this.appliesTo,
    @required this.hourly,
    @required this.minutely,
  });

  /// Describes which calls this limit applies to.
  final String appliesTo;

  /// The maximum of allowed calls per hour.
  final double hourly;

  /// The maximum of allowed calls per minute.
  final double minutely;
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
