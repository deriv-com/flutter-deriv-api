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
    required this.cfdExperience,
    required this.cfdFrequency,
    required this.cfdTradingDefinition,
    this.citizen,
    this.clientType,
    this.currency,
    required this.dateOfBirth,
    required this.educationLevel,
    required this.employmentIndustry,
    required this.employmentStatus,
    required this.estimatedWorth,
    required this.firstName,
    required this.incomeSource,
    required this.lastName,
    required this.leverageImpactTrading,
    required this.leverageTradingHighRiskStopLoss,
    this.loginid,
    required this.netIncome,
    this.newAccountMaltainvest = true,
    this.nonPepDeclaration,
    required this.occupation,
    this.phone,
    this.placeOfBirth,
    required this.requiredInitialMargin,
    required this.residence,
    required this.riskTolerance,
    required this.salutation,
    this.secretAnswer,
    this.secretQuestion,
    required this.sourceOfExperience,
    this.sourceOfWealth,
    required this.taxIdentificationNumber,
    required this.taxResidence,
    required this.tradingExperienceFinancialInstruments,
    required this.tradingFrequencyFinancialInstruments,
    super.msgType = 'new_account_maltainvest',
    super.passthrough,
    super.reqId,
  });

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
        cfdExperience: json['cfd_experience'] as String?,
        cfdFrequency: json['cfd_frequency'] as String?,
        cfdTradingDefinition: json['cfd_trading_definition'] as String?,
        citizen: json['citizen'] as String?,
        clientType: json['client_type'] as String?,
        currency: json['currency'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        educationLevel: json['education_level'] as String?,
        employmentIndustry: json['employment_industry'] as String?,
        employmentStatus: json['employment_status'] as String?,
        estimatedWorth: json['estimated_worth'] as String?,
        firstName: json['first_name'] as String?,
        incomeSource: json['income_source'] as String?,
        lastName: json['last_name'] as String?,
        leverageImpactTrading: json['leverage_impact_trading'] as String?,
        leverageTradingHighRiskStopLoss:
            json['leverage_trading_high_risk_stop_loss'] as String?,
        loginid: json['loginid'] as String?,
        netIncome: json['net_income'] as String?,
        newAccountMaltainvest: json['new_account_maltainvest'] == null
            ? null
            : json['new_account_maltainvest'] == 1,
        nonPepDeclaration: json['non_pep_declaration'] as int?,
        occupation: json['occupation'] as String?,
        phone: json['phone'] as String?,
        placeOfBirth: json['place_of_birth'] as String?,
        requiredInitialMargin: json['required_initial_margin'] as String?,
        residence: json['residence'] as String?,
        riskTolerance: json['risk_tolerance'] as String?,
        salutation: json['salutation'] as String?,
        secretAnswer: json['secret_answer'] as String?,
        secretQuestion: json['secret_question'] as String?,
        sourceOfExperience: json['source_of_experience'] as String?,
        sourceOfWealth: json['source_of_wealth'] as String?,
        taxIdentificationNumber: json['tax_identification_number'] as String?,
        taxResidence: json['tax_residence'] as String?,
        tradingExperienceFinancialInstruments:
            json['trading_experience_financial_instruments'] as String?,
        tradingFrequencyFinancialInstruments:
            json['trading_frequency_financial_instruments'] as String?,
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

  /// How much experience do you have in CFD trading?
  final String? cfdExperience;

  /// How many CFD trades have you placed in the past 12 months?
  final String? cfdFrequency;

  /// In your understanding, CFD trading allows you to:
  final String? cfdTradingDefinition;

  /// [Optional] Country of legal citizenship, 2-letter country code. Possible value receive from `residence_list` call.
  final String? citizen;

  /// [Optional] Indicates whether this is for a client requesting an account with professional status.
  final String? clientType;

  /// [Optional] To set currency of the account. List of supported currencies can be acquired with `payout_currencies` call.
  final String? currency;

  /// Date of birth format: yyyy-mm-dd.
  final String? dateOfBirth;

  /// Level of Education
  final String? educationLevel;

  /// Industry of Employment.
  final String? employmentIndustry;

  /// Employment Status.
  final String? employmentStatus;

  /// Estimated Net Worth.
  final String? estimatedWorth;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? firstName;

  /// Income Source.
  final String? incomeSource;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String? lastName;

  /// How does leverage affect CFD trading?
  final String? leverageImpactTrading;

  /// Leverage trading is high-risk, so it's a good idea to use risk management features such as stop loss. Stop loss allows you to
  final String? leverageTradingHighRiskStopLoss;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Net Annual Income.
  final String? netIncome;

  /// Must be `true`
  final bool? newAccountMaltainvest;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA.
  final int? nonPepDeclaration;

  /// Occupation.
  final String? occupation;

  /// [Optional] Starting with `+` followed by 9-35 digits, hyphens or space.
  final String? phone;

  /// [Optional] Place of birth, 2-letter country code.
  final String? placeOfBirth;

  /// When would you be required to pay an initial margin?
  final String? requiredInitialMargin;

  /// 2-letter country code, possible value receive from `residence_list` call.
  final String? residence;

  /// Do you understand that you could potentially lose 100% of the money you use to trade?
  final String? riskTolerance;

  /// Accept any value in enum list.
  final String? salutation;

  /// [Optional] Answer to secret question, within 4-50 characters.
  final String? secretAnswer;

  /// [Optional] Accept any value in enum list.
  final String? secretQuestion;

  /// How much knowledge and experience do you have in relation to online trading?
  final String? sourceOfExperience;

  /// [Optional] Source of wealth.
  final String? sourceOfWealth;

  /// Tax identification number. Only applicable for real money account. Required for `maltainvest` landing company.
  final String? taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for `maltainvest` landing company.
  final String? taxResidence;

  /// How much experience do you have with other financial instruments?
  final String? tradingExperienceFinancialInstruments;

  /// How many trades have you placed with other financial instruments in the past 12 months?
  final String? tradingFrequencyFinancialInstruments;

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
        'cfd_experience': cfdExperience,
        'cfd_frequency': cfdFrequency,
        'cfd_trading_definition': cfdTradingDefinition,
        'citizen': citizen,
        'client_type': clientType,
        'currency': currency,
        'date_of_birth': dateOfBirth,
        'education_level': educationLevel,
        'employment_industry': employmentIndustry,
        'employment_status': employmentStatus,
        'estimated_worth': estimatedWorth,
        'first_name': firstName,
        'income_source': incomeSource,
        'last_name': lastName,
        'leverage_impact_trading': leverageImpactTrading,
        'leverage_trading_high_risk_stop_loss': leverageTradingHighRiskStopLoss,
        'loginid': loginid,
        'net_income': netIncome,
        'new_account_maltainvest': newAccountMaltainvest == null
            ? null
            : newAccountMaltainvest!
                ? 1
                : 0,
        'non_pep_declaration': nonPepDeclaration,
        'occupation': occupation,
        'phone': phone,
        'place_of_birth': placeOfBirth,
        'required_initial_margin': requiredInitialMargin,
        'residence': residence,
        'risk_tolerance': riskTolerance,
        'salutation': salutation,
        'secret_answer': secretAnswer,
        'secret_question': secretQuestion,
        'source_of_experience': sourceOfExperience,
        'source_of_wealth': sourceOfWealth,
        'tax_identification_number': taxIdentificationNumber,
        'tax_residence': taxResidence,
        'trading_experience_financial_instruments':
            tradingExperienceFinancialInstruments,
        'trading_frequency_financial_instruments':
            tradingFrequencyFinancialInstruments,
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
    String? cfdExperience,
    String? cfdFrequency,
    String? cfdTradingDefinition,
    String? citizen,
    String? clientType,
    String? currency,
    String? dateOfBirth,
    String? educationLevel,
    String? employmentIndustry,
    String? employmentStatus,
    String? estimatedWorth,
    String? firstName,
    String? incomeSource,
    String? lastName,
    String? leverageImpactTrading,
    String? leverageTradingHighRiskStopLoss,
    String? loginid,
    String? netIncome,
    bool? newAccountMaltainvest,
    int? nonPepDeclaration,
    String? occupation,
    String? phone,
    String? placeOfBirth,
    String? requiredInitialMargin,
    String? residence,
    String? riskTolerance,
    String? salutation,
    String? secretAnswer,
    String? secretQuestion,
    String? sourceOfExperience,
    String? sourceOfWealth,
    String? taxIdentificationNumber,
    String? taxResidence,
    String? tradingExperienceFinancialInstruments,
    String? tradingFrequencyFinancialInstruments,
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
        cfdExperience: cfdExperience ?? this.cfdExperience,
        cfdFrequency: cfdFrequency ?? this.cfdFrequency,
        cfdTradingDefinition: cfdTradingDefinition ?? this.cfdTradingDefinition,
        citizen: citizen ?? this.citizen,
        clientType: clientType ?? this.clientType,
        currency: currency ?? this.currency,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        educationLevel: educationLevel ?? this.educationLevel,
        employmentIndustry: employmentIndustry ?? this.employmentIndustry,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        estimatedWorth: estimatedWorth ?? this.estimatedWorth,
        firstName: firstName ?? this.firstName,
        incomeSource: incomeSource ?? this.incomeSource,
        lastName: lastName ?? this.lastName,
        leverageImpactTrading:
            leverageImpactTrading ?? this.leverageImpactTrading,
        leverageTradingHighRiskStopLoss: leverageTradingHighRiskStopLoss ??
            this.leverageTradingHighRiskStopLoss,
        loginid: loginid ?? this.loginid,
        netIncome: netIncome ?? this.netIncome,
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
        nonPepDeclaration: nonPepDeclaration ?? this.nonPepDeclaration,
        occupation: occupation ?? this.occupation,
        phone: phone ?? this.phone,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        requiredInitialMargin:
            requiredInitialMargin ?? this.requiredInitialMargin,
        residence: residence ?? this.residence,
        riskTolerance: riskTolerance ?? this.riskTolerance,
        salutation: salutation ?? this.salutation,
        secretAnswer: secretAnswer ?? this.secretAnswer,
        secretQuestion: secretQuestion ?? this.secretQuestion,
        sourceOfExperience: sourceOfExperience ?? this.sourceOfExperience,
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
        taxIdentificationNumber:
            taxIdentificationNumber ?? this.taxIdentificationNumber,
        taxResidence: taxResidence ?? this.taxResidence,
        tradingExperienceFinancialInstruments:
            tradingExperienceFinancialInstruments ??
                this.tradingExperienceFinancialInstruments,
        tradingFrequencyFinancialInstruments:
            tradingFrequencyFinancialInstruments ??
                this.tradingFrequencyFinancialInstruments,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
