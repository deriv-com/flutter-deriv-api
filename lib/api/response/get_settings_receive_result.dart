import 'package:meta/meta.dart';

import '../../basic_api/generated/get_settings_receive.dart';
import '../../basic_api/generated/get_settings_send.dart';
import '../../basic_api/generated/set_settings_receive.dart';
import '../../basic_api/generated/set_settings_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import 'set_settings_receive_result.dart';

/// Get settings response model class
abstract class GetSettingsResponseModel {
  /// Initializes
  GetSettingsResponseModel({
    @required this.getSettings,
  });

  /// User information and settings.
  final GetSettings getSettings;
}

/// Get settings response class
class GetSettingsResponse extends GetSettingsResponseModel {
  /// Initializes
  GetSettingsResponse({
    @required GetSettings getSettings,
  }) : super(
          getSettings: getSettings,
        );

  /// Creates an instance from JSON
  factory GetSettingsResponse.fromJson(
    dynamic getSettingsJson,
  ) =>
      GetSettingsResponse(
        getSettings: getSettingsJson == null
            ? null
            : GetSettings.fromJson(getSettingsJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getSettings != null) {
      resultMap['get_settings'] = getSettings.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets user's settings (email, date of birth, address etc)
  ///
  /// Throws an [AccountSettingsException] if API response contains an error
  static Future<GetSettingsResponse> fetchAccountSetting([
    GetSettingsSend request,
  ]) async {
    final GetSettingsReceive response = await _api.call(
      request: request ?? const GetSettingsSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AccountSettingsException(baseExceptionModel: baseExceptionModel),
    );

    return GetSettingsResponse.fromJson(response.getSettings);
  }

  /// Changes the user's settings with parameters specified as [SetSettingsRequest]
  ///
  /// Throws an [AccountSettingsException] if API response contains an error
  static Future<SetSettingsResponse> changeAccountSetting(
    SetSettingsSend request,
  ) async {
    final SetSettingsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AccountSettingsException(baseExceptionModel: baseExceptionModel),
    );

    return SetSettingsResponse(setSettings: response.setSettings);
  }

  /// Changes user's setting
  Future<SetSettingsResponse> changeSetting({
    String secretAnswer,
    String secretQuestion,
  }) =>
      changeAccountSetting(
        SetSettingsSend(
          accountOpeningReason: getSettings.accountOpeningReason,
          addressCity: getSettings.addressCity,
          addressLine1: getSettings.addressLine1,
          addressLine2: getSettings.addressLine2,
          addressPostcode: getSettings.addressPostcode,
          addressState: getSettings.addressState,
          allowCopiers: getSettings.allowCopiers,
          citizen: getSettings.citizen,
          dateOfBirth: getStringFromDateTime(getSettings.dateOfBirth),
          emailConsent: getSettings.emailConsent,
          firstName: getSettings.firstName,
          lastName: getSettings.lastName,
          phone: getSettings.phone,
          placeOfBirth: getSettings.placeOfBirth,
          requestProfessionalStatus:
              getInt(value: getSettings.requestProfessionalStatus),
          residence: getSettings.residence,
          salutation: getSettings.salutation,
          secretAnswer: secretAnswer,
          secretQuestion: secretQuestion,
          taxIdentificationNumber: getSettings.taxIdentificationNumber,
          taxResidence: getSettings.taxResidence,
        ),
      );

  /// Creates a copy of instance with given parameters
  GetSettingsResponse copyWith({
    GetSettings getSettings,
  }) =>
      GetSettingsResponse(
        getSettings: getSettings ?? this.getSettings,
      );
}
/// Get settings model class
abstract class GetSettingsModel {
  /// Initializes
  GetSettingsModel({
    @required this.salutation,
    @required this.requestProfessionalStatus,
    @required this.phone,
    @required this.nonPepDeclaration,
    @required this.lastName,
    @required this.isAuthenticatedPaymentAgent,
    @required this.immutableFields,
    @required this.hasSecretAnswer,
    @required this.firstName,
    @required this.emailConsent,
    @required this.email,
    @required this.citizen,
    @required this.allowCopiers,
    @required this.addressState,
    @required this.addressPostcode,
    @required this.addressLine2,
    @required this.addressLine1,
    @required this.addressCity,
    this.accountOpeningReason,
    this.clientTncStatus,
    this.country,
    this.countryCode,
    this.dateOfBirth,
    this.placeOfBirth,
    this.residence,
    this.taxIdentificationNumber,
    this.taxResidence,
    this.userHash,
  });

  /// Salutation (note: Only available for users who have at least one real account)
  final String salutation;

  /// Boolean value `true` or `false`, indicating if client has requested professional status.
  final bool requestProfessionalStatus;

  /// Telephone (note: Only available for users who have at least one real account)
  final String phone;

  /// Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates). Note: returned for real accounts only.
  final bool nonPepDeclaration;

  /// Last name (note: Only available for users who have at least one real account)
  final String lastName;

  /// Boolean value `true` or `false`, indicating whether is payment agent (note: not applicable for virtual money accounts)
  final bool isAuthenticatedPaymentAgent;

  /// A list of profile fields which are immutable (read-only unless they are not set yet) due to landing company regulations and the current status of the account.
  final List<String> immutableFields;

  /// Returns `true` if the client has a secret answer, `false` otherwise.
  final bool hasSecretAnswer;

  /// First name (note: Only available for users who have at least one real account)
  final String firstName;

  /// Boolean value `true` or `false`, indicating permission to use email address for any contact which may include marketing
  final bool emailConsent;

  /// User Email
  final String email;

  /// Country of legal citizenship, 2-letter country code.
  final String citizen;

  /// Boolean value `true` or `false`, indicating permission to allow others to follow your trades. Note: not applicable for Virtual account. Only allow for real money account.
  final bool allowCopiers;

  /// State (note: Only available for users who have at least one real account)
  final String addressState;

  /// Post Code (note: Only available for users who have at least one real account)
  final String addressPostcode;

  /// Address line 2 (note: Only available for users who have at least one real account)
  final String addressLine2;

  /// Address line 1 (note: Only available for users who have at least one real account)
  final String addressLine1;

  /// City (note: Only available for users who have at least one real account)
  final String addressCity;

  /// Purpose and reason for requesting the account opening. Only applicable for real money account.
  final String accountOpeningReason;

  /// Latest terms and conditions version accepted by client
  final String clientTncStatus;

  /// User Country (same as residence field) - deprecated
  final String country;

  /// 2-letter country code ISO standard
  final String countryCode;

  /// Epoch of user's birthday (note: Only available for users who have at least one real account)
  final DateTime dateOfBirth;

  /// Place of birth, 2-letter country code.
  final String placeOfBirth;

  /// User Country
  final String residence;

  /// Tax identification number. Only applicable for real money account.
  final String taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account.
  final String taxResidence;

  /// Hash generated using user details to verify whether the user is legitimate for our customer support system.
  final String userHash;
}

/// Get settings class
class GetSettings extends GetSettingsModel {
  /// Initializes
  GetSettings({
    @required String addressCity,
    @required String addressLine1,
    @required String addressLine2,
    @required String addressPostcode,
    @required String addressState,
    @required bool allowCopiers,
    @required String citizen,
    @required String email,
    @required bool emailConsent,
    @required String firstName,
    @required bool hasSecretAnswer,
    @required List<String> immutableFields,
    @required bool isAuthenticatedPaymentAgent,
    @required String lastName,
    @required bool nonPepDeclaration,
    @required String phone,
    @required bool requestProfessionalStatus,
    @required String salutation,
    String accountOpeningReason,
    String clientTncStatus,
    String country,
    String countryCode,
    DateTime dateOfBirth,
    String placeOfBirth,
    String residence,
    String taxIdentificationNumber,
    String taxResidence,
    String userHash,
  }) : super(
          addressCity: addressCity,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          addressPostcode: addressPostcode,
          addressState: addressState,
          allowCopiers: allowCopiers,
          citizen: citizen,
          email: email,
          emailConsent: emailConsent,
          firstName: firstName,
          hasSecretAnswer: hasSecretAnswer,
          immutableFields: immutableFields,
          isAuthenticatedPaymentAgent: isAuthenticatedPaymentAgent,
          lastName: lastName,
          nonPepDeclaration: nonPepDeclaration,
          phone: phone,
          requestProfessionalStatus: requestProfessionalStatus,
          salutation: salutation,
          accountOpeningReason: accountOpeningReason,
          clientTncStatus: clientTncStatus,
          country: country,
          countryCode: countryCode,
          dateOfBirth: dateOfBirth,
          placeOfBirth: placeOfBirth,
          residence: residence,
          taxIdentificationNumber: taxIdentificationNumber,
          taxResidence: taxResidence,
          userHash: userHash,
        );

  /// Creates an instance from JSON
  factory GetSettings.fromJson(Map<String, dynamic> json) => GetSettings(
        addressCity: json['address_city'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        allowCopiers: getBool(json['allow_copiers']),
        citizen: json['citizen'],
        email: json['email'],
        emailConsent: getBool(json['email_consent']),
        firstName: json['first_name'],
        hasSecretAnswer: getBool(json['has_secret_answer']),
        immutableFields: json['immutable_fields'] == null
            ? null
            : List<String>.from(
                json['immutable_fields'].map((dynamic item) => item)),
        isAuthenticatedPaymentAgent:
            getBool(json['is_authenticated_payment_agent']),
        lastName: json['last_name'],
        nonPepDeclaration: getBool(json['non_pep_declaration']),
        phone: json['phone'],
        requestProfessionalStatus: getBool(json['request_professional_status']),
        salutation: json['salutation'],
        accountOpeningReason: json['account_opening_reason'],
        clientTncStatus: json['client_tnc_status'],
        country: json['country'],
        countryCode: json['country_code'],
        dateOfBirth: getDateTime(json['date_of_birth']),
        placeOfBirth: json['place_of_birth'],
        residence: json['residence'],
        taxIdentificationNumber: json['tax_identification_number'],
        taxResidence: json['tax_residence'],
        userHash: json['user_hash'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address_city'] = addressCity;
    resultMap['address_line_1'] = addressLine1;
    resultMap['address_line_2'] = addressLine2;
    resultMap['address_postcode'] = addressPostcode;
    resultMap['address_state'] = addressState;
    resultMap['allow_copiers'] = allowCopiers;
    resultMap['citizen'] = citizen;
    resultMap['email'] = email;
    resultMap['email_consent'] = emailConsent;
    resultMap['first_name'] = firstName;
    resultMap['has_secret_answer'] = hasSecretAnswer;
    if (immutableFields != null) {
      resultMap['immutable_fields'] =
          immutableFields.map<dynamic>((String item) => item).toList();
    }
    resultMap['is_authenticated_payment_agent'] = isAuthenticatedPaymentAgent;
    resultMap['last_name'] = lastName;
    resultMap['non_pep_declaration'] = nonPepDeclaration;
    resultMap['phone'] = phone;
    resultMap['request_professional_status'] = requestProfessionalStatus;
    resultMap['salutation'] = salutation;
    resultMap['account_opening_reason'] = accountOpeningReason;
    resultMap['client_tnc_status'] = clientTncStatus;
    resultMap['country'] = country;
    resultMap['country_code'] = countryCode;
    resultMap['date_of_birth'] = getSecondsSinceEpochDateTime(dateOfBirth);
    resultMap['place_of_birth'] = placeOfBirth;
    resultMap['residence'] = residence;
    resultMap['tax_identification_number'] = taxIdentificationNumber;
    resultMap['tax_residence'] = taxResidence;
    resultMap['user_hash'] = userHash;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  GetSettings copyWith({
    String addressCity,
    String addressLine1,
    String addressLine2,
    String addressPostcode,
    String addressState,
    bool allowCopiers,
    String citizen,
    String email,
    bool emailConsent,
    String firstName,
    bool hasSecretAnswer,
    List<String> immutableFields,
    bool isAuthenticatedPaymentAgent,
    String lastName,
    bool nonPepDeclaration,
    String phone,
    bool requestProfessionalStatus,
    String salutation,
    String accountOpeningReason,
    String clientTncStatus,
    String country,
    String countryCode,
    DateTime dateOfBirth,
    String placeOfBirth,
    String residence,
    String taxIdentificationNumber,
    String taxResidence,
    String userHash,
  }) =>
      GetSettings(
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        allowCopiers: allowCopiers ?? this.allowCopiers,
        citizen: citizen ?? this.citizen,
        email: email ?? this.email,
        emailConsent: emailConsent ?? this.emailConsent,
        firstName: firstName ?? this.firstName,
        hasSecretAnswer: hasSecretAnswer ?? this.hasSecretAnswer,
        immutableFields: immutableFields ?? this.immutableFields,
        isAuthenticatedPaymentAgent:
            isAuthenticatedPaymentAgent ?? this.isAuthenticatedPaymentAgent,
        lastName: lastName ?? this.lastName,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        requestProfessionalStatus:
            requestProfessionalStatus ?? this.requestProfessionalStatus,
        salutation: salutation ?? this.salutation,
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        clientTncStatus: clientTncStatus ?? this.clientTncStatus,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        residence: residence ?? this.residence,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        userHash: userHash ?? this.userHash,
      );
}
