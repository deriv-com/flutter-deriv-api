import 'package:flutter_deriv_api/api/account/account_settings/exceptions/account_settings_exception.dart';
import 'package:flutter_deriv_api/api/account/models/account_settings_model.dart';
import 'package:flutter_deriv_api/api/account/models/set_account_setting_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// User information and settings (email, date of birth, address etc).
class AccountSettings extends AccountSettingsModel {
  /// Initializes
  AccountSettings({
    String accountOpeningReason,
    String addressCity,
    String addressLine1,
    String addressLine2,
    String addressPostcode,
    String addressState,
    bool allowCopiers,
    String citizen,
    String clientTncStatus,
    String country,
    String countryCode,
    DateTime dateOfBirth,
    String email,
    bool emailConsent,
    String firstName,
    bool hasSecretAnswer,
    bool isAuthenticatedPaymentAgent,
    String lastName,
    String phone,
    String placeOfBirth,
    bool requestProfessionalStatus,
    String residence,
    String salutation,
    String taxIdentificationNumber,
    String taxResidence,
    String userHash,
  }) : super(
          accountOpeningReason: accountOpeningReason,
          addressCity: addressCity,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          addressPostcode: addressPostcode,
          addressState: addressState,
          allowCopiers: allowCopiers,
          citizen: citizen,
          clientTncStatus: clientTncStatus,
          country: country,
          countryCode: countryCode,
          dateOfBirth: dateOfBirth,
          email: email,
          emailConsent: emailConsent,
          firstName: firstName,
          hasSecretAnswer: hasSecretAnswer,
          isAuthenticatedPaymentAgent: isAuthenticatedPaymentAgent,
          lastName: lastName,
          phone: phone,
          placeOfBirth: placeOfBirth,
          requestProfessionalStatus: requestProfessionalStatus,
          residence: residence,
          salutation: salutation,
          taxIdentificationNumber: taxIdentificationNumber,
          taxResidence: taxResidence,
          userHash: userHash,
        );

  /// Generates an instance from JSON
  factory AccountSettings.fromJson(Map<String, dynamic> json) =>
      AccountSettings(
        accountOpeningReason: json['account_opening_reason'],
        addressCity: json['address_city'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        addressPostcode: json['address_postcode'],
        addressState: json['address_state'],
        allowCopiers: getBool(json['allow_copiers']),
        citizen: json['citizen'],
        clientTncStatus: json['client_tnc_status'],
        country: json['country'],
        countryCode: json['country_code'],
        dateOfBirth: getDateTime(json['date_of_birth']),
        email: json['email'],
        emailConsent: getBool(json['email_consent']),
        firstName: json['first_name'],
        hasSecretAnswer: getBool(json['has_secret_answer']),
        isAuthenticatedPaymentAgent:
            getBool(json['is_authenticated_payment_agent']),
        lastName: json['last_name'],
        phone: json['phone'],
        placeOfBirth: json['place_of_birth'],
        requestProfessionalStatus: getBool(json['request_professional_status']),
        residence: json['residence'],
        salutation: json['salutation'],
        taxIdentificationNumber: json['tax_identification_number'],
        taxResidence: json['tax_residence'],
        userHash: json['user_hash'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets user's settings (email, date of birth, address etc)
  ///
  /// Throws an [AccountSettingsException] if API response contains an error
  static Future<AccountSettings> fetchAccountSetting([
    GetSettingsRequest request,
  ]) async {
    final GetSettingsResponse response = await _api.call(
      request: request ?? const GetSettingsRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          AccountSettingsException(message: message),
    );

    return AccountSettings.fromJson(response.getSettings);
  }

  /// Changes the user's settings with parameters specified as [SetSettingsRequest]
  ///
  /// Throws an [AccountSettingsException] if API response contains an error
  static Future<SetAccountSettingModel> changeAccountSetting(
    SetSettingsRequest request,
  ) async {
    final SetSettingsResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          AccountSettingsException(message: message),
    );

    return SetAccountSettingModel(succeeded: getBool(response.setSettings));
  }

  /// Changes user's setting
  Future<SetAccountSettingModel> changeSetting({
    String secretAnswer,
    String secretQuestion,
  }) =>
      changeAccountSetting(
        SetSettingsRequest(
          accountOpeningReason: accountOpeningReason,
          addressCity: addressCity,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          addressPostcode: addressPostcode,
          addressState: addressState,
          allowCopiers: allowCopiers,
          citizen: citizen,
          dateOfBirth: dateOfBirth
              .toString(), // TODO(hamed): change format to `yyyy-MM-dd` after adding intl package
          emailConsent: emailConsent,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          placeOfBirth: placeOfBirth
              .toString(), // TODO(hamed): change format to `yyyy-MM-dd` after adding intl package
          requestProfessionalStatus: getInt(requestProfessionalStatus),
          residence: residence,
          salutation: salutation,
          secretAnswer: secretAnswer,
          secretQuestion: secretQuestion,
          taxIdentificationNumber: taxIdentificationNumber,
          taxResidence: taxResidence,
        ),
      );

  /// Generates a copy of instance with given parameters
  AccountSettings copyWith({
    String accountOpeningReason,
    String addressCity,
    String addressLine1,
    String addressLine2,
    String addressPostcode,
    String addressState,
    bool allowCopiers,
    String citizen,
    String clientTncStatus,
    String country,
    String countryCode,
    DateTime dateOfBirth,
    String email,
    bool emailConsent,
    String firstName,
    bool hasSecretAnswer,
    bool isAuthenticatedPaymentAgent,
    String lastName,
    String phone,
    String placeOfBirth,
    bool requestProfessionalStatus,
    String residence,
    String salutation,
    String taxIdentificationNumber,
    String taxResidence,
    String userHash,
  }) =>
      AccountSettings(
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        allowCopiers: allowCopiers ?? this.allowCopiers,
        citizen: citizen ?? this.citizen,
        clientTncStatus: clientTncStatus ?? this.clientTncStatus,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        email: email ?? this.email,
        emailConsent: emailConsent ?? this.emailConsent,
        firstName: firstName ?? this.firstName,
        hasSecretAnswer: hasSecretAnswer ?? this.hasSecretAnswer,
        isAuthenticatedPaymentAgent:
            isAuthenticatedPaymentAgent ?? this.isAuthenticatedPaymentAgent,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        requestProfessionalStatus:
            requestProfessionalStatus ?? this.requestProfessionalStatus,
        residence: residence ?? this.residence,
        salutation: salutation ?? this.salutation,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        userHash: userHash ?? this.userHash,
      );
}
