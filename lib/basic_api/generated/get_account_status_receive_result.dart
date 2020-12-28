/// Get account status receive model class
abstract class GetAccountStatusReceiveModel {
  /// Initializes
  GetAccountStatusReceiveModel({
    @required this.getAccountStatus,
  });

  /// Account status details
  final GetAccountStatus getAccountStatus;
}

/// Get account status receive class
class GetAccountStatusReceive extends GetAccountStatusReceiveModel {
  /// Initializes
  GetAccountStatusReceive({
    @required GetAccountStatus getAccountStatus,
  }) : super(
          getAccountStatus: getAccountStatus,
        );

  /// Creates an instance from JSON
  factory GetAccountStatusReceive.fromJson(Map<String, dynamic> json) =>
      GetAccountStatusReceive(
        getAccountStatus: json['get_account_status'] == null
            ? null
            : GetAccountStatus.fromJson(json['get_account_status']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (getAccountStatus != null) {
      result['get_account_status'] = getAccountStatus.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetAccountStatusReceive copyWith({
    GetAccountStatus getAccountStatus,
  }) =>
      GetAccountStatusReceive(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
      );
}
/// Get account status model class
abstract class GetAccountStatusModel {
  /// Initializes
  GetAccountStatusModel({
    @required this.authentication,
    @required this.currencyConfig,
    @required this.promptClientToAuthenticate,
    @required this.riskClassification,
    @required this.status,
  });

  /// This represents the authentication status of the user and it includes what authentication is needed.
  final Authentication authentication;

  /// Provides cashier details for client currency.
  final Map<String, dynamic> currencyConfig;

  /// Indicates whether the client should be prompted to authenticate their account.
  final bool promptClientToAuthenticate;

  /// Client risk classification: `low`, `standard`, `high`.
  final String riskClassification;

  /// Account status. Possible status:
  /// - `address_verified`: client's address is verified by third party services.
  /// - `age_verification`: client is age-verified.
  /// - `authenticated`: client is fully authenticated.
  /// - `cashier_locked`: cashier is locked.
  /// - `closed`: client has closed the account.
  /// - `crs_tin_information`: client has updated tax related information.
  /// - `disabled`: account is disabled.
  /// - `document_expired`: client's submitted proof-of-identity documents have expired.
  /// - `document_expiring_soon`: client's submitted proof-of-identity documents are expiring within a month.
  /// - `duplicate_account`: this client's account has been marked as duplicate.
  /// - `financial_assessment_not_complete`: client has not completed financial assessment.
  /// - `financial_risk_approval`: client has accepted financial risk disclosure.
  /// - `max_turnover_limit_not_set`: client has not set financial limits on their account. Applies to UK and Malta clients.
  /// - `mt5_withdrawal_locked`: MT5 deposits allowed, but withdrawal is not allowed.
  /// - `no_trading`: trading is disabled.
  /// - `no_withdrawal_or_trading`: client cannot trade or withdraw but can deposit.
  /// - `pa_withdrawal_explicitly_allowed`: withdrawal through payment agent is allowed.
  /// - `professional`: this client has opted for a professional account.
  /// - `professional_requested`: this client has requested for a professional account.
  /// - `professional_rejected`: this client's request for a professional account has been rejected.
  /// - `proveid_pending`: this client's identity is being validated. Applies for MX account with GB residence only.
  /// - `proveid_requested`: this client has made a request to have their identity be validated.
  /// - `social_signup`: this client is using social signup.
  /// - `ukgc_funds_protection`: client has acknowledged UKGC funds protection notice.
  /// - `unwelcome`: client cannot deposit or buy contracts, but can withdraw or sell contracts.
  /// - `withdrawal_locked`: deposits allowed but withdrawals are not allowed.
  final List<String> status;
}

/// Get account status class
class GetAccountStatus extends GetAccountStatusModel {
  /// Initializes
  GetAccountStatus({
    @required Authentication authentication,
    @required Map<String, dynamic> currencyConfig,
    @required bool promptClientToAuthenticate,
    @required String riskClassification,
    @required List<String> status,
  }) : super(
          authentication: authentication,
          currencyConfig: currencyConfig,
          promptClientToAuthenticate: promptClientToAuthenticate,
          riskClassification: riskClassification,
          status: status,
        );

  /// Creates an instance from JSON
  factory GetAccountStatus.fromJson(Map<String, dynamic> json) =>
      GetAccountStatus(
        authentication: json['authentication'] == null
            ? null
            : Authentication.fromJson(json['authentication']),
        currencyConfig: json['currency_config'],
        promptClientToAuthenticate:
            getBool(json['prompt_client_to_authenticate']),
        riskClassification: json['risk_classification'],
        status: List<String>.from(json['status'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (authentication != null) {
      result['authentication'] = authentication.toJson();
    }
    result['currency_config'] = currencyConfig;
    result['prompt_client_to_authenticate'] = promptClientToAuthenticate;
    result['risk_classification'] = riskClassification;
    result['status'] = status;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetAccountStatus copyWith({
    Authentication authentication,
    Map<String, dynamic> currencyConfig,
    bool promptClientToAuthenticate,
    String riskClassification,
    List<String> status,
  }) =>
      GetAccountStatus(
        authentication: authentication ?? this.authentication,
        currencyConfig: currencyConfig ?? this.currencyConfig,
        promptClientToAuthenticate:
            promptClientToAuthenticate ?? this.promptClientToAuthenticate,
        riskClassification: riskClassification ?? this.riskClassification,
        status: status ?? this.status,
      );
}
/// Authentication model class
abstract class AuthenticationModel {
  /// Initializes
  AuthenticationModel({
    @required this.document,
    @required this.identity,
    @required this.needsVerification,
  });

  /// The authentication status for document.
  final Document document;

  /// The authentication status for identity.
  final Identity identity;

  /// An array containing the list of required authentication.
  final List<String> needsVerification;
}

/// Authentication class
class Authentication extends AuthenticationModel {
  /// Initializes
  Authentication({
    @required Document document,
    @required Identity identity,
    @required List<String> needsVerification,
  }) : super(
          document: document,
          identity: identity,
          needsVerification: needsVerification,
        );

  /// Creates an instance from JSON
  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        document: json['document'] == null
            ? null
            : Document.fromJson(json['document']),
        identity: json['identity'] == null
            ? null
            : Identity.fromJson(json['identity']),
        needsVerification:
            List<String>.from(json['needs_verification'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (document != null) {
      result['document'] = document.toJson();
    }
    if (identity != null) {
      result['identity'] = identity.toJson();
    }
    result['needs_verification'] = needsVerification;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Authentication copyWith({
    Document document,
    Identity identity,
    List<String> needsVerification,
  }) =>
      Authentication(
        document: document ?? this.document,
        identity: identity ?? this.identity,
        needsVerification: needsVerification ?? this.needsVerification,
      );
}
/// Document model class
abstract class DocumentModel {
  /// Initializes
  DocumentModel({
    @required this.expiryDate,
    @required this.status,
  });

  /// This is the epoch of the document expiry date.
  final int expiryDate;

  /// This represents the current status of the proof of address document submitted for authentication.
  final StatusEnum status;
}

/// Document class
class Document extends DocumentModel {
  /// Initializes
  Document({
    @required int expiryDate,
    @required String status,
  }) : super(
          expiryDate: expiryDate,
          status: status,
        );

  /// Creates an instance from JSON
  factory Document.fromJson(Map<String, dynamic> json) => Document(
        expiryDate: json['expiry_date'],
        status: json['status'] == null
            ? null
            : statusEnumMapper.entries
                .firstWhere((entry) => entry.value == json['status'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['expiry_date'] = expiryDate;
    result['status'] = statusEnumMapper[status];

    return result;
  }

  /// Creates a copy of instance with given parameters
  Document copyWith({
    int expiryDate,
    String status,
  }) =>
      Document(
        expiryDate: expiryDate ?? this.expiryDate,
        status: status ?? this.status,
      );
  // Creating Enum Mappers

  static final Map<StatusEnum, String> statusEnumMapper = {
    StatusEnum.none: 'none',
    StatusEnum.pending: 'pending',
    StatusEnum.rejected: 'rejected',
    StatusEnum.verified: 'verified',
    StatusEnum.expired: 'expired',
    StatusEnum.suspected: 'suspected',
  };
}

// Creating Enums

enum StatusEnum {
  none,
  pending,
  rejected,
  verified,
  expired,
  suspected,
}
/// Identity model class
abstract class IdentityModel {
  /// Initializes
  IdentityModel({
    @required this.expiryDate,
    @required this.services,
    @required this.status,
  });

  /// This is the epoch of the document expiry date.
  final int expiryDate;

  /// This shows the information about the authentication services implemented
  final Services services;

  /// This represent the current status for proof of identity document submitted for authentication.
  final StatusEnum status;
}

/// Identity class
class Identity extends IdentityModel {
  /// Initializes
  Identity({
    @required int expiryDate,
    @required Services services,
    @required String status,
  }) : super(
          expiryDate: expiryDate,
          services: services,
          status: status,
        );

  /// Creates an instance from JSON
  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        expiryDate: json['expiry_date'],
        services: json['services'] == null
            ? null
            : Services.fromJson(json['services']),
        status: json['status'] == null
            ? null
            : statusEnumMapper.entries
                .firstWhere((entry) => entry.value == json['status'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['expiry_date'] = expiryDate;
    if (services != null) {
      result['services'] = services.toJson();
    }
    result['status'] = statusEnumMapper[status];

    return result;
  }

  /// Creates a copy of instance with given parameters
  Identity copyWith({
    int expiryDate,
    Services services,
    String status,
  }) =>
      Identity(
        expiryDate: expiryDate ?? this.expiryDate,
        services: services ?? this.services,
        status: status ?? this.status,
      );
  // Creating Enum Mappers

  static final Map<StatusEnum, String> statusEnumMapper = {
    StatusEnum.none: 'none',
    StatusEnum.pending: 'pending',
    StatusEnum.rejected: 'rejected',
    StatusEnum.verified: 'verified',
    StatusEnum.expired: 'expired',
    StatusEnum.suspected: 'suspected',
  };
}

// Creating Enums

enum StatusEnum {
  none,
  pending,
  rejected,
  verified,
  expired,
  suspected,
}
/// Services model class
abstract class ServicesModel {
  /// Initializes
  ServicesModel({
    @required this.onfido,
  });

  /// This shows the information related to Onfido supported services
  final Onfido onfido;
}

/// Services class
class Services extends ServicesModel {
  /// Initializes
  Services({
    @required Onfido onfido,
  }) : super(
          onfido: onfido,
        );

  /// Creates an instance from JSON
  factory Services.fromJson(Map<String, dynamic> json) => Services(
        onfido: json['onfido'] == null ? null : Onfido.fromJson(json['onfido']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (onfido != null) {
      result['onfido'] = onfido.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Services copyWith({
    Onfido onfido,
  }) =>
      Services(
        onfido: onfido ?? this.onfido,
      );
}
/// Onfido model class
abstract class OnfidoModel {
  /// Initializes
  OnfidoModel({
    @required this.documents,
    @required this.isCountrySupported,
  });

  /// This shows the list of documents types supported by Onfido
  final List<String> documents;

  /// This shows the information if the country is supported by Onfido
  final bool isCountrySupported;
}

/// Onfido class
class Onfido extends OnfidoModel {
  /// Initializes
  Onfido({
    @required List<String> documents,
    @required bool isCountrySupported,
  }) : super(
          documents: documents,
          isCountrySupported: isCountrySupported,
        );

  /// Creates an instance from JSON
  factory Onfido.fromJson(Map<String, dynamic> json) => Onfido(
        documents: List<String>.from(json['documents'].map((x) => x)),
        isCountrySupported: getBool(json['is_country_supported']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['documents'] = documents;
    result['is_country_supported'] = isCountrySupported;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Onfido copyWith({
    List<String> documents,
    bool isCountrySupported,
  }) =>
      Onfido(
        documents: documents ?? this.documents,
        isCountrySupported: isCountrySupported ?? this.isCountrySupported,
      );
}
