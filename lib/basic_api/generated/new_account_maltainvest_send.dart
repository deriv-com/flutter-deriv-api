/// generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_maltainvest_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'new_account_maltainvest_send.g.dart';

/// JSON conversion for 'new_account_maltainvest_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountMaltainvestRequest extends Request {
  /// Initialize NewAccountMaltainvestRequest
  const NewAccountMaltainvestRequest({
    this.acceptRisk,
    this.accountOpeningReason,
    this.accountTurnover,
    this.addressCity,
    this.addressLine1,
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
    this.dateOfBirth,
    this.educationLevel,
    this.employmentIndustry,
    this.employmentStatus,
    this.estimatedWorth,
    this.firstName,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    this.incomeSource,
    this.lastName,
    this.netIncome,
    this.newAccountMaltainvest = 1,
    this.nonPepDeclaration,
    this.occupation,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.phone,
    this.placeOfBirth,
    this.residence,
    this.salutation,
    this.secretAnswer,
    this.secretQuestion,
    this.sourceOfWealth,
    this.taxIdentificationNumber,
    this.taxResidence,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'new_account_maltainvest',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory NewAccountMaltainvestRequest.fromJson(Map<String, dynamic> json) =>
      _$NewAccountMaltainvestRequestFromJson(json);

  // Properties
  /// Show whether client has accepted risk disclaimer.
  final int acceptRisk;

  /// [Optional] Purpose and reason for requesting the account opening.
  final String accountOpeningReason;

  /// [Optional] The anticipated account turnover.
  final String accountTurnover;

  /// Within 35 characters
  final String addressCity;

  /// Within 70 characters.
  final String addressLine1;

  /// [Optional] Within 70 characters.
  final String addressLine2;

  /// [Optional] Within 20 characters and may not contain '+'.
  final String addressPostcode;

  /// [Optional] Possible value receive from `states_list` call.
  final String addressState;

  /// [Optional] Affiliate token, within 32 characters.
  final String affiliateToken;

  /// [Optional] Binary options trading experience.
  final String binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  final String binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  final String cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  final String cfdTradingFrequency;

  /// [Optional] Country of legal citizenship, 2-letter country code. Possible value receive from `residence_list` call.
  final String citizen;

  /// [Optional] Indicates whether this is for a client requesting an account with professional status.
  final String clientType;

  /// Date of birth format: yyyy-mm-dd.
  final String dateOfBirth;

  /// Level of Education
  final String educationLevel;

  /// Industry of Employment.
  final String employmentIndustry;

  /// [Optional] Employment Status.
  final String employmentStatus;

  /// Estimated Net Worth.
  final String estimatedWorth;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String firstName;

  /// [Optional] Forex trading experience.
  final String forexTradingExperience;

  /// [Optional] Forex trading frequency.
  final String forexTradingFrequency;

  /// Income Source.
  final String incomeSource;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  final String lastName;

  /// Net Annual Income.
  final String netIncome;

  /// Must be `1`
  final int newAccountMaltainvest;

  /// [Optional] Indicates client's self-declaration of not being a PEP/RCA.
  final int nonPepDeclaration;

  /// Occupation.
  final String occupation;

  /// [Optional] Trading experience in other financial instruments.
  final String otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  final String otherInstrumentsTradingFrequency;

  /// [Optional] Starting with `+` followed by 8-35 digits, allowing hyphens or space.
  final String phone;

  /// [Optional] Place of birth, 2-letter country code.
  final String placeOfBirth;

  /// 2-letter country code, possible value receive from `residence_list` call.
  final String residence;

  /// Accept any value in enum list.
  final String salutation;

  /// [Optional] Answer to secret question, within 4-50 characters.
  final String secretAnswer;

  /// [Optional] Accept any value in enum list.
  final String secretQuestion;

  /// [Optional] Source of wealth.
  final String sourceOfWealth;

  /// Tax identification number. Only applicable for real money account. Required for `maltainvest` landing company.
  final String taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for `maltainvest` landing company.
  final String taxResidence;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountMaltainvestRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  NewAccountMaltainvestRequest copyWith({
    int acceptRisk,
    String accountOpeningReason,
    String accountTurnover,
    String addressCity,
    String addressLine1,
    String addressLine2,
    String addressPostcode,
    String addressState,
    String affiliateToken,
    String binaryOptionsTradingExperience,
    String binaryOptionsTradingFrequency,
    String cfdTradingExperience,
    String cfdTradingFrequency,
    String citizen,
    String clientType,
    String dateOfBirth,
    String educationLevel,
    String employmentIndustry,
    String employmentStatus,
    String estimatedWorth,
    String firstName,
    String forexTradingExperience,
    String forexTradingFrequency,
    String incomeSource,
    String lastName,
    String netIncome,
    int newAccountMaltainvest,
    int nonPepDeclaration,
    String occupation,
    String otherInstrumentsTradingExperience,
    String otherInstrumentsTradingFrequency,
    String phone,
    String placeOfBirth,
    String residence,
    String salutation,
    String secretAnswer,
    String secretQuestion,
    String sourceOfWealth,
    String taxIdentificationNumber,
    String taxResidence,
    Map<String, dynamic> passthrough,
    int reqId,
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

  /// Override equatable class
  @override
  List<Object> get props => null;
}
