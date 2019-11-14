// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_new_account_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5NewAccountRequest _$Mt5NewAccountRequestFromJson(Map<String, dynamic> json) {
  return Mt5NewAccountRequest()
    ..mt5NewAccount = json['mt5_new_account'] as int
    ..accountType = json['account_type'] as String
    ..address = json['address'] as String
    ..city = json['city'] as String
    ..company = json['company'] as String
    ..country = json['country'] as String
    ..email = json['email'] as String
    ..investPassword = json['invest_password'] as String
    ..leverage = json['leverage'] as String
    ..mainPassword = json['main_password'] as String
    ..mt5AccountType = json['mt5_account_type'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..phonePassword = json['phone_password'] as String
    ..state = json['state'] as String
    ..zipCode = json['zip_code'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5NewAccountRequestToJson(
        Mt5NewAccountRequest instance) =>
    <String, dynamic>{
      'mt5_new_account': instance.mt5NewAccount,
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
      'name': instance.name,
      'phone': instance.phone,
      'phone_password': instance.phonePassword,
      'state': instance.state,
      'zip_code': instance.zipCode,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
