/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_settings_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Set settings request class.
class SetSettingsRequest extends Request {
  /// Initialize SetSettingsRequest.
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
    required this.dxtradeUserException,
    this.emailConsent,
    this.employmentStatus,
    this.featureFlag,
    this.firstName,
    this.lastName,
    this.loginid,
    this.nonPepDeclaration,
    this.phone,
    this.placeOfBirth,
    this.preferredLanguage,
    this.requestProfessionalStatus,
    this.residence,
    this.salutation,
    this.secretAnswer,
    this.secretQuestion,
    this.setSettings = true,
    this.taxIdentificationNumber,
    this.taxResidence,
    this.tinSkipped,
    this.tradingHub,
    super.msgType = 'set_settings',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory SetSettingsRequest.fromJson(Map<String, dynamic> json) =>
      SetSettingsRequest(
        accountOpeningReason: json['account_opening_reason'] as String?,
        addressCity: json['address_city'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        allowCopiers:
            json['allow_copiers'] == null ? null : json['allow_copiers'] == 1,
        citizen: json['citizen'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        dxtradeUserException: json['dxtrade_user_exception'] == null
            ? null
            : json['dxtrade_user_exception'] == 1,
        emailConsent:
            json['email_consent'] == null ? null : json['email_consent'] == 1,
        employmentStatus: json['employment_status'] as String?,
        featureFlag: json['feature_flag'] as Map<String, dynamic>?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        loginid: json['loginid'] as String?,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        phone: json['phone'] as String?,
        placeOfBirth: json['place_of_birth'] as String?,
        preferredLanguage: json['preferred_language'] as String?,
        requestProfessionalStatus: json['request_professional_status'] as int?,
        residence: json['residence'] as String?,
        salutation: json['salutation'] as String?,
        secretAnswer: json['secret_answer'] as String?,
        secretQuestion: json['secret_question'] as String?,
        setSettings:
            json['set_settings'] == null ? null : json['set_settings'] == 1,
        taxIdentificationNumber: json['tax_identification_number'] as String?,
        taxResidence: json['tax_residence'] as String?,
        tinSkipped:
            json['tin_skipped'] == null ? null : json['tin_skipped'] == 1,
        tradingHub:
            json['trading_hub'] == null ? null : json['trading_hub'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Purpose and reason for requesting the account opening. Only applicable for real money account. Required for clients that have not set it yet. Can only be set once.
  final String? accountOpeningReason;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account.
  final String? addressCity;

  /// [Optional] Note: not applicable for virtual account. Required field for real money account.
  final String? addressLine1;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String? addressLine2;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String? addressPostcode;

  /// [Optional] Note: not applicable for virtual account. Optional field for real money account.
  final String? addressState;

  /// [Optional] Boolean value `true` or `false`, indicating permission to allow others to follow your trades. Note: not applicable for Virtual account. Only allow for real money account.
  final bool? allowCopiers;

  /// [Optional] Country of legal citizenship, 2-letter country code.
  final String? citizen;

  /// [Optional] Date of birth format: yyyy-mm-dd (can only be changed on unauthenticated svg accounts).
  final String? dateOfBirth;

  /// Boolean value `true` or `false`, indicating if user email belong to dxtrade exception list.
  final bool? dxtradeUserException;

  /// [Optional] Boolean value `true` or `false`, indicating permission to use email address for any contact which may include marketing
  final bool? emailConsent;

  /// [Optional] Employment Status.
  final String? employmentStatus;

  /// [Optional] Enable or disable one or multiple features.
  final Map<String, dynamic>? featureFlag;

  /// [Optional] Within 1-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes (can only be changed on unauthenticated svg accounts).
  final String? firstName;

  /// [Optional] Within 1-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes (can only be changed on unauthenticated svg accounts).
  final String? lastName;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates). Effective for real accounts only.
  final int? nonPepDeclaration;

  /// [Optional] Note: not applicable for virtual account. Starting with `+` followed by 9-35 digits, hyphens or space.
  final String? phone;

  /// [Optional] Place of birth, 2-letter country code.
  final String? placeOfBirth;

  /// [Optional] User's preferred language, ISO standard language code
  final String? preferredLanguage;

  /// [Optional] Required when client wants to be treated as professional. Applicable for financial accounts only.
  final int? requestProfessionalStatus;

  /// [Optional] 2-letter country code. Note: not applicable for real money account. Only allow for Virtual account without residence set.
  final String? residence;

  /// [Optional] Accept any value in enum list (can only be changed on unauthenticated svg accounts).
  final String? salutation;

  /// [Optional] Answer to secret question, within 4-50 characters. Required for new account and existing client details will be used if client opens another account.
  final String? secretAnswer;

  /// [Optional] Accept any value in enum list. Required for new account and existing client details will be used if client opens another account.
  final String? secretQuestion;

  /// Must be `true`
  final bool? setSettings;

  /// [Optional] Tax identification number. Only applicable for real money account. Required for maltainvest landing company.
  final String? taxIdentificationNumber;

  /// [Optional] Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for maltainvest landing company.
  final String? taxResidence;

  /// [Optional] Whether the client has skipped the TIN form. Only applicable for real money account.
  final bool? tinSkipped;

  /// [Optional] Enable/Disable Trading Hub dashboard
  final bool? tradingHub;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_opening_reason': accountOpeningReason,
        'address_city': addressCity,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'allow_copiers': allowCopiers == null
            ? null
            : allowCopiers!
                ? 1
                : 0,
        'citizen': citizen,
        'date_of_birth': dateOfBirth,
        'dxtrade_user_exception': dxtradeUserException == null
            ? null
            : dxtradeUserException!
                ? 1
                : 0,
        'email_consent': emailConsent == null
            ? null
            : emailConsent!
                ? 1
                : 0,
        'employment_status': employmentStatus,
        'feature_flag': featureFlag,
        'first_name': firstName,
        'last_name': lastName,
        'loginid': loginid,
        'non_pep_declaration': nonPepDeclaration,
        'phone': phone,
        'place_of_birth': placeOfBirth,
        'preferred_language': preferredLanguage,
        'request_professional_status': requestProfessionalStatus,
        'residence': residence,
        'salutation': salutation,
        'secret_answer': secretAnswer,
        'secret_question': secretQuestion,
        'set_settings': setSettings == null
            ? null
            : setSettings!
                ? 1
                : 0,
        'tax_identification_number': taxIdentificationNumber,
        'tax_residence': taxResidence,
        'tin_skipped': tinSkipped == null
            ? null
            : tinSkipped!
                ? 1
                : 0,
        'trading_hub': tradingHub == null
            ? null
            : tradingHub!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetSettingsRequest copyWith({
    String? accountOpeningReason,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    bool? allowCopiers,
    String? citizen,
    String? dateOfBirth,
    bool? dxtradeUserException,
    bool? emailConsent,
    String? employmentStatus,
    Map<String, dynamic>? featureFlag,
    String? firstName,
    String? lastName,
    String? loginid,
    int? nonPepDeclaration,
    String? phone,
    String? placeOfBirth,
    String? preferredLanguage,
    int? requestProfessionalStatus,
    String? residence,
    String? salutation,
    String? secretAnswer,
    String? secretQuestion,
    bool? setSettings,
    String? taxIdentificationNumber,
    String? taxResidence,
    bool? tinSkipped,
    bool? tradingHub,
    Map<String, dynamic>? passthrough,
    int? reqId,
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
        dxtradeUserException: dxtradeUserException ?? this.dxtradeUserException,
        emailConsent: emailConsent ?? this.emailConsent,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        featureFlag: featureFlag ?? this.featureFlag,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        loginid: loginid ?? this.loginid,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        preferredLanguage: preferredLanguage ?? this.preferredLanguage,
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
        tinSkipped: tinSkipped ?? this.tinSkipped,
        tradingHub: tradingHub ?? this.tradingHub,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
