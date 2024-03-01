/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_wallet_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// New account wallet request class.
class NewAccountWalletRequest extends Request {
  /// Initialize NewAccountWalletRequest.
  const NewAccountWalletRequest({
    required this.acceptRisk,
    this.accountOpeningReason,
    required this.accountType,
    this.addressCity,
    this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.citizen,
    this.clientType,
    required this.currency,
    this.dateOfBirth,
    this.fatcaDeclaration,
    required this.financialAssessment,
    this.firstName,
    this.landingCompanyShort,
    this.lastName,
    this.loginid,
    this.newAccountWallet = true,
    this.nonPepDeclaration,
    this.phone,
    required this.salutation,
    required this.taxIdentificationNumber,
    required this.taxResidence,
    super.msgType = 'new_account_wallet',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory NewAccountWalletRequest.fromJson(Map<String, dynamic> json) =>
      NewAccountWalletRequest(
        acceptRisk:
            json['accept_risk'] == null ? null : json['accept_risk'] == 1,
        accountOpeningReason: json['account_opening_reason'] as String?,
        accountType: json['account_type'] as String?,
        addressCity: json['address_city'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        citizen: json['citizen'] as String?,
        clientType: json['client_type'] as String?,
        currency: json['currency'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        fatcaDeclaration: json['fatca_declaration'] == null
            ? null
            : json['fatca_declaration'] == 1,
        financialAssessment:
            json['financial_assessment'] as Map<String, dynamic>?,
        firstName: json['first_name'] as String?,
        landingCompanyShort: json['landing_company_short'] as String?,
        lastName: json['last_name'] as String?,
        loginid: json['loginid'] as String?,
        newAccountWallet: json['new_account_wallet'] == null
            ? null
            : json['new_account_wallet'] == 1,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        phone: json['phone'] as String?,
        salutation: json['salutation'] as String?,
        taxIdentificationNumber: json['tax_identification_number'] as String?,
        taxResidence: json['tax_residence'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Show whether client has accepted risk disclaimer.
  final bool? acceptRisk;

  /// [Optional] Purpose and reason for requesting the account opening.
  final String? accountOpeningReason;

  /// To set the wallets type - only doughflow and crptyo wallets are allowed for initial phase, other types will be added later
  final String? accountType;

  /// [Optional] Within 35 characters.
  final String? addressCity;

  /// [Optional] Mailing address.
  final String? addressLine1;

  /// [Optional] Within 70 characters.
  final String? addressLine2;

  /// [Optional] Within 20 characters and may not contain '+'.
  final String? addressPostcode;

  /// [Optional] Possible value receive from `states_list` call.
  final String? addressState;

  /// [Optional] Country of legal citizenship, 2-letter country code. Possible value receive from `residence_list` call.
  final String? citizen;

  /// [Optional] Indicates whether this is for a client requesting an account with professional status.
  final String? clientType;

  /// To set currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String? currency;

  /// [Optional] Date of birth format: `yyyy-mm-dd`.
  final String? dateOfBirth;

  /// [Optional] Indicates client's self-declaration of FATCA.
  final bool? fatcaDeclaration;

  /// Required for maltainvest
  final Map<String, dynamic>? financialAssessment;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? firstName;

  /// [Optional] Set the landing company of the wallet. Default value is 'svg' if company not provided
  final String? landingCompanyShort;

  /// [Optional] Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? lastName;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? newAccountWallet;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA (Politically Exposed Person/Relatives and Close Associates).
  final int? nonPepDeclaration;

  /// [Optional] Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String? phone;

  /// Accept any value in enum list.
  final String? salutation;

  /// Tax identification number. Only applicable for real money account. Required for `maltainvest` landing company.
  final String? taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for `maltainvest` landing company.
  final String? taxResidence;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'accept_risk': acceptRisk == null
            ? null
            : acceptRisk!
                ? 1
                : 0,
        'account_opening_reason': accountOpeningReason,
        'account_type': accountType,
        'address_city': addressCity,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'citizen': citizen,
        'client_type': clientType,
        'currency': currency,
        'date_of_birth': dateOfBirth,
        'fatca_declaration': fatcaDeclaration == null
            ? null
            : fatcaDeclaration!
                ? 1
                : 0,
        'financial_assessment': financialAssessment,
        'first_name': firstName,
        'landing_company_short': landingCompanyShort,
        'last_name': lastName,
        'loginid': loginid,
        'new_account_wallet': newAccountWallet == null
            ? null
            : newAccountWallet!
                ? 1
                : 0,
        'non_pep_declaration': nonPepDeclaration,
        'phone': phone,
        'salutation': salutation,
        'tax_identification_number': taxIdentificationNumber,
        'tax_residence': taxResidence,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountWalletRequest copyWith({
    bool? acceptRisk,
    String? accountOpeningReason,
    String? accountType,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? citizen,
    String? clientType,
    String? currency,
    String? dateOfBirth,
    bool? fatcaDeclaration,
    Map<String, dynamic>? financialAssessment,
    String? firstName,
    String? landingCompanyShort,
    String? lastName,
    String? loginid,
    bool? newAccountWallet,
    int? nonPepDeclaration,
    String? phone,
    String? salutation,
    String? taxIdentificationNumber,
    String? taxResidence,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      NewAccountWalletRequest(
        acceptRisk: acceptRisk ?? this.acceptRisk,
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        accountType: accountType ?? this.accountType,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        citizen: citizen ?? this.citizen,
        clientType: clientType ?? this.clientType,
        currency: currency ?? this.currency,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        fatcaDeclaration: fatcaDeclaration ?? this.fatcaDeclaration,
        financialAssessment: financialAssessment ?? this.financialAssessment,
        firstName: firstName ?? this.firstName,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        lastName: lastName ?? this.lastName,
        loginid: loginid ?? this.loginid,
        newAccountWallet: newAccountWallet ?? this.newAccountWallet,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        phone: phone ?? this.phone,
        salutation: salutation ?? this.salutation,
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
