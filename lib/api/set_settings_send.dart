/// generated automatically from flutter_deriv_api|lib/api/set_settings_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'set_settings_send.g.dart';

/// JSON conversion for 'set_settings_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetSettingsRequest extends Request {
  /// Initialize SetSettingsRequest
  const SetSettingsRequest({
    this.accountOpeningReason,
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.allowCopiers,
    this.citizen,
    this.dateOfBirth,
    this.emailConsent,
    this.firstName,
    this.lastName,
    this.phone,
    this.placeOfBirth,
    this.requestProfessionalStatus,
    this.residence,
    this.salutation,
    this.secretAnswer,
    this.secretQuestion,
    this.setSettings = 1,
    this.taxIdentificationNumber,
    this.taxResidence,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory SetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      _$SetSettingsRequestFromJson(json);

  // Properties
  /// [Optional] Purpose and reason for requesting the account opening. Only applicable for real money account. Required for clients that have not set it yet. Can only be set once.
  final String accountOpeningReason;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account.
  final String addressCity;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account.
  final String addressLine1;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String addressLine2;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String addressPostcode;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String addressState;

  /// [Optional] Boolean value 1 or 0, indicating permission to allow others to follow your trades. Note: not applicable for Virtual account. Only allow for real money account.
  final int allowCopiers;

  /// [Optional] Country of legal citizenship, 2-letter country code.
  final String citizen;

  /// [Optional] Date of birth format: yyyy-mm-dd (can only be changed on unauthenticated svg accounts).
  final String dateOfBirth;

  /// [Optional] Boolean value 1 or 0, indicating permission to use email address for any contact which may include marketing
  final int emailConsent;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes (can only be changed on unauthenticated svg accounts).
  final String firstName;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes (can only be changed on unauthenticated svg accounts).
  final String lastName;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account. Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String phone;

  /// [Optional] Place of birth, 2-letter country code.
  final String placeOfBirth;

  /// [Optional] Required when client wants to be treated as professional. Applicable for financial accounts only.
  final int requestProfessionalStatus;

  /// [Optional] 2-letter country code. Note: not applicable for real money account. Only allow for Virtual account without residence set.
  final String residence;

  /// [Optional] Accept any value in enum list (can only be changed on unauthenticated svg accounts).
  final String salutation;

  /// [Optional] Answer to secret question, within 4-50 characters. Required for new account and existing client details will be used if client opens another account.
  final String secretAnswer;

  /// [Optional] Accept any value in enum list. Required for new account and existing client details will be used if client opens another account.
  final String secretQuestion;

  /// Must be `1`
  final int setSettings;

  /// [Optional] Tax identification number. Only applicable for real money account. Required for maltainvest landing company.
  final String taxIdentificationNumber;

  /// [Optional] Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for maltainvest landing company.
  final String taxResidence;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SetSettingsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SetSettingsRequest copyWith({
    String accountOpeningReason,
    String addressCity,
    String addressLine1,
    String addressLine2,
    String addressPostcode,
    String addressState,
    int allowCopiers,
    String citizen,
    String dateOfBirth,
    int emailConsent,
    String firstName,
    String lastName,
    String phone,
    String placeOfBirth,
    int requestProfessionalStatus,
    String residence,
    String salutation,
    String secretAnswer,
    String secretQuestion,
    int setSettings,
    String taxIdentificationNumber,
    String taxResidence,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      SetSettingsRequest(
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        allowCopiers: allowCopiers ?? this.allowCopiers,
        citizen: citizen ?? this.citizen,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailConsent: emailConsent ?? this.emailConsent,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        requestProfessionalStatus:
            requestProfessionalStatus ?? this.requestProfessionalStatus,
        residence: residence ?? this.residence,
        salutation: salutation ?? this.salutation,
        secretAnswer: secretAnswer ?? this.secretAnswer,
        secretQuestion: secretQuestion ?? this.secretQuestion,
        setSettings: setSettings ?? this.setSettings,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
