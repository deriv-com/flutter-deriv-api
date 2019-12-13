// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_new_account_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5NewAccountRequest _$Mt5NewAccountRequestFromJson(Map<String, dynamic> json) {
  return Mt5NewAccountRequest(
    accountType: json['account_type'] as String,
    address: json['address'] as String,
    city: json['city'] as String,
    company: json['company'] as String,
    country: json['country'] as String,
    email: json['email'] as String,
    investPassword: json['invest_password'] as String,
    leverage: json['leverage'] as num,
    mainPassword: json['main_password'] as String,
    mt5AccountType: json['mt5_account_type'] as String,
    mt5NewAccount: json['mt5_new_account'] as int,
    name: json['name'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    phone: json['phone'] as String,
    phonePassword: json['phone_password'] as String,
    reqId: json['req_id'] as int,
    state: json['state'] as String,
    zipCode: json['zip_code'] as String,
  );
}

Map<String, dynamic> _$Mt5NewAccountRequestToJson(
        Mt5NewAccountRequest instance) =>
    <String, dynamic>{
      'account_type': instance.accountType,
      'address': instance.address,
      'city': instance.city,
      'company': instance.company,
      'country': instance.country,
      'email': instance.email,
      'invest_password': instance.investPassword,
      'leverage': instance.leverage,
      'main_password': instance.mainPassword,
      'mt5_account_type': instance.mt5AccountType,
      'mt5_new_account': instance.mt5NewAccount,
      'name': instance.name,
      'passthrough': instance.passthrough,
      'phone': instance.phone,
      'phone_password': instance.phonePassword,
      'req_id': instance.reqId,
      'state': instance.state,
      'zip_code': instance.zipCode,
    };
