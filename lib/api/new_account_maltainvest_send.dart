/// Autogenerated from flutter_deriv_api|lib/api/new_account_maltainvest_send.json
import 'dart:async';
import 'dart:convert';
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
          msgType: 'new_account_maltainvest',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory NewAccountMaltainvestRequest.fromJson(Map<String, dynamic> json) =>
      _$NewAccountMaltainvestRequestFromJson(json);

  // Properties
  /// Show whether client has accepted risk disclaimer.
  int acceptRisk;

  /// [Optional] Purpose and reason for requesting the account opening.
  String accountOpeningReason;

  /// [Optional] The anticipated account turnover.
  String accountTurnover;

  /// Within 35 characters
  String addressCity;

  /// Within 70 characters.
  String addressLine1;

  /// [Optional] Within 70 characters.
  String addressLine2;

  /// [Optional] Within 20 characters and may not contain '+'.
  String addressPostcode;

  /// [Optional] Possible value receive from `states_list` call.
  String addressState;

  /// [Optional] Affiliate token, within 32 characters.
  String affiliateToken;

  /// [Optional] Binary options trading experience.
  String binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  String binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  String cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  String cfdTradingFrequency;

  /// [Optional] Country of legal citizenship, 2-letter country code. Possible value receive from `residence_list` call.
  String citizen;

  /// [Optional] Indicates whether this is for a client requesting an account with professional status.
  String clientType;

  /// Date of birth format: yyyy-mm-dd.
  String dateOfBirth;

  /// Level of Education
  String educationLevel;

  /// Industry of Employment.
  String employmentIndustry;

  /// [Optional] Employment Status.
  String employmentStatus;

  /// Estimated Net Worth.
  String estimatedWorth;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  String firstName;

  /// [Optional] Forex trading experience.
  String forexTradingExperience;

  /// [Optional] Forex trading frequency.
  String forexTradingFrequency;

  /// Income Source.
  String incomeSource;

  /// Within 2-50 characters, use only letters, spaces, hyphens, full-stops or apostrophes.
  String lastName;

  /// Net Annual Income.
  String netIncome;

  /// Must be `1`
  int newAccountMaltainvest;

  /// Occupation.
  String occupation;

  /// [Optional] Trading experience in other financial instruments.
  String otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  String otherInstrumentsTradingFrequency;

  /// [Optional] Within 8-35 digits, allowing '+' in front, numbers, hyphens or space.
  String phone;

  /// [Optional] Place of birth, 2-letter country code.
  String placeOfBirth;

  /// 2-letter country code, possible value receive from `residence_list` call.
  String residence;

  /// Accept any value in enum list.
  String salutation;

  /// [Optional] Answer to secret question, within 4-50 characters.
  String secretAnswer;

  /// [Optional] Accept any value in enum list.
  String secretQuestion;

  /// [Optional] Source of wealth.
  String sourceOfWealth;

  /// Tax identification number. Only applicable for real money account. Required for `maltainvest` landing company.
  String taxIdentificationNumber;

  /// Residence for tax purpose. Comma separated iso country code if multiple jurisdictions. Only applicable for real money account. Required for `maltainvest` landing company.
  String taxResidence;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountMaltainvestRequestToJson(this);
}
