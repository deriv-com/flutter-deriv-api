// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_account_status_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_account_status_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Get account status response model class.
abstract class GetAccountStatusResponseModel {
  /// Initializes Get account status response model class .
  const GetAccountStatusResponseModel({
    this.getAccountStatus,
  });

  /// Account status details
  final GetAccountStatus? getAccountStatus;
}

/// Get account status response class.
class GetAccountStatusResponse extends GetAccountStatusResponseModel {
  /// Initializes Get account status response class.
  const GetAccountStatusResponse({
    GetAccountStatus? getAccountStatus,
  }) : super(
          getAccountStatus: getAccountStatus,
        );

  /// Creates an instance from JSON.
  factory GetAccountStatusResponse.fromJson(
    dynamic getAccountStatusJson,
  ) =>
      GetAccountStatusResponse(
        getAccountStatus: getAccountStatusJson == null
            ? null
            : GetAccountStatus.fromJson(getAccountStatusJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getAccountStatus != null) {
      resultMap['get_account_status'] = getAccountStatus!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the account's status.
  ///
  /// For parameters information refer to [GetAccountStatusRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<GetAccountStatusReceive> fetchAccountStatusRaw() async {
    final GetAccountStatusReceive response = await _api.call(
      request: const GetAccountStatusRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Gets the account's status.
  ///
  /// For parameters information refer to [GetAccountStatusRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<GetAccountStatusResponse> fetchAccountStatus() async {
    final GetAccountStatusReceive response = await fetchAccountStatusRaw();

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
  "verified": StatusEnum.verified,
  "rejected": StatusEnum.rejected,
  "pending": StatusEnum.pending,
};

/// Status Enum.
enum StatusEnum {
  /// verified.
  verified,

  /// rejected.
  rejected,

  /// pending.
  pending,
}

/// DocumentStatusEnum mapper.
final Map<String, DocumentStatusEnum> documentStatusEnumMapper =
    <String, DocumentStatusEnum>{
  "none": DocumentStatusEnum.none,
  "pending": DocumentStatusEnum.pending,
  "rejected": DocumentStatusEnum.rejected,
  "verified": DocumentStatusEnum.verified,
  "expired": DocumentStatusEnum.expired,
  "suspected": DocumentStatusEnum.suspected,
};

/// Status Enum.
enum DocumentStatusEnum {
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

/// IdvStatusEnum mapper.
final Map<String, IdvStatusEnum> idvStatusEnumMapper = <String, IdvStatusEnum>{
  "none": IdvStatusEnum.none,
  "pending": IdvStatusEnum.pending,
  "rejected": IdvStatusEnum.rejected,
  "verified": IdvStatusEnum.verified,
  "expired": IdvStatusEnum.expired,
};

/// Status Enum.
enum IdvStatusEnum {
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
}

/// IncomeStatusEnum mapper.
final Map<String, IncomeStatusEnum> incomeStatusEnumMapper =
    <String, IncomeStatusEnum>{
  "none": IncomeStatusEnum.none,
  "pending": IncomeStatusEnum.pending,
  "rejected": IncomeStatusEnum.rejected,
  "verified": IncomeStatusEnum.verified,
  "locked": IncomeStatusEnum.locked,
};

/// Status Enum.
enum IncomeStatusEnum {
  /// none.
  none,

  /// pending.
  pending,

  /// rejected.
  rejected,

  /// verified.
  verified,

  /// locked.
  locked,
}

/// OwnershipStatusEnum mapper.
final Map<String, OwnershipStatusEnum> ownershipStatusEnumMapper =
    <String, OwnershipStatusEnum>{
  "none": OwnershipStatusEnum.none,
  "pending": OwnershipStatusEnum.pending,
  "rejected": OwnershipStatusEnum.rejected,
  "verified": OwnershipStatusEnum.verified,
};

/// Status Enum.
enum OwnershipStatusEnum {
  /// none.
  none,

  /// pending.
  pending,

  /// rejected.
  rejected,

  /// verified.
  verified,
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
  /// Initializes Get account status model class .
  const GetAccountStatusModel({
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
  /// - `crs_tin_information`: client has updated tax related information.
  /// - `deposit_locked`: deposit is not allowed.
  /// - `disabled`: account is disabled.
  /// - `document_expired`: client's submitted proof-of-identity documents have expired.
  /// - `document_expiring_soon`: client's submitted proof-of-identity documents are expiring within a month.
  /// - `dxtrade_password_not_set`: Deriv X password is not set.
  /// - `financial_assessment_not_complete`: client should complete their financial assessment.
  /// - `financial_information_not_complete`: client has not completed financial assessment.
  /// - `financial_risk_approval`: client has accepted financial risk disclosure.
  /// - `max_turnover_limit_not_set`: client has not set financial limits on their account. Applies to UK and Malta clients.
  /// - `mt5_password_not_set`: MT5 password is not set.
  /// - `mt5_withdrawal_locked`: MT5 deposits allowed, but withdrawal is not allowed.
  /// - `needs_affiliate_coc_approval`: user must approve the Affiliate's Code of Conduct Agreement.
  /// - `no_trading`: trading is disabled.
  /// - `no_withdrawal_or_trading`: client cannot trade or withdraw but can deposit.
  /// - `p2p_blocked_for_pa`: p2p is blocked for the current payment agent client.
  /// - `pa_withdrawal_explicitly_allowed`: withdrawal through payment agent is allowed.
  /// - `password_reset_required`: this client must reset their password.
  /// - `professional`: this client has opted for a professional account.
  /// - `professional_requested`: this client has requested for a professional account.
  /// - `professional_rejected`: this client's request for a professional account has been rejected.
  /// - `social_signup`: this client is using social signup.
  /// - `trading_experience_not_complete`: client has not completed the trading experience questionnaire.
  /// - `ukgc_funds_protection`: client has acknowledged UKGC funds protection notice.
  /// - `unwelcome`: client cannot deposit or buy contracts, but can withdraw or sell contracts.
  /// - `withdrawal_locked`: deposits allowed but withdrawals are not allowed.
  /// - `deposit_attempt`: this prevent a client from changing the account currency after deposit attempt.
  /// - `poi_name_mismatch`: client POI documents name mismatch.
  /// - `allow_poa_resubmission`: the client can resubmit POA documents.
  /// - `allow_poi_resubmission`: the client can resubmit POI documents.
  /// - `shared_payment_method`: the client has been sharing payment methods.
  /// - `personal_details_locked`: client is not allowed to edit personal profile details.
  /// - `transfers_blocked`: it block any transfer between two accounts.
  /// - `df_deposit_requires_poi`: the DF deposit will be blocked until the client gets age verified.
  final List<String> status;

  /// Client risk classification: `low`, `standard`, `high`.
  final String riskClassification;

  /// Indicates whether the client should be prompted to authenticate their account.
  final bool promptClientToAuthenticate;

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
  /// Initializes Get account status class.
  const GetAccountStatus({
    required Map<String, CurrencyConfigProperty> currencyConfig,
    required bool promptClientToAuthenticate,
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

  /// Creates an instance from JSON.
  factory GetAccountStatus.fromJson(Map<String, dynamic> json) =>
      GetAccountStatus(
        currencyConfig: Map<String, CurrencyConfigProperty>.fromEntries(
            json['currency_config']
                .entries
                .map<MapEntry<String, CurrencyConfigProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, CurrencyConfigProperty>(entry.key,
                            CurrencyConfigProperty.fromJson(entry.value)))),
        promptClientToAuthenticate:
            getBool(json['prompt_client_to_authenticate'])!,
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
                json['social_identity_provider']],
      );

  /// Converts an instance to JSON.
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
    Map<String, CurrencyConfigProperty>? currencyConfig,
    bool? promptClientToAuthenticate,
    String? riskClassification,
    List<String>? status,
    Authentication? authentication,
    List<String>? cashierMissingFields,
    List<String>? cashierValidation,
    SocialIdentityProviderEnum? socialIdentityProvider,
  }) =>
      GetAccountStatus(
        currencyConfig: currencyConfig ?? this.currencyConfig,
        promptClientToAuthenticate:
            promptClientToAuthenticate ?? this.promptClientToAuthenticate,
        riskClassification: riskClassification ?? this.riskClassification,
        status: status ?? this.status,
        authentication: authentication ?? this.authentication,
        cashierMissingFields: cashierMissingFields ?? this.cashierMissingFields,
        cashierValidation: cashierValidation ?? this.cashierValidation,
        socialIdentityProvider:
            socialIdentityProvider ?? this.socialIdentityProvider,
      );
}

/// Currency config property model class.
abstract class CurrencyConfigPropertyModel {
  /// Initializes Currency config property model class .
  const CurrencyConfigPropertyModel({
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
  /// Initializes Currency config property class.
  const CurrencyConfigProperty({
    bool? isDepositSuspended,
    bool? isWithdrawalSuspended,
  }) : super(
          isDepositSuspended: isDepositSuspended,
          isWithdrawalSuspended: isWithdrawalSuspended,
        );

  /// Creates an instance from JSON.
  factory CurrencyConfigProperty.fromJson(Map<String, dynamic> json) =>
      CurrencyConfigProperty(
        isDepositSuspended: getBool(json['is_deposit_suspended']),
        isWithdrawalSuspended: getBool(json['is_withdrawal_suspended']),
      );

  /// Converts an instance to JSON.
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
  /// Initializes Authentication model class .
  const AuthenticationModel({
    required this.needsVerification,
    this.attempts,
    this.document,
    this.identity,
    this.income,
    this.ownership,
  });

  /// An array containing the list of required authentication.
  final List<String> needsVerification;

  /// POI attempts made by the client
  final Attempts? attempts;

  /// The authentication status for document.
  final Document? document;

  /// The authentication status for identity.
  final Identity? identity;

  /// The authentication status for source of income document.
  final Income? income;

  /// The current state of the proof of ownership.
  final Ownership? ownership;
}

/// Authentication class.
class Authentication extends AuthenticationModel {
  /// Initializes Authentication class.
  const Authentication({
    required List<String> needsVerification,
    Attempts? attempts,
    Document? document,
    Identity? identity,
    Income? income,
    Ownership? ownership,
  }) : super(
          needsVerification: needsVerification,
          attempts: attempts,
          document: document,
          identity: identity,
          income: income,
          ownership: ownership,
        );

  /// Creates an instance from JSON.
  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
        needsVerification: List<String>.from(
          json['needs_verification'].map(
            (dynamic item) => item,
          ),
        ),
        attempts: json['attempts'] == null
            ? null
            : Attempts.fromJson(json['attempts']),
        document: json['document'] == null
            ? null
            : Document.fromJson(json['document']),
        identity: json['identity'] == null
            ? null
            : Identity.fromJson(json['identity']),
        income: json['income'] == null ? null : Income.fromJson(json['income']),
        ownership: json['ownership'] == null
            ? null
            : Ownership.fromJson(json['ownership']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['needs_verification'] = needsVerification
        .map<dynamic>(
          (String item) => item,
        )
        .toList();

    if (attempts != null) {
      resultMap['attempts'] = attempts!.toJson();
    }
    if (document != null) {
      resultMap['document'] = document!.toJson();
    }
    if (identity != null) {
      resultMap['identity'] = identity!.toJson();
    }
    if (income != null) {
      resultMap['income'] = income!.toJson();
    }
    if (ownership != null) {
      resultMap['ownership'] = ownership!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Authentication copyWith({
    List<String>? needsVerification,
    Attempts? attempts,
    Document? document,
    Identity? identity,
    Income? income,
    Ownership? ownership,
  }) =>
      Authentication(
        needsVerification: needsVerification ?? this.needsVerification,
        attempts: attempts ?? this.attempts,
        document: document ?? this.document,
        identity: identity ?? this.identity,
        income: income ?? this.income,
        ownership: ownership ?? this.ownership,
      );
}

/// Attempts model class.
abstract class AttemptsModel {
  /// Initializes Attempts model class .
  const AttemptsModel({
    this.count,
    this.history,
    this.latest,
  });

  /// A number of POI attempts made by the client
  final int? count;

  /// A list of POI attempts made by the client in chronological descending order
  final List<HistoryItem>? history;

  /// The latest POI attempt made by the client
  final Map<String, dynamic>? latest;
}

/// Attempts class.
class Attempts extends AttemptsModel {
  /// Initializes Attempts class.
  const Attempts({
    int? count,
    List<HistoryItem>? history,
    Map<String, dynamic>? latest,
  }) : super(
          count: count,
          history: history,
          latest: latest,
        );

  /// Creates an instance from JSON.
  factory Attempts.fromJson(Map<String, dynamic> json) => Attempts(
        count: json['count'],
        history: json['history'] == null
            ? null
            : List<HistoryItem>.from(
                json['history']?.map(
                  (dynamic item) => HistoryItem.fromJson(item),
                ),
              ),
        latest: json['latest'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['count'] = count;
    if (history != null) {
      resultMap['history'] = history!
          .map<dynamic>(
            (HistoryItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['latest'] = latest;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Attempts copyWith({
    int? count,
    List<HistoryItem>? history,
    Map<String, dynamic>? latest,
  }) =>
      Attempts(
        count: count ?? this.count,
        history: history ?? this.history,
        latest: latest ?? this.latest,
      );
}

/// History item model class.
abstract class HistoryItemModel {
  /// Initializes History item model class .
  const HistoryItemModel({
    this.countryCode,
    this.id,
    this.service,
    this.status,
    this.timestamp,
  });

  /// 2-letter country code used to request the attempt.
  final String? countryCode;

  /// The id of the attempt.
  final String? id;

  /// The service used to make the verification.
  final String? service;

  /// Status of the attempt.
  final StatusEnum? status;

  /// The epoch of the attempt.
  final DateTime? timestamp;
}

/// History item class.
class HistoryItem extends HistoryItemModel {
  /// Initializes History item class.
  const HistoryItem({
    String? countryCode,
    String? id,
    String? service,
    StatusEnum? status,
    DateTime? timestamp,
  }) : super(
          countryCode: countryCode,
          id: id,
          service: service,
          status: status,
          timestamp: timestamp,
        );

  /// Creates an instance from JSON.
  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
        countryCode: json['country_code'],
        id: json['id'],
        service: json['service'],
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']],
        timestamp: getDateTime(json['timestamp']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country_code'] = countryCode;
    resultMap['id'] = id;
    resultMap['service'] = service;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;
    resultMap['timestamp'] = getSecondsSinceEpochDateTime(timestamp);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  HistoryItem copyWith({
    String? countryCode,
    String? id,
    String? service,
    StatusEnum? status,
    DateTime? timestamp,
  }) =>
      HistoryItem(
        countryCode: countryCode ?? this.countryCode,
        id: id ?? this.id,
        service: service ?? this.service,
        status: status ?? this.status,
        timestamp: timestamp ?? this.timestamp,
      );
}

/// Document model class.
abstract class DocumentModel {
  /// Initializes Document model class .
  const DocumentModel({
    this.expiryDate,
    this.status,
  });

  /// This is the epoch of the document expiry date.
  final DateTime? expiryDate;

  /// This represents the current status of the proof of address document submitted for authentication.
  final DocumentStatusEnum? status;
}

/// Document class.
class Document extends DocumentModel {
  /// Initializes Document class.
  const Document({
    DateTime? expiryDate,
    DocumentStatusEnum? status,
  }) : super(
          expiryDate: expiryDate,
          status: status,
        );

  /// Creates an instance from JSON.
  factory Document.fromJson(Map<String, dynamic> json) => Document(
        expiryDate: getDateTime(json['expiry_date']),
        status: json['status'] == null
            ? null
            : documentStatusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['expiry_date'] = getSecondsSinceEpochDateTime(expiryDate);
    resultMap['status'] = documentStatusEnumMapper.entries
        .firstWhere((MapEntry<String, DocumentStatusEnum> entry) =>
            entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Document copyWith({
    DateTime? expiryDate,
    DocumentStatusEnum? status,
  }) =>
      Document(
        expiryDate: expiryDate ?? this.expiryDate,
        status: status ?? this.status,
      );
}

/// Identity model class.
abstract class IdentityModel {
  /// Initializes Identity model class .
  const IdentityModel({
    this.expiryDate,
    this.services,
    this.status,
  });

  /// This is the epoch of the document expiry date.
  final DateTime? expiryDate;

  /// This shows the information about the authentication services implemented
  final Services? services;

  /// This represent the current status for proof of identity document submitted for authentication.
  final DocumentStatusEnum? status;
}

/// Identity class.
class Identity extends IdentityModel {
  /// Initializes Identity class.
  const Identity({
    DateTime? expiryDate,
    Services? services,
    DocumentStatusEnum? status,
  }) : super(
          expiryDate: expiryDate,
          services: services,
          status: status,
        );

  /// Creates an instance from JSON.
  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        expiryDate: getDateTime(json['expiry_date']),
        services: json['services'] == null
            ? null
            : Services.fromJson(json['services']),
        status: json['status'] == null
            ? null
            : documentStatusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['expiry_date'] = getSecondsSinceEpochDateTime(expiryDate);
    if (services != null) {
      resultMap['services'] = services!.toJson();
    }
    resultMap['status'] = documentStatusEnumMapper.entries
        .firstWhere((MapEntry<String, DocumentStatusEnum> entry) =>
            entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Identity copyWith({
    DateTime? expiryDate,
    Services? services,
    DocumentStatusEnum? status,
  }) =>
      Identity(
        expiryDate: expiryDate ?? this.expiryDate,
        services: services ?? this.services,
        status: status ?? this.status,
      );
}

/// Services model class.
abstract class ServicesModel {
  /// Initializes Services model class .
  const ServicesModel({
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
  /// Initializes Services class.
  const Services({
    Idv? idv,
    Manual? manual,
    Onfido? onfido,
  }) : super(
          idv: idv,
          manual: manual,
          onfido: onfido,
        );

  /// Creates an instance from JSON.
  factory Services.fromJson(Map<String, dynamic> json) => Services(
        idv: json['idv'] == null ? null : Idv.fromJson(json['idv']),
        manual: json['manual'] == null ? null : Manual.fromJson(json['manual']),
        onfido: json['onfido'] == null ? null : Onfido.fromJson(json['onfido']),
      );

  /// Converts an instance to JSON.
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
  /// Initializes Idv model class .
  const IdvModel({
    this.expiryDate,
    this.lastRejected,
    this.reportedProperties,
    this.status,
    this.submissionsLeft,
  });

  /// This is the epoch of the document expiry date.
  final DateTime? expiryDate;

  /// Show the last IDV reported reasons for the rejected cases
  final List<String>? lastRejected;

  /// Shows the latest document properties detected and reported by IDVS
  final Map<String, dynamic>? reportedProperties;

  /// This represents the status of the latest IDV check.
  final IdvStatusEnum? status;

  /// This shows the number of IDV submissions left for the client
  final int? submissionsLeft;
}

/// Idv class.
class Idv extends IdvModel {
  /// Initializes Idv class.
  const Idv({
    DateTime? expiryDate,
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    IdvStatusEnum? status,
    int? submissionsLeft,
  }) : super(
          expiryDate: expiryDate,
          lastRejected: lastRejected,
          reportedProperties: reportedProperties,
          status: status,
          submissionsLeft: submissionsLeft,
        );

  /// Creates an instance from JSON.
  factory Idv.fromJson(Map<String, dynamic> json) => Idv(
        expiryDate: getDateTime(json['expiry_date']),
        lastRejected: json['last_rejected'] == null
            ? null
            : List<String>.from(
                json['last_rejected']?.map(
                  (dynamic item) => item,
                ),
              ),
        reportedProperties: json['reported_properties'],
        status:
            json['status'] == null ? null : idvStatusEnumMapper[json['status']],
        submissionsLeft: json['submissions_left'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['expiry_date'] = getSecondsSinceEpochDateTime(expiryDate);
    if (lastRejected != null) {
      resultMap['last_rejected'] = lastRejected!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['reported_properties'] = reportedProperties;
    resultMap['status'] = idvStatusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, IdvStatusEnum> entry) => entry.value == status)
        .key;
    resultMap['submissions_left'] = submissionsLeft;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Idv copyWith({
    DateTime? expiryDate,
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    IdvStatusEnum? status,
    int? submissionsLeft,
  }) =>
      Idv(
        expiryDate: expiryDate ?? this.expiryDate,
        lastRejected: lastRejected ?? this.lastRejected,
        reportedProperties: reportedProperties ?? this.reportedProperties,
        status: status ?? this.status,
        submissionsLeft: submissionsLeft ?? this.submissionsLeft,
      );
}

/// Manual model class.
abstract class ManualModel {
  /// Initializes Manual model class .
  const ManualModel({
    this.status,
  });

  /// This represents the status of the current manual POI check.
  final DocumentStatusEnum? status;
}

/// Manual class.
class Manual extends ManualModel {
  /// Initializes Manual class.
  const Manual({
    DocumentStatusEnum? status,
  }) : super(
          status: status,
        );

  /// Creates an instance from JSON.
  factory Manual.fromJson(Map<String, dynamic> json) => Manual(
        status: json['status'] == null
            ? null
            : documentStatusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['status'] = documentStatusEnumMapper.entries
        .firstWhere((MapEntry<String, DocumentStatusEnum> entry) =>
            entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Manual copyWith({
    DocumentStatusEnum? status,
  }) =>
      Manual(
        status: status ?? this.status,
      );
}

/// Onfido model class.
abstract class OnfidoModel {
  /// Initializes Onfido model class .
  const OnfidoModel({
    this.countryCode,
    this.documents,
    this.documentsSupported,
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

  /// This shows the list of documents types supported.
  final List<String>? documentsSupported;

  /// This shows the information if the country is supported by Onfido
  final bool? isCountrySupported;

  /// Show the last Onfido reported reasons for the rejected cases
  final List<String>? lastRejected;

  /// Shows the latest document properties detected and reported by Onfido
  final Map<String, dynamic>? reportedProperties;

  /// This represents the status of the latest Onfido check.
  final DocumentStatusEnum? status;

  /// This shows the number of Onfido submissions left for the client
  final int? submissionsLeft;
}

/// Onfido class.
class Onfido extends OnfidoModel {
  /// Initializes Onfido class.
  const Onfido({
    String? countryCode,
    List<String>? documents,
    List<String>? documentsSupported,
    bool? isCountrySupported,
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    DocumentStatusEnum? status,
    int? submissionsLeft,
  }) : super(
          countryCode: countryCode,
          documents: documents,
          documentsSupported: documentsSupported,
          isCountrySupported: isCountrySupported,
          lastRejected: lastRejected,
          reportedProperties: reportedProperties,
          status: status,
          submissionsLeft: submissionsLeft,
        );

  /// Creates an instance from JSON.
  factory Onfido.fromJson(Map<String, dynamic> json) => Onfido(
        countryCode: json['country_code'],
        documents: json['documents'] == null
            ? null
            : List<String>.from(
                json['documents']?.map(
                  (dynamic item) => item,
                ),
              ),
        documentsSupported: json['documents_supported'] == null
            ? null
            : List<String>.from(
                json['documents_supported']?.map(
                  (dynamic item) => item,
                ),
              ),
        isCountrySupported: getBool(json['is_country_supported']),
        lastRejected: json['last_rejected'] == null
            ? null
            : List<String>.from(
                json['last_rejected']?.map(
                  (dynamic item) => item,
                ),
              ),
        reportedProperties: json['reported_properties'],
        status: json['status'] == null
            ? null
            : documentStatusEnumMapper[json['status']],
        submissionsLeft: json['submissions_left'],
      );

  /// Converts an instance to JSON.
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
    if (documentsSupported != null) {
      resultMap['documents_supported'] = documentsSupported!
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
    resultMap['status'] = documentStatusEnumMapper.entries
        .firstWhere((MapEntry<String, DocumentStatusEnum> entry) =>
            entry.value == status)
        .key;
    resultMap['submissions_left'] = submissionsLeft;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Onfido copyWith({
    String? countryCode,
    List<String>? documents,
    List<String>? documentsSupported,
    bool? isCountrySupported,
    List<String>? lastRejected,
    Map<String, dynamic>? reportedProperties,
    DocumentStatusEnum? status,
    int? submissionsLeft,
  }) =>
      Onfido(
        countryCode: countryCode ?? this.countryCode,
        documents: documents ?? this.documents,
        documentsSupported: documentsSupported ?? this.documentsSupported,
        isCountrySupported: isCountrySupported ?? this.isCountrySupported,
        lastRejected: lastRejected ?? this.lastRejected,
        reportedProperties: reportedProperties ?? this.reportedProperties,
        status: status ?? this.status,
        submissionsLeft: submissionsLeft ?? this.submissionsLeft,
      );
}

/// Income model class.
abstract class IncomeModel {
  /// Initializes Income model class .
  const IncomeModel({
    this.expiryDate,
    this.status,
  });

  /// Epoch of the source of income document expiry date.
  final DateTime? expiryDate;

  /// Current status of the proof of income document submitted for authentication.
  final IncomeStatusEnum? status;
}

/// Income class.
class Income extends IncomeModel {
  /// Initializes Income class.
  const Income({
    DateTime? expiryDate,
    IncomeStatusEnum? status,
  }) : super(
          expiryDate: expiryDate,
          status: status,
        );

  /// Creates an instance from JSON.
  factory Income.fromJson(Map<String, dynamic> json) => Income(
        expiryDate: getDateTime(json['expiry_date']),
        status: json['status'] == null
            ? null
            : incomeStatusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['expiry_date'] = getSecondsSinceEpochDateTime(expiryDate);
    resultMap['status'] = incomeStatusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, IncomeStatusEnum> entry) => entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Income copyWith({
    DateTime? expiryDate,
    IncomeStatusEnum? status,
  }) =>
      Income(
        expiryDate: expiryDate ?? this.expiryDate,
        status: status ?? this.status,
      );
}

/// Ownership model class.
abstract class OwnershipModel {
  /// Initializes Ownership model class .
  const OwnershipModel({
    this.requests,
    this.status,
  });

  /// The list of proof of ownership requests to fullfil
  final List<RequestsItem>? requests;

  /// This represents the current status of the proof of ownership
  final OwnershipStatusEnum? status;
}

/// Ownership class.
class Ownership extends OwnershipModel {
  /// Initializes Ownership class.
  const Ownership({
    List<RequestsItem>? requests,
    OwnershipStatusEnum? status,
  }) : super(
          requests: requests,
          status: status,
        );

  /// Creates an instance from JSON.
  factory Ownership.fromJson(Map<String, dynamic> json) => Ownership(
        requests: json['requests'] == null
            ? null
            : List<RequestsItem>.from(
                json['requests']?.map(
                  (dynamic item) => RequestsItem.fromJson(item),
                ),
              ),
        status: json['status'] == null
            ? null
            : ownershipStatusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (requests != null) {
      resultMap['requests'] = requests!
          .map<dynamic>(
            (RequestsItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['status'] = ownershipStatusEnumMapper.entries
        .firstWhere((MapEntry<String, OwnershipStatusEnum> entry) =>
            entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Ownership copyWith({
    List<RequestsItem>? requests,
    OwnershipStatusEnum? status,
  }) =>
      Ownership(
        requests: requests ?? this.requests,
        status: status ?? this.status,
      );
}

/// Requests item model class.
abstract class RequestsItemModel {
  /// Initializes Requests item model class .
  const RequestsItemModel({
    this.creationTime,
    this.documentsRequired,
    this.id,
    this.paymentMethod,
  });

  /// The request timestamp of creation
  final String? creationTime;

  /// Number of documents required to be uploaded for proof of ownership
  final double? documentsRequired;

  /// The identifier of the proof of ownership request
  final double? id;

  /// The display name of the payment method being requested
  final String? paymentMethod;
}

/// Requests item class.
class RequestsItem extends RequestsItemModel {
  /// Initializes Requests item class.
  const RequestsItem({
    String? creationTime,
    double? documentsRequired,
    double? id,
    String? paymentMethod,
  }) : super(
          creationTime: creationTime,
          documentsRequired: documentsRequired,
          id: id,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON.
  factory RequestsItem.fromJson(Map<String, dynamic> json) => RequestsItem(
        creationTime: json['creation_time'],
        documentsRequired: getDouble(json['documents_required']),
        id: getDouble(json['id']),
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['creation_time'] = creationTime;
    resultMap['documents_required'] = documentsRequired;
    resultMap['id'] = id;
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequestsItem copyWith({
    String? creationTime,
    double? documentsRequired,
    double? id,
    String? paymentMethod,
  }) =>
      RequestsItem(
        creationTime: creationTime ?? this.creationTime,
        documentsRequired: documentsRequired ?? this.documentsRequired,
        id: id ?? this.id,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
