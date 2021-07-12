import '../../basic_api/generated/get_account_status_receive.dart';
import '../../basic_api/generated/get_account_status_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Get account status response model class.
abstract class GetAccountStatusResponseModel {
  /// Initializes.
  GetAccountStatusResponseModel({
    this.getAccountStatus,
  });

  /// Account status details
  final GetAccountStatus? getAccountStatus;
}

/// Get account status response class.
class GetAccountStatusResponse extends GetAccountStatusResponseModel {
  /// Initializes
  GetAccountStatusResponse({
    GetAccountStatus? getAccountStatus,
  }) : super(
          getAccountStatus: getAccountStatus,
        );

  /// Creates an instance from JSON
  factory GetAccountStatusResponse.fromJson(
    dynamic getAccountStatusJson,
  ) =>
      GetAccountStatusResponse(
        getAccountStatus: getAccountStatusJson == null
            ? null
            : GetAccountStatus.fromJson(getAccountStatusJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getAccountStatus != null) {
      resultMap['get_account_status'] = getAccountStatus!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the account's status
  static Future<GetAccountStatusResponse> fetchAccountStatus() async {
    final GetAccountStatusReceive response = await _api.call(
      request: const GetAccountStatusSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AccountStatusException(baseExceptionModel: baseExceptionModel),
    );

    return GetAccountStatusResponse.fromJson(response.getAccountStatus);
  }

  /// Creates a copy of instance with given parameters.
  GetAccountStatusResponse copyWith({
    GetAccountStatus? getAccountStatus,
  }) =>
      GetAccountStatusResponse(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
      );
}

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "none": StatusEnum.none,
  "pending": StatusEnum.pending,
  "rejected": StatusEnum.rejected,
  "verified": StatusEnum.verified,
  "expired": StatusEnum.expired,
  "suspected": StatusEnum.suspected,
};

/// Status Enum.
enum StatusEnum {
  /// none.
  none,

  /// pending.
  pending,

  /// rejected.
  rejected,

  /// verified.
  verified,

  /// expired.
  expired,

  /// suspected.
  suspected,
}

/// SocialIdentityProviderEnum mapper.
final Map<String, SocialIdentityProviderEnum> socialIdentityProviderEnumMapper =
    <String, SocialIdentityProviderEnum>{
  "google": SocialIdentityProviderEnum.google,
  "facebook": SocialIdentityProviderEnum.facebook,
  "apple": SocialIdentityProviderEnum.apple,
};

/// SocialIdentityProvider Enum.
enum SocialIdentityProviderEnum {
  /// google.
  google,

  /// facebook.
  facebook,

  /// apple.
  apple,
}
/// Get account status model class.
abstract class GetAccountStatusModel {
  /// Initializes.
  GetAccountStatusModel({
    required this.status,
    required this.riskClassification,
    required this.promptClientToAuthenticate,
    required this.currencyConfig,
    this.authentication,
    this.cashierMissingFields,
    this.cashierValidation,
    this.socialIdentityProvider,
  });

  /// Account status. Possible status:
  /// - `address_verified`: client's address is verified by third party services.
  /// - `allow_document_upload`: client is allowed to upload documents.
  /// - `age_verification`: client is age-verified.
  /// - `authenticated`: client is fully authenticated.
  /// - `cashier_locked`: cashier is locked.
  /// - `closed`: client has closed the account.
  /// - `crs_tin_information`: client has updated tax related information.
  /// - `deposit_locked`: deposit is not allowed.
  /// - `disabled`: account is disabled.
  /// - `document_expired`: client's submitted proof-of-identity documents have expired.
  /// - `document_expiring_soon`: client's submitted proof-of-identity documents are expiring within a month.
  /// - `duplicate_account`: this client's account has been marked as duplicate.
  /// - `financial_assessment_not_complete`: client should complete their financial assessment.
  /// - `financial_information_not_complete`: client has not completed financial assessment.
  /// - `financial_risk_approval`: client has accepted financial risk disclosure.
  /// - `max_turnover_limit_not_set`: client has not set financial limits on their account. Applies to UK and Malta clients.
  /// - `mt5_withdrawal_locked`: MT5 deposits allowed, but withdrawal is not allowed.
  /// - `no_trading`: trading is disabled.
  /// - `no_withdrawal_or_trading`: client cannot trade or withdraw but can deposit.
  /// - `pa_withdrawal_explicitly_allowed`: withdrawal through payment agent is allowed.
  /// - `password_reset_required`: this client must reset their password.
  /// - `professional`: this client has opted for a professional account.
  /// - `professional_requested`: this client has requested for a professional account.
  /// - `professional_rejected`: this client's request for a professional account has been rejected.
  /// - `proveid_pending`: this client's identity is being validated. Applies for MX account with GB residence only.
  /// - `proveid_requested`: this client has made a request to have their identity be validated.
  /// - `social_signup`: this client is using social signup.
  /// - `trading_experience_not_complete`: client has not completed the trading experience questionnaire.
  /// - `ukgc_funds_protection`: client has acknowledged UKGC funds protection notice.
  /// - `unwelcome`: client cannot deposit or buy contracts, but can withdraw or sell contracts.
  /// - `withdrawal_locked`: deposits allowed but withdrawals are not allowed.
  final List<String> status;

  /// Client risk classification: `low`, `standard`, `high`.
  final String riskClassification;

  /// Indicates whether the client should be prompted to authenticate their account.
  final int promptClientToAuthenticate;

  /// Provides cashier details for client currency.
  final Map<String, CurrencyConfigProperty> currencyConfig;

  /// This represents the authentication status of the user and it includes what authentication is needed.
  final Authentication? authentication;

  /// Contains missing profile fields required for cashier access.
  final List<String>? cashierMissingFields;

  /// If the cashier is unavailble, this array contains one or more error codes for each reason.
  final List<String>? cashierValidation;

  /// Social identity provider a user signed up with.
  final SocialIdentityProviderEnum? socialIdentityProvider;
}

/// Get account status class.
class GetAccountStatus extends GetAccountStatusModel {
  /// Initializes
  GetAccountStatus({
    required Map<String, CurrencyConfigProperty> currencyConfig,
    required int promptClientToAuthenticate,
    required String riskClassification,
    required List<String> status,
    Authentication? authentication,
    List<String>? cashierMissingFields,
    List<String>? cashierValidation,
    SocialIdentityProviderEnum? socialIdentityProvider,
  }) : super(
          currencyConfig: currencyConfig,
          promptClientToAuthenticate: promptClientToAuthenticate,
          riskClassification: riskClassification,
          status: status,
          authentication: authentication,
          cashierMissingFields: cashierMissingFields,
          cashierValidation: cashierValidation,
          socialIdentityProvider: socialIdentityProvider,
        );

  /// Creates an instance from JSON
  factory GetAccountStatus.fromJson(Map<String, dynamic> json) =>
      GetAccountStatus(
        currencyConfig: Map<String, CurrencyConfigProperty>.fromEntries(
            json['currency_config']
                .entries
                .map<MapEntry<String, CurrencyConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CurrencyConfigProperty>(entry.key,
                            CurrencyConfigProperty.fromJson(entry.value)))),
        promptClientToAuthenticate: json['prompt_client_to_authenticate'],
        riskClassification: json['risk_classification'],
        status: List<String>.from(
          json['status'].map(
            (dynamic item) => item,
          ),
        ),
        authentication: json['authentication'] == null
            ? null
            : Authentication.fromJson(json['authentication']),
        cashierMissingFields: json['cashier_missing_fields'] == null
            ? null
            : List<String>.from(
                json['cashier_missing_fields']?.map(
                  (dynamic item) => item,
                ),
              ),
        cashierValidation: json['cashier_validation'] == null
            ? null
            : List<String>.from(
                json['cashier_validation']?.map(
                  (dynamic item) => item,
                ),
              ),
        socialIdentityProvider: json['social_identity_provider'] == null
            ? null
            : socialIdentityProviderEnumMapper[
                json['social_identity_provider']]!,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currency_config'] = currencyConfig;
    resultMap['prompt_client_to_authenticate'] = promptClientToAuthenticate;
    resultMap['risk_classification'] = riskClassification;
    resultMap['status'] = status
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    if (authentication != null) {
      resultMap['authentication'] = authentication!.toJson();
    }
    if (cashierMissingFields != null) {
      resultMap['cashier_missing_fields'] = cashierMissingFields!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (cashierValidation != null) {
      resultMap['cashier_validation'] = cashierValidation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['social_identity_provider'] = socialIdentityProviderEnumMapper
        .entries
        .firstWhere((MapEntry<String, SocialIdentityProviderEnum> entry) =>
            entry.value == socialIdentityProvider)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetAccountStatus copyWith({
    required Map<String, CurrencyConfigProperty> currencyConfig,
    required int promptClientToAuthenticate,
    required String riskClassification,
    required List<String> status,
    Authentication? authentication,
    List<String>? cashierMissingFields,
    List<String>? cashierValidation,
    SocialIdentityProviderEnum? socialIdentityProvider,
  }) =>
      GetAccountStatus(
        currencyConfig: currencyConfig,
        promptClientToAuthenticate: promptClientToAuthenticate,
        riskClassification: riskClassification,
        status: status,
        authentication: authentication ?? this.authentication,
        cashierMissingFields: cashierMissingFields ?? this.cashierMissingFields,
        cashierValidation: cashierValidation ?? this.cashierValidation,
        socialIdentityProvider:
            socialIdentityProvider ?? this.socialIdentityProvider,
      );
}
/// Currency config property model class.
abstract class CurrencyConfigPropertyModel {
  /// Initializes.
  CurrencyConfigPropertyModel({
    this.isDepositSuspended,
    this.isWithdrawalSuspended,
  });

  /// Deposit is allowed for currency or not
  final bool? isDepositSuspended;

  /// Withdrawal is allowed for currency or not
  final bool? isWithdrawalSuspended;
}

/// Currency config property class.
class CurrencyConfigProperty extends CurrencyConfigPropertyModel {
  /// Initializes
  CurrencyConfigProperty({
    bool? isDepositSuspended,
    bool? isWithdrawalSuspended,
  }) : super(
          isDepositSuspended: isDepositSuspended,
          isWithdrawalSuspended: isWithdrawalSuspended,
        );

  /// Creates an instance from JSON
  factory CurrencyConfigProperty.fromJson(Map<String, dynamic> json) =>
      CurrencyConfigProperty(
        isDepositSuspended: getBool(json['is_deposit_suspended']),
        isWithdrawalSuspended: getBool(json['is_withdrawal_suspended']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['is_deposit_suspended'] = isDepositSuspended;
    resultMap['is_withdrawal_suspended'] = isWithdrawalSuspended;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrencyConfigProperty copyWith({
    bool? isDepositSuspended,
    bool? isWithdrawalSuspended,
  }) =>
      CurrencyConfigProperty(
        isDepositSuspended: isDepositSuspended ?? this.isDepositSuspended,
        isWithdrawalSuspended:
            isWithdrawalSuspended ?? this.isWithdrawalSuspended,
      );
}
/// Authentication model class.
abstract class AuthenticationModel {
  /// Initializes.
  AuthenticationModel({
    required this.needsVerification,
    this.document,
    this.identity,
  });

  /// An array containing the list of required authentication.
  final List<String> needsVerification;

  /// The authentication status for document.
  final Document? document;

  /// The authentication status for identity.
  final Identity? identity;
}

/// Authentication class.
class Authentication extends AuthenticationModel {
  /// Initializes
  Authentication({
    required List<String> needsVerification,
    Document? document,
    Identity? identity,
  }) : super(
          needsVerification: needsVerification,
          document: document,
          identity: identity,
        );

  /// Creates an instance from JSON
  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        needsVerification: List<String>.from(
          json['needs_verification'].map(
            (dynamic item) => item,
          ),
        ),
        document: json['document'] == null
            ? null
            : Document.fromJson(json['document']),
        identity: json['identity'] == null
            ? null
            : Identity.fromJson(json['identity']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['needs_verification'] = needsVerification
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    if (document != null) {
      resultMap['document'] = document!.toJson();
    }
    if (identity != null) {
      resultMap['identity'] = identity!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Authentication copyWith({
    required List<String> needsVerification,
    Document? document,
    Identity? identity,
  }) =>
      Authentication(
        needsVerification: needsVerification,
        document: document ?? this.document,
        identity: identity ?? this.identity,
      );
}
/// Document model class.
abstract class DocumentModel {
  /// Initializes.
  DocumentModel({
    this.expiryDate,
    this.status,
  });

  /// This is the epoch of the document expiry date.
  final DateTime? expiryDate;

  /// This represents the current status of the proof of address document submitted for authentication.
  final StatusEnum? status;
}

/// Document class.
class Document extends DocumentModel {
  /// Initializes
  Document({
    DateTime? expiryDate,
    StatusEnum? status,
  }) : super(
          expiryDate: expiryDate,
          status: status,
        );

  /// Creates an instance from JSON
  factory Document.fromJson(Map<String, dynamic> json) => Document(
        expiryDate: getDateTime(json['expiry_date']),
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']]!,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['expiry_date'] = getSecondsSinceEpochDateTime(expiryDate);
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Document copyWith({
    DateTime? expiryDate,
    StatusEnum? status,
  }) =>
      Document(
        expiryDate: expiryDate ?? this.expiryDate,
        status: status ?? this.status,
      );
}
/// Identity model class.
abstract class IdentityModel {
  /// Initializes.
  IdentityModel({
    this.expiryDate,
    this.services,
    this.status,
  });

  /// This is the epoch of the document expiry date.
  final DateTime? expiryDate;

  /// This shows the information about the authentication services implemented
  final Services? services;

  /// This represent the current status for proof of identity document submitted for authentication.
  final StatusEnum? status;
}

/// Identity class.
class Identity extends IdentityModel {
  /// Initializes
  Identity({
    DateTime? expiryDate,
    Services? services,
    StatusEnum? status,
  }) : super(
          expiryDate: expiryDate,
          services: services,
          status: status,
        );

  /// Creates an instance from JSON
  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        expiryDate: getDateTime(json['expiry_date']),
        services: json['services'] == null
            ? null
            : Services.fromJson(json['services']),
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']]!,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['expiry_date'] = getSecondsSinceEpochDateTime(expiryDate);
    if (services != null) {
      resultMap['services'] = services!.toJson();
    }
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Identity copyWith({
    DateTime? expiryDate,
    Services? services,
    StatusEnum? status,
  }) =>
      Identity(
        expiryDate: expiryDate ?? this.expiryDate,
        services: services ?? this.services,
        status: status ?? this.status,
      );
}
/// Services model class.
abstract class ServicesModel {
  /// Initializes.
  ServicesModel({
    this.idv,
    this.manual,
    this.onfido,
  });

  /// This shows the information related to IDV supported services
  final Idv? idv;

  /// This shows the information related to the manual POI checks
  final Manual? manual;

  /// This shows the information related to Onfido supported services
  final Onfido? onfido;
}

/// Services class.
class Services extends ServicesModel {
  /// Initializes
  Services({
    Idv? idv,
    Manual? manual,
    Onfido? onfido,
  }) : super(
          idv: idv,
          manual: manual,
          onfido: onfido,
        );

  /// Creates an instance from JSON
  factory Services.fromJson(Map<String, dynamic> json) => Services(
        idv: json['idv'] == null ? null : Idv.fromJson(json['idv']),
        manual: json['manual'] == null ? null : Manual.fromJson(json['manual']),
        onfido: json['onfido'] == null ? null : Onfido.fromJson(json['onfido']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (idv != null) {
      resultMap['idv'] = idv!.toJson();
    }
    if (manual != null) {
      resultMap['manual'] = manual!.toJson();
    }
    if (onfido != null) {
      resultMap['onfido'] = onfido!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Services copyWith({
    Idv? idv,
    Manual? manual,
    Onfido? onfido,
  }) =>
      Services(
        idv: idv ?? this.idv,
        manual: manual ?? this.manual,
        onfido: onfido ?? this.onfido,
      );
}
/// Idv model class.
abstract class IdvModel {
  /// Initializes.
  IdvModel({
    this.lastRejected,
    this.reportedProperties,
    this.status,
    this.submissionsLeft,
  });

  /// Show the last IDV reported reasons for the rejected cases
  final List<String>? lastRejected;

  /// Shows the latest document properties detected and reported by IDVS
  final Map<String, dynamic>? reportedProperties;

  /// This represents the status of the latest IDV check.
  final StatusEnum? status;

  /// This shows the number of IDV submissions left for the client
  final int? submissionsLeft;
}

/// Idv class.
class Idv extends IdvModel {
  /// Initializes
  Idv({
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    StatusEnum? status,
    int? submissionsLeft,
  }) : super(
          lastRejected: lastRejected,
          reportedProperties: reportedProperties,
          status: status,
          submissionsLeft: submissionsLeft,
        );

  /// Creates an instance from JSON
  factory Idv.fromJson(Map<String, dynamic> json) => Idv(
        lastRejected: json['last_rejected'] == null
            ? null
            : List<String>.from(
                json['last_rejected']?.map(
                  (dynamic item) => item,
                ),
              ),
        reportedProperties: json['reported_properties'],
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']]!,
        submissionsLeft: json['submissions_left'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (lastRejected != null) {
      resultMap['last_rejected'] = lastRejected!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['reported_properties'] = reportedProperties;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;
    resultMap['submissions_left'] = submissionsLeft;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Idv copyWith({
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    StatusEnum? status,
    int? submissionsLeft,
  }) =>
      Idv(
        lastRejected: lastRejected ?? this.lastRejected,
        reportedProperties: reportedProperties ?? this.reportedProperties,
        status: status ?? this.status,
        submissionsLeft: submissionsLeft ?? this.submissionsLeft,
      );
}
/// Manual model class.
abstract class ManualModel {
  /// Initializes.
  ManualModel({
    this.status,
  });

  /// This represents the status of the current manual POI check.
  final StatusEnum? status;
}

/// Manual class.
class Manual extends ManualModel {
  /// Initializes
  Manual({
    StatusEnum? status,
  }) : super(
          status: status,
        );

  /// Creates an instance from JSON
  factory Manual.fromJson(Map<String, dynamic> json) => Manual(
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']]!,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Manual copyWith({
    StatusEnum? status,
  }) =>
      Manual(
        status: status ?? this.status,
      );
}
/// Onfido model class.
abstract class OnfidoModel {
  /// Initializes.
  OnfidoModel({
    this.countryCode,
    this.documents,
    this.isCountrySupported,
    this.lastRejected,
    this.reportedProperties,
    this.status,
    this.submissionsLeft,
  });

  /// 3 letter country code for Onfide SDK
  final String? countryCode;

  /// This shows the list of documents types supported by Onfido
  final List<String>? documents;

  /// This shows the information if the country is supported by Onfido
  final int? isCountrySupported;

  /// Show the last Onfido reported reasons for the rejected cases
  final List<String>? lastRejected;

  /// Shows the latest document properties detected and reported by Onfido
  final Map<String, dynamic>? reportedProperties;

  /// This represents the status of the latest Onfido check.
  final StatusEnum? status;

  /// This shows the number of Onfido submissions left for the client
  final int? submissionsLeft;
}

/// Onfido class.
class Onfido extends OnfidoModel {
  /// Initializes
  Onfido({
    String? countryCode,
    List<String>? documents,
    int? isCountrySupported,
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    StatusEnum? status,
    int? submissionsLeft,
  }) : super(
          countryCode: countryCode,
          documents: documents,
          isCountrySupported: isCountrySupported,
          lastRejected: lastRejected,
          reportedProperties: reportedProperties,
          status: status,
          submissionsLeft: submissionsLeft,
        );

  /// Creates an instance from JSON
  factory Onfido.fromJson(Map<String, dynamic> json) => Onfido(
        countryCode: json['country_code'],
        documents: json['documents'] == null
            ? null
            : List<String>.from(
                json['documents']?.map(
                  (dynamic item) => item,
                ),
              ),
        isCountrySupported: json['is_country_supported'],
        lastRejected: json['last_rejected'] == null
            ? null
            : List<String>.from(
                json['last_rejected']?.map(
                  (dynamic item) => item,
                ),
              ),
        reportedProperties: json['reported_properties'],
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']]!,
        submissionsLeft: json['submissions_left'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country_code'] = countryCode;
    if (documents != null) {
      resultMap['documents'] = documents!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['is_country_supported'] = isCountrySupported;
    if (lastRejected != null) {
      resultMap['last_rejected'] = lastRejected!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['reported_properties'] = reportedProperties;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;
    resultMap['submissions_left'] = submissionsLeft;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Onfido copyWith({
    String? countryCode,
    List<String>? documents,
    int? isCountrySupported,
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    StatusEnum? status,
    int? submissionsLeft,
  }) =>
      Onfido(
        countryCode: countryCode ?? this.countryCode,
        documents: documents ?? this.documents,
        isCountrySupported: isCountrySupported ?? this.isCountrySupported,
        lastRejected: lastRejected ?? this.lastRejected,
        reportedProperties: reportedProperties ?? this.reportedProperties,
        status: status ?? this.status,
        submissionsLeft: submissionsLeft ?? this.submissionsLeft,
      );
}
