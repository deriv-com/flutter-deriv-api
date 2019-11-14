// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_virtual_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountVirtualRequest _$NewAccountVirtualRequestFromJson(
    Map<String, dynamic> json) {
  return NewAccountVirtualRequest()
    ..newAccountVirtual = json['new_account_virtual'] as int
    ..affiliateToken = json['affiliate_token'] as String
    ..clientPassword = json['client_password'] as String
    ..dateFirstContact = json['date_first_contact'] as String
    ..gclidUrl = json['gclid_url'] as String
    ..residence = json['residence'] as String
    ..signupDevice = json['signup_device'] as String
    ..utmCampaign = json['utm_campaign'] as String
    ..utmMedium = json['utm_medium'] as String
    ..utmSource = json['utm_source'] as String
    ..verificationCode = json['verification_code'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$NewAccountVirtualRequestToJson(
        NewAccountVirtualRequest instance) =>
    <String, dynamic>{
      'new_account_virtual': instance.newAccountVirtual,
      'affiliate_token': instance.affiliateToken,
      'client_password': instance.clientPassword,
      'date_first_contact': instance.dateFirstContact,
      'gclid_url': instance.gclidUrl,
      'residence': instance.residence,
      'signup_device': instance.signupDevice,
      'utm_campaign': instance.utmCampaign,
      'utm_medium': instance.utmMedium,
      'utm_source': instance.utmSource,
      'verification_code': instance.verificationCode,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
