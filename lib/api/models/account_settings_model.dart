import 'api_base_model.dart';

/// Account setting model class
abstract class AccountSettingsModel extends APIBaseModel {
  /// Initializes
  AccountSettingsModel({
    this.accountOpeningReason,
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.allowCopiers,
    this.citizen,
    this.clientTncStatus,
    this.country,
    this.countryCode,
    this.dateOfBirth,
    this.email,
    this.emailConsent,
    this.firstName,
    this.hasSecretAnswer,
    this.isAuthenticatedPaymentAgent,
    this.lastName,
    this.phone,
    this.placeOfBirth,
    this.requestProfessionalStatus,
    this.residence,
    this.salutation,
    this.taxIdentificationNumber,
    this.taxResidence,
    this.userHash,
  });

  /// Purpose and reason for requesting the account opening.
  /// Only applicable for real money account.
  final String accountOpeningReason;

  /// City (note: not set for virtual-money accounts)
  final String addressCity;

  /// Address line 1 (note: not set for virtual-money accounts)
  final String addressLine1;

  /// Address line 2 (note: not set for virtual-money accounts)
  final String addressLine2;

  /// Post Code (note: not set for virtual-money accounts)
  final String addressPostcode;

  /// State (note: not set for virtual-money accounts)
  final String addressState;

  /// Boolean value true or false, indicating permission to allow others to follow your
  /// trades. Note: not applicable for Virtual account. Only allow for real money account.
  final bool allowCopiers;

  /// Country of legal citizenship, 2-letter country code.
  final String citizen;

  /// Latest terms and conditions version accepted by client
  final String clientTncStatus;

  /// User Country (same as residence field) - deprecated
  final String country;

  /// 2-letter country code ISO standard
  final String countryCode;

  /// Epoch of user's birthday (note: not set for virtual-money accounts)
  final DateTime dateOfBirth;

  /// User Email
  final String email;

  /// Boolean value true or false, indicating permission to use email address for any
  /// contact which may include marketing
  final bool emailConsent;

  /// First name (note: not set for virtual-money accounts)
  final String firstName;

  /// Returns true if the client has a secret answer, 0 otherwise.
  final bool hasSecretAnswer;

  /// Boolean value true or false, indicating whether is payment agent
  /// (note: not applicable for virtual money accounts)
  final bool isAuthenticatedPaymentAgent;

  /// Last name (note: not set for virtual-money accounts)
  final String lastName;

  /// Telephone (note: not set for virtual-money accounts)
  final String phone;

  /// Place of birth, 2-letter country code.
  final String placeOfBirth;

  /// Boolean value true or false, indicating if client has requested professional status.
  final bool requestProfessionalStatus;

  /// User Country
  final String residence;

  /// Salutation (note: not set for virtual-money accounts)
  final String salutation;

  /// Tax identification number. Only applicable for real money account.
  final String taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple
  /// jurisdictions. Only applicable for real money account.
  final String taxResidence;

  /// Hash generated using user details to verify whether the user is legitimate
  /// for our customer support system.
  final String userHash;
}
