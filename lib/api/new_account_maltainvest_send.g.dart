// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_maltainvest_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountMaltainvestRequest _$NewAccountMaltainvestRequestFromJson(
    Map<String, dynamic> json) {
  return NewAccountMaltainvestRequest(
    acceptRisk: json['accept_risk'] as int,
    accountOpeningReason: json['account_opening_reason'] as String,
    accountTurnover: json['account_turnover'] as String,
    addressCity: json['address_city'] as String,
    addressLine1: json['address_line1'] as String,
    addressLine2: json['address_line2'] as String,
    addressPostcode: json['address_postcode'] as String,
    addressState: json['address_state'] as String,
    affiliateToken: json['affiliate_token'] as String,
    binaryOptionsTradingExperience:
        json['binary_options_trading_experience'] as String,
    binaryOptionsTradingFrequency:
        json['binary_options_trading_frequency'] as String,
    cfdTradingExperience: json['cfd_trading_experience'] as String,
    cfdTradingFrequency: json['cfd_trading_frequency'] as String,
    citizen: json['citizen'] as String,
    clientType: json['client_type'] as String,
    dateOfBirth: json['date_of_birth'] as String,
    educationLevel: json['education_level'] as String,
    employmentIndustry: json['employment_industry'] as String,
    employmentStatus: json['employment_status'] as String,
    estimatedWorth: json['estimated_worth'] as String,
    firstName: json['first_name'] as String,
    forexTradingExperience: json['forex_trading_experience'] as String,
    forexTradingFrequency: json['forex_trading_frequency'] as String,
    incomeSource: json['income_source'] as String,
    lastName: json['last_name'] as String,
    netIncome: json['net_income'] as String,
    newAccountMaltainvest: json['new_account_maltainvest'] as int,
    occupation: json['occupation'] as String,
    otherInstrumentsTradingExperience:
        json['other_instruments_trading_experience'] as String,
    otherInstrumentsTradingFrequency:
        json['other_instruments_trading_frequency'] as String,
    phone: json['phone'] as String,
    placeOfBirth: json['place_of_birth'] as String,
    residence: json['residence'] as String,
    salutation: json['salutation'] as String,
    secretAnswer: json['secret_answer'] as String,
    secretQuestion: json['secret_question'] as String,
    sourceOfWealth: json['source_of_wealth'] as String,
    taxIdentificationNumber: json['tax_identification_number'] as String,
    taxResidence: json['tax_residence'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$NewAccountMaltainvestRequestToJson(
        NewAccountMaltainvestRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'accept_risk': instance.acceptRisk,
      'account_opening_reason': instance.accountOpeningReason,
      'account_turnover': instance.accountTurnover,
      'address_city': instance.addressCity,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'address_postcode': instance.addressPostcode,
      'address_state': instance.addressState,
      'affiliate_token': instance.affiliateToken,
      'binary_options_trading_experience':
          instance.binaryOptionsTradingExperience,
      'binary_options_trading_frequency':
          instance.binaryOptionsTradingFrequency,
      'cfd_trading_experience': instance.cfdTradingExperience,
      'cfd_trading_frequency': instance.cfdTradingFrequency,
      'citizen': instance.citizen,
      'client_type': instance.clientType,
      'date_of_birth': instance.dateOfBirth,
      'education_level': instance.educationLevel,
      'employment_industry': instance.employmentIndustry,
      'employment_status': instance.employmentStatus,
      'estimated_worth': instance.estimatedWorth,
      'first_name': instance.firstName,
      'forex_trading_experience': instance.forexTradingExperience,
      'forex_trading_frequency': instance.forexTradingFrequency,
      'income_source': instance.incomeSource,
      'last_name': instance.lastName,
      'net_income': instance.netIncome,
      'new_account_maltainvest': instance.newAccountMaltainvest,
      'occupation': instance.occupation,
      'other_instruments_trading_experience':
          instance.otherInstrumentsTradingExperience,
      'other_instruments_trading_frequency':
          instance.otherInstrumentsTradingFrequency,
      'phone': instance.phone,
      'place_of_birth': instance.placeOfBirth,
      'residence': instance.residence,
      'salutation': instance.salutation,
      'secret_answer': instance.secretAnswer,
      'secret_question': instance.secretQuestion,
      'source_of_wealth': instance.sourceOfWealth,
      'tax_identification_number': instance.taxIdentificationNumber,
      'tax_residence': instance.taxResidence,
    };
