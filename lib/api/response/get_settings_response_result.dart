// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/set_settings_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_settings_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_settings_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_settings_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_settings_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Get settings response model class.
abstract class GetSettingsResponseModel {
  /// Initializes Get settings response model class .
  const GetSettingsResponseModel({
    this.getSettings,
  });

  /// User information and settings.
  final GetSettings? getSettings;
}

/// Get settings response class.
class GetSettingsResponse extends GetSettingsResponseModel {
  /// Initializes Get settings response class.
  const GetSettingsResponse({
    super.getSettings,
  });

  /// Creates an instance from JSON.
  factory GetSettingsResponse.fromJson(
    dynamic getSettingsJson,
  ) =>
      GetSettingsResponse(
        getSettings: getSettingsJson == null
            ? null
            : GetSettings.fromJson(getSettingsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getSettings != null) {
      resultMap['get_settings'] = getSettings!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets user's settings (email, date of birth, address etc).
  ///
  /// For parameters information refer to [GetSettingsRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<GetSettingsReceive> fetchAccountSettingRaw([
    GetSettingsRequest? request,
  ]) async {
    final GetSettingsReceive response = await _api.call(
      request: request ?? const GetSettingsRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Gets user's settings (email, date of birth, address etc).
  ///
  /// For parameters information refer to [GetSettingsRequest].
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<SetSettingsReceive> changeAccountSettingRaw(
    SetSettingsRequest request,
  ) async {
    final SetSettingsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Gets user's settings (email, date of birth, address etc).
  ///
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<GetSettingsResponse> fetchAccountSetting([
    GetSettingsRequest? request,
  ]) async {
    final GetSettingsReceive response = await fetchAccountSettingRaw(request);

    return GetSettingsResponse.fromJson(response.getSettings);
  }

  /// Changes the user's settings with parameters specified as [SetSettingsRequest].
  ///
  /// Throws an [BaseAPIException] if API response contains an error.
  static Future<SetSettingsResponse> changeAccountSetting(
    SetSettingsRequest request,
  ) async {
    final SetSettingsReceive response = await changeAccountSettingRaw(request);

    return SetSettingsResponse(setSettings: response.setSettings ?? 0);
  }

  /// Changes user's setting
  Future<SetSettingsResponse> changeSetting({
    required String secretAnswer,
    required String secretQuestion,
  }) =>
      changeAccountSetting(
        SetSettingsRequest(
          accountOpeningReason: getSettings?.accountOpeningReason,
          addressCity: getSettings?.addressCity,
          addressLine1: getSettings?.addressLine1,
          addressLine2: getSettings?.addressLine2,
          addressPostcode: getSettings?.addressPostcode,
          addressState: getSettings?.addressState,
          allowCopiers: getSettings?.allowCopiers,
          citizen: getSettings?.citizen,
          dateOfBirth: getStringFromDateTime(getSettings?.dateOfBirth),
          emailConsent: getSettings?.emailConsent,
          firstName: getSettings?.firstName,
          lastName: getSettings?.lastName,
          phone: getSettings?.phone,
          placeOfBirth: getSettings?.placeOfBirth,
          requestProfessionalStatus:
              getInt(value: getSettings?.requestProfessionalStatus),
          residence: getSettings?.residence,
          salutation: getSettings?.salutation,
          secretAnswer: secretAnswer,
          secretQuestion: secretQuestion,
          taxIdentificationNumber: getSettings?.taxIdentificationNumber,
          taxResidence: getSettings?.taxResidence,
          dxtradeUserException: getSettings?.dxtradeUserException,
        ),
      );

  /// Creates a copy of instance with given parameters.
  GetSettingsResponse copyWith({
    GetSettings? getSettings,
  }) =>
      GetSettingsResponse(
        getSettings: getSettings ?? this.getSettings,
      );
}

/// EmploymentStatusEnum mapper.
final Map<String, EmploymentStatusEnum> employmentStatusEnumMapper =
    <String, EmploymentStatusEnum>{
  "Employed": EmploymentStatusEnum.employed,
  "Pensioner": EmploymentStatusEnum.pensioner,
  "Self-Employed": EmploymentStatusEnum.selfEmployed,
  "Student": EmploymentStatusEnum.student,
  "Unemployed": EmploymentStatusEnum.unemployed,
};

/// EmploymentStatus Enum.
enum EmploymentStatusEnum {
  /// Employed.
  employed,

  /// Pensioner.
  pensioner,

  /// Self-Employed.
  selfEmployed,

  /// Student.
  student,

  /// Unemployed.
  unemployed,
}

/// Get settings model class.
abstract class GetSettingsModel {
  /// Initializes Get settings model class .
  const GetSettingsModel({
    this.accountOpeningReason,
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.allowCopiers,
    this.citizen,
    this.clientTncStatus,
    this.coolingOffExpirationDate,
    this.country,
    this.countryCode,
    this.dateOfBirth,
    this.dxtradeUserException,
    this.email,
    this.emailConsent,
    this.employmentStatus,
    this.fatcaDeclaration,
    this.featureFlag,
    this.firstName,
    this.hasSecretAnswer,
    this.immutableFields,
    this.isAuthenticatedPaymentAgent,
    this.lastName,
    this.nonPepDeclaration,
    this.phone,
    this.phoneNumberVerification,
    this.placeOfBirth,
    this.preferredLanguage,
    this.requestProfessionalStatus,
    this.residence,
    this.salutation,
    this.taxIdentificationNumber,
    this.taxResidence,
    this.tinSkipped,
    this.tncStatus,
    this.tradingHub,
    this.userHash,
  });

  /// Purpose and reason for requesting the account opening. Only applicable for real money account.
  final String? accountOpeningReason;

  /// City (note: Only available for users who have at least one real account)
  final String? addressCity;

  /// Address line 1 (note: Only available for users who have at least one real account)
  final String? addressLine1;

  /// Address line 2 (note: Only available for users who have at least one real account)
  final String? addressLine2;

  /// Post Code (note: Only available for users who have at least one real account)
  final String? addressPostcode;

  /// State (note: Only available for users who have at least one real account)
  final String? addressState;

  /// Boolean value `true` or `false`, indicating permission to allow others to follow your trades. Note: not applicable for Virtual account. Only allow for real money account.
  final bool? allowCopiers;

  /// Country of legal citizenship, 2-letter country code.
  final String? citizen;

  /// Latest terms and conditions version accepted by client
  final String? clientTncStatus;

  /// Cooldown expiration epoch date when a client fails appropriateness tests
  final DateTime? coolingOffExpirationDate;

  /// User Country (same as residence field) - deprecated
  final String? country;

  /// 2-letter country code ISO standard
  final String? countryCode;

  /// Epoch of user's birthday (note: Only available for users who have at least one real account)
  final DateTime? dateOfBirth;

  /// Boolean value `true` or `false`, indicating if user email belong to dxtrade exception list.
  final bool? dxtradeUserException;

  /// User Email
  final String? email;

  /// Boolean value `true` or `false`, indicating permission to use email address for any contact which may include marketing
  final bool? emailConsent;

  /// Employment Status.
  final EmploymentStatusEnum? employmentStatus;

  /// Indicates client's self-declaration for FATCA.
  final int? fatcaDeclaration;

  /// Contains features that are enabled or disabled for this user
  final FeatureFlag? featureFlag;

  /// First name (note: Only available for users who have at least one real account)
  final String? firstName;

  /// Returns `true` if the client has a secret answer, `false` otherwise.
  final bool? hasSecretAnswer;

  /// A list of profile fields which are immutable (read-only unless they are not set yet) due to landing company regulations and the current status of the account.
  final List<String>? immutableFields;

  /// Boolean value `true` or `false`, indicating whether is payment agent (note: not applicable for virtual money accounts)
  final bool? isAuthenticatedPaymentAgent;

  /// Last name (note: Only available for users who have at least one real account)
  final String? lastName;

  /// Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates). Note: returned for real accounts only.
  final bool? nonPepDeclaration;

  /// Telephone (note: Only available for users who have at least one real account)
  final String? phone;

  /// The status of the Phone Number Verification.
  final PhoneNumberVerification? phoneNumberVerification;

  /// Place of birth, 2-letter country code.
  final String? placeOfBirth;

  /// User's preferred language, ISO standard code of language
  final String? preferredLanguage;

  /// Boolean value `true` or `false`, indicating if client has requested professional status.
  final bool? requestProfessionalStatus;

  /// User Country
  final String? residence;

  /// Salutation (note: Only available for users who have at least one real account)
  final String? salutation;

  /// Tax identification number. Only applicable for real money account.
  final String? taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account.
  final String? taxResidence;

  /// [Optional] Whether the client has skipped the TIN form. Only applicable for real money account.
  final bool? tinSkipped;

  /// Terms and condition status tells us whether all the accounts of this user has accepted the latest T&C version.
  final Map<String, dynamic>? tncStatus;

  /// Boolean value 1 or 0, indicating if client has enabled the Trading Hub dashboard
  final int? tradingHub;

  /// Hash generated using user details to verify whether the user is legitimate for our customer support system.
  final String? userHash;
}

/// Get settings class.
class GetSettings extends GetSettingsModel {
  /// Initializes Get settings class.
  const GetSettings({
    super.accountOpeningReason,
    super.addressCity,
    super.addressLine1,
    super.addressLine2,
    super.addressPostcode,
    super.addressState,
    super.allowCopiers,
    super.citizen,
    super.clientTncStatus,
    super.coolingOffExpirationDate,
    super.country,
    super.countryCode,
    super.dateOfBirth,
    super.dxtradeUserException,
    super.email,
    super.emailConsent,
    super.employmentStatus,
    super.fatcaDeclaration,
    super.featureFlag,
    super.firstName,
    super.hasSecretAnswer,
    super.immutableFields,
    super.isAuthenticatedPaymentAgent,
    super.lastName,
    super.nonPepDeclaration,
    super.phone,
    super.phoneNumberVerification,
    super.placeOfBirth,
    super.preferredLanguage,
    super.requestProfessionalStatus,
    super.residence,
    super.salutation,
    super.taxIdentificationNumber,
    super.taxResidence,
    super.tinSkipped,
    super.tncStatus,
    super.tradingHub,
    super.userHash,
  });

  /// Creates an instance from JSON.
  factory GetSettings.fromJson(Map<String, dynamic> json) => GetSettings(
        accountOpeningReason: json['account_opening_reason'],
        addressCity: json['address_city'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        allowCopiers: getBool(json['allow_copiers']),
        citizen: json['citizen'],
        clientTncStatus: json['client_tnc_status'],
        coolingOffExpirationDate:
            getDateTime(json['cooling_off_expiration_date']),
        country: json['country'],
        countryCode: json['country_code'],
        dateOfBirth: getDateTime(json['date_of_birth']),
        dxtradeUserException: getBool(json['dxtrade_user_exception']),
        email: json['email'],
        emailConsent: getBool(json['email_consent']),
        employmentStatus: json['employment_status'] == null
            ? null
            : employmentStatusEnumMapper[json['employment_status']],
        fatcaDeclaration: json['fatca_declaration'],
        featureFlag: json['feature_flag'] == null
            ? null
            : FeatureFlag.fromJson(json['feature_flag']),
        firstName: json['first_name'],
        hasSecretAnswer: getBool(json['has_secret_answer']),
        immutableFields: json['immutable_fields'] == null
            ? null
            : List<String>.from(
                json['immutable_fields']?.map(
                  (dynamic item) => item,
                ),
              ),
        isAuthenticatedPaymentAgent:
            getBool(json['is_authenticated_payment_agent']),
        lastName: json['last_name'],
        nonPepDeclaration: getBool(json['non_pep_declaration']),
        phone: json['phone'],
        phoneNumberVerification: json['phone_number_verification'] == null
            ? null
            : PhoneNumberVerification.fromJson(
                json['phone_number_verification']),
        placeOfBirth: json['place_of_birth'],
        preferredLanguage: json['preferred_language'],
        requestProfessionalStatus: getBool(json['request_professional_status']),
        residence: json['residence'],
        salutation: json['salutation'],
        taxIdentificationNumber: json['tax_identification_number'],
        taxResidence: json['tax_residence'],
        tinSkipped: getBool(json['tin_skipped']),
        tncStatus: json['tnc_status'],
        tradingHub: json['trading_hub'],
        userHash: json['user_hash'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_opening_reason'] = accountOpeningReason;
    resultMap['address_city'] = addressCity;
    resultMap['address_line_1'] = addressLine1;
    resultMap['address_line_2'] = addressLine2;
    resultMap['address_postcode'] = addressPostcode;
    resultMap['address_state'] = addressState;
    resultMap['allow_copiers'] = allowCopiers;
    resultMap['citizen'] = citizen;
    resultMap['client_tnc_status'] = clientTncStatus;
    resultMap['cooling_off_expiration_date'] =
        getSecondsSinceEpochDateTime(coolingOffExpirationDate);
    resultMap['country'] = country;
    resultMap['country_code'] = countryCode;
    resultMap['date_of_birth'] = getSecondsSinceEpochDateTime(dateOfBirth);
    resultMap['dxtrade_user_exception'] = dxtradeUserException;
    resultMap['email'] = email;
    resultMap['email_consent'] = emailConsent;
    resultMap['employment_status'] = employmentStatusEnumMapper.entries
        .firstWhere((MapEntry<String, EmploymentStatusEnum> entry) =>
            entry.value == employmentStatus)
        .key;
    resultMap['fatca_declaration'] = fatcaDeclaration;
    if (featureFlag != null) {
      resultMap['feature_flag'] = featureFlag!.toJson();
    }
    resultMap['first_name'] = firstName;
    resultMap['has_secret_answer'] = hasSecretAnswer;
    if (immutableFields != null) {
      resultMap['immutable_fields'] = immutableFields!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['is_authenticated_payment_agent'] = isAuthenticatedPaymentAgent;
    resultMap['last_name'] = lastName;
    resultMap['non_pep_declaration'] = nonPepDeclaration;
    resultMap['phone'] = phone;
    if (phoneNumberVerification != null) {
      resultMap['phone_number_verification'] =
          phoneNumberVerification!.toJson();
    }
    resultMap['place_of_birth'] = placeOfBirth;
    resultMap['preferred_language'] = preferredLanguage;
    resultMap['request_professional_status'] = requestProfessionalStatus;
    resultMap['residence'] = residence;
    resultMap['salutation'] = salutation;
    resultMap['tax_identification_number'] = taxIdentificationNumber;
    resultMap['tax_residence'] = taxResidence;
    resultMap['tin_skipped'] = tinSkipped;
    resultMap['tnc_status'] = tncStatus;
    resultMap['trading_hub'] = tradingHub;
    resultMap['user_hash'] = userHash;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetSettings copyWith({
    String? accountOpeningReason,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    bool? allowCopiers,
    String? citizen,
    String? clientTncStatus,
    DateTime? coolingOffExpirationDate,
    String? country,
    String? countryCode,
    DateTime? dateOfBirth,
    bool? dxtradeUserException,
    String? email,
    bool? emailConsent,
    EmploymentStatusEnum? employmentStatus,
    int? fatcaDeclaration,
    FeatureFlag? featureFlag,
    String? firstName,
    bool? hasSecretAnswer,
    List<String>? immutableFields,
    bool? isAuthenticatedPaymentAgent,
    String? lastName,
    bool? nonPepDeclaration,
    String? phone,
    PhoneNumberVerification? phoneNumberVerification,
    String? placeOfBirth,
    String? preferredLanguage,
    bool? requestProfessionalStatus,
    String? residence,
    String? salutation,
    String? taxIdentificationNumber,
    String? taxResidence,
    bool? tinSkipped,
    Map<String, dynamic>? tncStatus,
    int? tradingHub,
    String? userHash,
  }) =>
      GetSettings(
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        allowCopiers: allowCopiers ?? this.allowCopiers,
        citizen: citizen ?? this.citizen,
        clientTncStatus: clientTncStatus ?? this.clientTncStatus,
        coolingOffExpirationDate:
            coolingOffExpirationDate ?? this.coolingOffExpirationDate,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        dxtradeUserException: dxtradeUserException ?? this.dxtradeUserException,
        email: email ?? this.email,
        emailConsent: emailConsent ?? this.emailConsent,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        fatcaDeclaration: fatcaDeclaration ?? this.fatcaDeclaration,
        featureFlag: featureFlag ?? this.featureFlag,
        firstName: firstName ?? this.firstName,
        hasSecretAnswer: hasSecretAnswer ?? this.hasSecretAnswer,
        immutableFields: immutableFields ?? this.immutableFields,
        isAuthenticatedPaymentAgent:
            isAuthenticatedPaymentAgent ?? this.isAuthenticatedPaymentAgent,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        phoneNumberVerification:
            phoneNumberVerification ?? this.phoneNumberVerification,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
        requestProfessionalStatus:
            requestProfessionalStatus ?? this.requestProfessionalStatus,
        residence: residence ?? this.residence,
        salutation: salutation ?? this.salutation,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        tinSkipped: tinSkipped ?? this.tinSkipped,
        tncStatus: tncStatus ?? this.tncStatus,
        tradingHub: tradingHub ?? this.tradingHub,
        userHash: userHash ?? this.userHash,
      );
}

/// Feature flag model class.
abstract class FeatureFlagModel {
  /// Initializes Feature flag model class .
  const FeatureFlagModel({
    this.wallet,
  });

  /// Boolean value `true` or `false` indicating whether his feature this enabled or not
  final bool? wallet;
}

/// Feature flag class.
class FeatureFlag extends FeatureFlagModel {
  /// Initializes Feature flag class.
  const FeatureFlag({
    super.wallet,
  });

  /// Creates an instance from JSON.
  factory FeatureFlag.fromJson(Map<String, dynamic> json) => FeatureFlag(
        wallet: getBool(json['wallet']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['wallet'] = wallet;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FeatureFlag copyWith({
    bool? wallet,
  }) =>
      FeatureFlag(
        wallet: wallet ?? this.wallet,
      );
}

/// Phone number verification model class.
abstract class PhoneNumberVerificationModel {
  /// Initializes Phone number verification model class .
  const PhoneNumberVerificationModel({
    required this.verified,
    this.challengeAttemptsRemaining,
    this.nextAttempt,
    this.nextEmailAttempt,
    this.nextVerifyAttempt,
    this.sessionTimestamp,
    this.verifyAttemptsRemaining,
  });

  /// Indicates the verification status of the client's phone number.
  final bool verified;

  /// Indicates the attempts remaining for /phone_number_challenge
  final int? challengeAttemptsRemaining;

  /// (Optional) Indicates the timestamp for the next verification attempt
  final int? nextAttempt;

  /// (Optional) Indicates the timestamp for the next email verification attempt
  final int? nextEmailAttempt;

  /// (Optional) Indicates the timestamp for the next verify attempt
  final int? nextVerifyAttempt;

  /// (Optional) Indicates the timestamp for the current's session email code expiry
  final DateTime? sessionTimestamp;

  /// Indicates the attempts remaining for /phone_number_verification
  final int? verifyAttemptsRemaining;
}

/// Phone number verification class.
class PhoneNumberVerification extends PhoneNumberVerificationModel {
  /// Initializes Phone number verification class.
  const PhoneNumberVerification({
    required super.verified,
    super.challengeAttemptsRemaining,
    super.nextAttempt,
    super.nextEmailAttempt,
    super.nextVerifyAttempt,
    super.sessionTimestamp,
    super.verifyAttemptsRemaining,
  });

  /// Creates an instance from JSON.
  factory PhoneNumberVerification.fromJson(Map<String, dynamic> json) =>
      PhoneNumberVerification(
        verified: getBool(json['verified'])!,
        challengeAttemptsRemaining: json['challenge_attempts_remaining'],
        nextAttempt: json['next_attempt'],
        nextEmailAttempt: json['next_email_attempt'],
        nextVerifyAttempt: json['next_verify_attempt'],
        sessionTimestamp: getDateTime(json['session_timestamp']),
        verifyAttemptsRemaining: json['verify_attempts_remaining'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['verified'] = verified;
    resultMap['challenge_attempts_remaining'] = challengeAttemptsRemaining;
    resultMap['next_attempt'] = nextAttempt;
    resultMap['next_email_attempt'] = nextEmailAttempt;
    resultMap['next_verify_attempt'] = nextVerifyAttempt;
    resultMap['session_timestamp'] =
        getSecondsSinceEpochDateTime(sessionTimestamp);
    resultMap['verify_attempts_remaining'] = verifyAttemptsRemaining;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PhoneNumberVerification copyWith({
    bool? verified,
    int? challengeAttemptsRemaining,
    int? nextAttempt,
    int? nextEmailAttempt,
    int? nextVerifyAttempt,
    DateTime? sessionTimestamp,
    int? verifyAttemptsRemaining,
  }) =>
      PhoneNumberVerification(
        verified: verified ?? this.verified,
        challengeAttemptsRemaining:
            challengeAttemptsRemaining ?? this.challengeAttemptsRemaining,
        nextAttempt: nextAttempt ?? this.nextAttempt,
        nextEmailAttempt: nextEmailAttempt ?? this.nextEmailAttempt,
        nextVerifyAttempt: nextVerifyAttempt ?? this.nextVerifyAttempt,
        sessionTimestamp: sessionTimestamp ?? this.sessionTimestamp,
        verifyAttemptsRemaining:
            verifyAttemptsRemaining ?? this.verifyAttemptsRemaining,
      );
}
