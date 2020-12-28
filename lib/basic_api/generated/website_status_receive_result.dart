/// Website status receive model class
abstract class WebsiteStatusReceiveModel {
  /// Initializes
  WebsiteStatusReceiveModel({
    @required this.websiteStatus,
    @required this.subscription,
  });

  /// Server status and other information regarding general settings
  final WebsiteStatus websiteStatus;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Website status receive class
class WebsiteStatusReceive extends WebsiteStatusReceiveModel {
  /// Initializes
  WebsiteStatusReceive({
    @required WebsiteStatus websiteStatus,
    @required Subscription subscription,
  }) : super(
          websiteStatus: websiteStatus,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory WebsiteStatusReceive.fromJson(Map<String, dynamic> json) =>
      WebsiteStatusReceive(
        websiteStatus: json['website_status'] == null
            ? null
            : WebsiteStatus.fromJson(json['website_status']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (websiteStatus != null) {
      result['website_status'] = websiteStatus.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  WebsiteStatusReceive copyWith({
    WebsiteStatus websiteStatus,
    Subscription subscription,
  }) =>
      WebsiteStatusReceive(
        websiteStatus: websiteStatus ?? this.websiteStatus,
        subscription: subscription ?? this.subscription,
      );
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
    @required String siteStatus,
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
        siteStatus: json['site_status'] == null
            ? null
            : siteStatusEnumMapper.entries
                .firstWhere((entry) => entry.value == json['site_status'],
                    orElse: () => null)
                ?.key,
        supportedLanguages:
            List<String>.from(json['supported_languages'].map((x) => x)),
        termsConditionsVersion: json['terms_conditions_version'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (apiCallLimits != null) {
      result['api_call_limits'] = apiCallLimits.toJson();
    }
    result['clients_country'] = clientsCountry;
    result['crypto_config'] = cryptoConfig;
    result['currencies_config'] = currenciesConfig;
    result['message'] = message;
    result['site_status'] = siteStatusEnumMapper[siteStatus];
    result['supported_languages'] = supportedLanguages;
    result['terms_conditions_version'] = termsConditionsVersion;

    return result;
  }

  /// Creates a copy of instance with given parameters
  WebsiteStatus copyWith({
    ApiCallLimits apiCallLimits,
    String clientsCountry,
    Map<String, dynamic> cryptoConfig,
    Map<String, dynamic> currenciesConfig,
    String message,
    String siteStatus,
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
  // Creating Enum Mappers

  static final Map<SiteStatusEnum, String> siteStatusEnumMapper = {
    SiteStatusEnum.up: 'up',
    SiteStatusEnum.down: 'down',
  };
}

// Creating Enums

enum SiteStatusEnum {
  up,
  down,
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
    final Map<String, dynamic> result = <String, dynamic>{};

    if (maxProposalSubscription != null) {
      result['max_proposal_subscription'] = maxProposalSubscription.toJson();
    }
    if (maxRequestesGeneral != null) {
      result['max_requestes_general'] = maxRequestesGeneral.toJson();
    }
    if (maxRequestsOutcome != null) {
      result['max_requests_outcome'] = maxRequestsOutcome.toJson();
    }
    if (maxRequestsPricing != null) {
      result['max_requests_pricing'] = maxRequestsPricing.toJson();
    }

    return result;
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['applies_to'] = appliesTo;
    result['max'] = max;

    return result;
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['applies_to'] = appliesTo;
    result['hourly'] = hourly;
    result['minutely'] = minutely;

    return result;
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['applies_to'] = appliesTo;
    result['hourly'] = hourly;
    result['minutely'] = minutely;

    return result;
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['applies_to'] = appliesTo;
    result['hourly'] = hourly;
    result['minutely'] = minutely;

    return result;
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
