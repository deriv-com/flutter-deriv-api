/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_real_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// New account real request class.
class NewAccountRealRequest extends Request {
  /// Initialize NewAccountRealRequest.
  const NewAccountRealRequest({
    this.accountOpeningReason,
    this.accountTurnover,
    this.addressCity,
    required this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.affiliateToken,
    this.citizen,
    this.clientType,
    this.currency,
    required this.dateOfBirth,
    required this.firstName,
    required this.lastName,
    this.newAccountReal = true,
    this.nonPepDeclaration,
    this.phone,
    this.placeOfBirth,
    required this.residence,
    this.salutation,
    this.secretAnswer,
    this.secretQuestion,
    this.taxIdentificationNumber,
    this.taxResidence,
    super.msgType = 'new_account_real',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory NewAccountRealRequest.fromJson(Map<String, dynamic> json) =>
      NewAccountRealRequest(
        accountOpeningReason: json['account_opening_reason'] as String?,
        accountTurnover: json['account_turnover'] as String?,
        addressCity: json['address_city'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        affiliateToken: json['affiliate_token'] as String?,
        citizen: json['citizen'] as String?,
        clientType: json['client_type'] as String?,
        currency: json['currency'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        newAccountReal: json['new_account_real'] == null
            ? null
            : json['new_account_real'] == 1,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        phone: json['phone'] as String?,
        placeOfBirth: json['place_of_birth'] as String?,
        residence: json['residence'] as String?,
        salutation: json['salutation'] as String?,
        secretAnswer: json['secret_answer'] as String?,
        secretQuestion: json['secret_question'] as String?,
        taxIdentificationNumber: json['tax_identification_number'] as String?,
        taxResidence: json['tax_residence'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Purpose and reason for requesting the account opening.
  final String? accountOpeningReason;

  /// [Optional] The anticipated account turnover.
  final String? accountTurnover;

  /// [Optional] Within 100 characters.
  final String? addressCity;

  /// Within 70 characters, with no leading whitespaces and may contain letters/numbers and/or any of following characters '.,:;()@#/-
  final String? addressLine1;

  /// [Optional] Within 70 characters.
  final String? addressLine2;

  /// [Optional] Within 20 characters and may not contain '+'.
  final String? addressPostcode;

  /// [Optional] Possible value receive from `states_list` call.
  final String? addressState;

  /// [Optional] Affiliate token, within 32 characters.
  final String? affiliateToken;

  /// [Optional] Country of legal citizenship, 2-letter country code.
  final String? citizen;

  /// [Optional] Indicates whether this is for a client requesting an account with professional status.
  final String? clientType;

  /// [Optional] To set currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String? currency;

  /// Date of birth format: `yyyy-mm-dd`.
  final String? dateOfBirth;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? firstName;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? lastName;

  /// Must be `true`
  final bool? newAccountReal;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates).
  final int? nonPepDeclaration;

  /// [Optional] Starting with `+` followed by 9-35 digits, hyphens or space.
  final String? phone;

  /// [Optional] Place of birth, 2-letter country code.
  final String? placeOfBirth;

  /// 2-letter country code, possible value receive from `residence_list` call.
  final String? residence;

  /// [Optional] Accept any value in enum list.
  final String? salutation;

  /// [Optional] Answer to secret question, within 4-50 characters. Required for new account and existing client details will be used if client open another account.
  final String? secretAnswer;

  /// [Optional] Accept any value in enum list. Required for new account and existing client details will be used if client open another account.
  final String? secretQuestion;

  /// [Optional] Tax identification number. Only applicable for real money account. Required for `maltainvest` landing company.
  final String? taxIdentificationNumber;

  /// [Optional] Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for `maltainvest` landing company.
  final String? taxResidence;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_opening_reason': accountOpeningReason,
        'account_turnover': accountTurnover,
        'address_city': addressCity,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'affiliate_token': affiliateToken,
        'citizen': citizen,
        'client_type': clientType,
        'currency': currency,
        'date_of_birth': dateOfBirth,
        'first_name': firstName,
        'last_name': lastName,
        'new_account_real': newAccountReal == null
            ? null
            : newAccountReal!
                ? 1
                : 0,
        'non_pep_declaration': nonPepDeclaration,
        'phone': phone,
        'place_of_birth': placeOfBirth,
        'residence': residence,
        'salutation': salutation,
        'secret_answer': secretAnswer,
        'secret_question': secretQuestion,
        'tax_identification_number': taxIdentificationNumber,
        'tax_residence': taxResidence,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountRealRequest copyWith({
    String? accountOpeningReason,
    String? accountTurnover,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? affiliateToken,
    String? citizen,
    String? clientType,
    String? currency,
    String? dateOfBirth,
    String? firstName,
    String? lastName,
    bool? newAccountReal,
    int? nonPepDeclaration,
    String? phone,
    String? placeOfBirth,
    String? residence,
    String? salutation,
    String? secretAnswer,
    String? secretQuestion,
    String? taxIdentificationNumber,
    String? taxResidence,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      NewAccountRealRequest(
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        accountTurnover: accountTurnover ?? this.accountTurnover,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        affiliateToken: affiliateToken ?? this.affiliateToken,
        citizen: citizen ?? this.citizen,
        clientType: clientType ?? this.clientType,
        currency: currency ?? this.currency,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        newAccountReal: newAccountReal ?? this.newAccountReal,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        residence: residence ?? this.residence,
        salutation: salutation ?? this.salutation,
        secretAnswer: secretAnswer ?? this.secretAnswer,
        secretQuestion: secretQuestion ?? this.secretQuestion,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
