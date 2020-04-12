/// generated automatically from flutter_deriv_api|lib/api/new_account_maltainvest_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'new_account_maltainvest_send.g.dart';

/// JSON conversion for 'new_account_maltainvest_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountMaltainvestRequest extends Request {
  /// Initialize NewAccountMaltainvestRequest
  NewAccountMaltainvestRequest({
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
}
