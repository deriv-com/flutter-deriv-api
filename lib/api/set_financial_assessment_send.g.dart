// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_financial_assessment_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetFinancialAssessmentRequest _$SetFinancialAssessmentRequestFromJson(
    Map<String, dynamic> json) {
  return SetFinancialAssessmentRequest(
    accountTurnover: json['account_turnover'] as String,
    binaryOptionsTradingExperience:
        json['binary_options_trading_experience'] as String,
    binaryOptionsTradingFrequency:
        json['binary_options_trading_frequency'] as String,
    cfdTradingExperience: json['cfd_trading_experience'] as String,
    cfdTradingFrequency: json['cfd_trading_frequency'] as String,
    educationLevel: json['education_level'] as String,
    employmentIndustry: json['employment_industry'] as String,
    employmentStatus: json['employment_status'] as String,
    estimatedWorth: json['estimated_worth'] as String,
    forexTradingExperience: json['forex_trading_experience'] as String,
    forexTradingFrequency: json['forex_trading_frequency'] as String,
    incomeSource: json['income_source'] as String,
    netIncome: json['net_income'] as String,
    occupation: json['occupation'] as String,
    otherInstrumentsTradingExperience:
        json['other_instruments_trading_experience'] as String,
    otherInstrumentsTradingFrequency:
        json['other_instruments_trading_frequency'] as String,
    setFinancialAssessment: json['set_financial_assessment'] as int,
    sourceOfWealth: json['source_of_wealth'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$SetFinancialAssessmentRequestToJson(
        SetFinancialAssessmentRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'account_turnover': instance.accountTurnover,
      'binary_options_trading_experience':
          instance.binaryOptionsTradingExperience,
      'binary_options_trading_frequency':
          instance.binaryOptionsTradingFrequency,
      'cfd_trading_experience': instance.cfdTradingExperience,
      'cfd_trading_frequency': instance.cfdTradingFrequency,
      'education_level': instance.educationLevel,
      'employment_industry': instance.employmentIndustry,
      'employment_status': instance.employmentStatus,
      'estimated_worth': instance.estimatedWorth,
      'forex_trading_experience': instance.forexTradingExperience,
      'forex_trading_frequency': instance.forexTradingFrequency,
      'income_source': instance.incomeSource,
      'net_income': instance.netIncome,
      'occupation': instance.occupation,
      'other_instruments_trading_experience':
          instance.otherInstrumentsTradingExperience,
      'other_instruments_trading_frequency':
          instance.otherInstrumentsTradingFrequency,
      'set_financial_assessment': instance.setFinancialAssessment,
      'source_of_wealth': instance.sourceOfWealth,
    };
