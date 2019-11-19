// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_real_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountRealRequest _$NewAccountRealRequestFromJson(
    Map<String, dynamic> json) {
  return NewAccountRealRequest()
    ..accountOpeningReason = json['account_opening_reason'] as String
    ..accountTurnover = json['account_turnover'] as String
    ..addressCity = json['address_city'] as String
    ..addressLine1 = json['address_line1'] as String
    ..addressLine2 = json['address_line2'] as String
    ..addressPostcode = json['address_postcode'] as String
    ..addressState = json['address_state'] as String
    ..affiliateToken = json['affiliate_token'] as String
    ..citizen = json['citizen'] as String
    ..clientType = json['client_type'] as String
    ..currency = json['currency'] as String
    ..dateOfBirth = json['date_of_birth'] as String
    ..firstName = json['first_name'] as String
    ..lastName = json['last_name'] as String
    ..newAccountReal = json['new_account_real'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..phone = json['phone'] as String
    ..placeOfBirth = json['place_of_birth'] as String
    ..reqId = json['req_id'] as int
    ..residence = json['residence'] as String
    ..salutation = json['salutation'] as String
    ..secretAnswer = json['secret_answer'] as String
    ..secretQuestion = json['secret_question'] as String
    ..taxIdentificationNumber = json['tax_identification_number'] as String
    ..taxResidence = json['tax_residence'] as String;
}

Map<String, dynamic> _$NewAccountRealRequestToJson(
        NewAccountRealRequest instance) =>
    <String, dynamic>{
      'account_opening_reason': instance.accountOpeningReason,
      'account_turnover': instance.accountTurnover,
      'address_city': instance.addressCity,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'address_postcode': instance.addressPostcode,
      'address_state': instance.addressState,
      'affiliate_token': instance.affiliateToken,
      'citizen': instance.citizen,
      'client_type': instance.clientType,
      'currency': instance.currency,
      'date_of_birth': instance.dateOfBirth,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'new_account_real': instance.newAccountReal,
      'passthrough': instance.passthrough,
      'phone': instance.phone,
      'place_of_birth': instance.placeOfBirth,
      'req_id': instance.reqId,
      'residence': instance.residence,
      'salutation': instance.salutation,
      'secret_answer': instance.secretAnswer,
      'secret_question': instance.secretQuestion,
      'tax_identification_number': instance.taxIdentificationNumber,
      'tax_residence': instance.taxResidence,
    };
