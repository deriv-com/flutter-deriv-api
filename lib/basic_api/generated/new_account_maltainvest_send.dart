/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_maltainvest_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// New account maltainvest request class.
class NewAccountMaltainvestRequest extends Request {
  /// Initialize NewAccountMaltainvestRequest.
  const NewAccountMaltainvestRequest({
    required this.acceptRisk,
    this.accountOpeningReason,
    this.accountTurnover,
    required this.addressCity,
    required this.addressLine1,
    this.addressLine2,
    this.addressPostcode,
    this.addressState,
    this.affiliateToken,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdTradingExperience,
    this.cfdTradingFrequency,
    this.citizen,
    this.clientType,
    required this.dateOfBirth,
    required this.educationLevel,
    required this.employmentIndustry,
    this.employmentStatus,
    required this.estimatedWorth,
    required this.firstName,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    required this.incomeSource,
    required this.lastName,
    required this.netIncome,
    this.newAccountMaltainvest = true,
    this.nonPepDeclaration,
    required this.occupation,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.phone,
    this.placeOfBirth,
    required this.residence,
    required this.salutation,
    this.secretAnswer,
    this.secretQuestion,
    this.sourceOfWealth,
    required this.taxIdentificationNumber,
    required this.taxResidence,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'new_account_maltainvest',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory NewAccountMaltainvestRequest.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvestRequest(
        acceptRisk:
            json['accept_risk'] == null ? null : json['accept_risk'] == 1,
        accountOpeningReason: json['account_opening_reason'] as String?,
        accountTurnover: json['account_turnover'] as String?,
        addressCity: json['address_city'] as String?,
        addressLine1: json['address_line_1'] as String?,
        addressLine2: json['address_line_2'] as String?,
        addressPostcode: json['address_postcode'] as String?,
        addressState: json['address_state'] as String?,
        affiliateToken: json['affiliate_token'] as String?,
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'] as String?,
        binaryOptionsTradingFrequency:
            json['binary_options_trading_frequency'] as String?,
        cfdTradingExperience: json['cfd_trading_experience'] as String?,
        cfdTradingFrequency: json['cfd_trading_frequency'] as String?,
        citizen: json['citizen'] as String?,
        clientType: json['client_type'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        educationLevel: json['education_level'] as String?,
        employmentIndustry: json['employment_industry'] as String?,
        employmentStatus: json['employment_status'] as String?,
        estimatedWorth: json['estimated_worth'] as String?,
        firstName: json['first_name'] as String?,
        forexTradingExperience: json['forex_trading_experience'] as String?,
        forexTradingFrequency: json['forex_trading_frequency'] as String?,
        incomeSource: json['income_source'] as String?,
        lastName: json['last_name'] as String?,
        netIncome: json['net_income'] as String?,
        newAccountMaltainvest: json['new_account_maltainvest'] == null
            ? null
            : json['new_account_maltainvest'] == 1,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        occupation: json['occupation'] as String?,
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'] as String?,
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'] as String?,
        phone: json['phone'] as String?,
        placeOfBirth: json['place_of_birth'] as String?,
        residence: json['residence'] as String?,
        salutation: json['salutation'] as String?,
        secretAnswer: json['secret_answer'] as String?,
        secretQuestion: json['secret_question'] as String?,
        sourceOfWealth: json['source_of_wealth'] as String?,
        taxIdentificationNumber: json['tax_identification_number'] as String?,
        taxResidence: json['tax_residence'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Show whether client has accepted risk disclaimer.
  final bool? acceptRisk;

  /// [Optional] Purpose and reason for requesting the account opening.
  final String? accountOpeningReason;

  /// [Optional] The anticipated account turnover.
  final String? accountTurnover;

  /// Within 100 characters
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

  /// [Optional] Binary options trading experience.
  final String? binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  final String? binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  final String? cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  final String? cfdTradingFrequency;

  /// [Optional] Country of legal citizenship, 2-letter country code. Possible value receive from `residence_list` call.
  final String? citizen;

  /// [Optional] Indicates whether this is for a client requesting an account with professional status.
  final String? clientType;

  /// Date of birth format: yyyy-mm-dd.
  final String? dateOfBirth;

  /// Level of Education
  final String? educationLevel;

  /// Industry of Employment.
  final String? employmentIndustry;

  /// [Optional] Employment Status.
  final String? employmentStatus;

  /// Estimated Net Worth.
  final String? estimatedWorth;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? firstName;

  /// [Optional] Forex trading experience.
  final String? forexTradingExperience;

  /// [Optional] Forex trading frequency.
  final String? forexTradingFrequency;

  /// Income Source.
  final String? incomeSource;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? lastName;

  /// Net Annual Income.
  final String? netIncome;

  /// Must be `true`
  final bool? newAccountMaltainvest;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA.
  final int? nonPepDeclaration;

  /// Occupation.
  final String? occupation;

  /// [Optional] Trading experience in other financial instruments.
  final String? otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  final String? otherInstrumentsTradingFrequency;

  /// [Optional] Starting with `+` followed by 9-35 digits, hyphens or space.
  final String? phone;

  /// [Optional] Place of birth, 2-letter country code.
  final String? placeOfBirth;

  /// 2-letter country code, possible value receive from `residence_list` call.
  final String? residence;

  /// Accept any value in enum list.
  final String? salutation;

  /// [Optional] Answer to secret question, within 4-50 characters.
  final String? secretAnswer;

  /// [Optional] Accept any value in enum list.
  final String? secretQuestion;

  /// [Optional] Source of wealth.
  final String? sourceOfWealth;

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
        'account_turnover': accountTurnover,
        'address_city': addressCity,
        'address_line_1': addressLine1,
        'address_line_2': addressLine2,
        'address_postcode': addressPostcode,
        'address_state': addressState,
        'affiliate_token': affiliateToken,
        'binary_options_trading_experience': binaryOptionsTradingExperience,
        'binary_options_trading_frequency': binaryOptionsTradingFrequency,
        'cfd_trading_experience': cfdTradingExperience,
        'cfd_trading_frequency': cfdTradingFrequency,
        'citizen': citizen,
        'client_type': clientType,
        'date_of_birth': dateOfBirth,
        'education_level': educationLevel,
        'employment_industry': employmentIndustry,
        'employment_status': employmentStatus,
        'estimated_worth': estimatedWorth,
        'first_name': firstName,
        'forex_trading_experience': forexTradingExperience,
        'forex_trading_frequency': forexTradingFrequency,
        'income_source': incomeSource,
        'last_name': lastName,
        'net_income': netIncome,
        'new_account_maltainvest': newAccountMaltainvest == null
            ? null
            : newAccountMaltainvest!
                ? 1
                : 0,
        'non_pep_declaration': nonPepDeclaration,
        'occupation': occupation,
        'other_instruments_trading_experience':
            otherInstrumentsTradingExperience,
        'other_instruments_trading_frequency': otherInstrumentsTradingFrequency,
        'phone': phone,
        'place_of_birth': placeOfBirth,
        'residence': residence,
        'salutation': salutation,
        'secret_answer': secretAnswer,
        'secret_question': secretQuestion,
        'source_of_wealth': sourceOfWealth,
        'tax_identification_number': taxIdentificationNumber,
        'tax_residence': taxResidence,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountMaltainvestRequest copyWith({
    bool? acceptRisk,
    String? accountOpeningReason,
    String? accountTurnover,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressPostcode,
    String? addressState,
    String? affiliateToken,
    String? binaryOptionsTradingExperience,
    String? binaryOptionsTradingFrequency,
    String? cfdTradingExperience,
    String? cfdTradingFrequency,
    String? citizen,
    String? clientType,
    String? dateOfBirth,
    String? educationLevel,
    String? employmentIndustry,
    String? employmentStatus,
    String? estimatedWorth,
    String? firstName,
    String? forexTradingExperience,
    String? forexTradingFrequency,
    String? incomeSource,
    String? lastName,
    String? netIncome,
    bool? newAccountMaltainvest,
    int? nonPepDeclaration,
    String? occupation,
    String? otherInstrumentsTradingExperience,
    String? otherInstrumentsTradingFrequency,
    String? phone,
    String? placeOfBirth,
    String? residence,
    String? salutation,
    String? secretAnswer,
    String? secretQuestion,
    String? sourceOfWealth,
    String? taxIdentificationNumber,
    String? taxResidence,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      NewAccountMaltainvestRequest(
        acceptRisk: acceptRisk ?? this.acceptRisk,
        accountOpeningReason: accountOpeningReason ?? this.accountOpeningReason,
        accountTurnover: accountTurnover ?? this.accountTurnover,
        addressCity: addressCity ?? this.addressCity,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        addressPostcode: addressPostcode ?? this.addressPostcode,
        addressState: addressState ?? this.addressState,
        affiliateToken: affiliateToken ?? this.affiliateToken,
        binaryOptionsTradingExperience: binaryOptionsTradingExperience ??
            this.binaryOptionsTradingExperience,
        binaryOptionsTradingFrequency:
            binaryOptionsTradingFrequency ?? this.binaryOptionsTradingFrequency,
        cfdTradingExperience: cfdTradingExperience ?? this.cfdTradingExperience,
        cfdTradingFrequency: cfdTradingFrequency ?? this.cfdTradingFrequency,
        citizen: citizen ?? this.citizen,
        clientType: clientType ?? this.clientType,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        educationLevel: educationLevel ?? this.educationLevel,
        employmentIndustry: employmentIndustry ?? this.employmentIndustry,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        estimatedWorth: estimatedWorth ?? this.estimatedWorth,
        firstName: firstName ?? this.firstName,
        forexTradingExperience:
            forexTradingExperience ?? this.forexTradingExperience,
        forexTradingFrequency:
            forexTradingFrequency ?? this.forexTradingFrequency,
        incomeSource: incomeSource ?? this.incomeSource,
        lastName: lastName ?? this.lastName,
        netIncome: netIncome ?? this.netIncome,
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        occupation: occupation ?? this.occupation,
        otherInstrumentsTradingExperience: otherInstrumentsTradingExperience ??
            this.otherInstrumentsTradingExperience,
        otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency ??
            this.otherInstrumentsTradingFrequency,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        residence: residence ?? this.residence,
        salutation: salutation ?? this.salutation,
        secretAnswer: secretAnswer ?? this.secretAnswer,
        secretQuestion: secretQuestion ?? this.secretQuestion,
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
