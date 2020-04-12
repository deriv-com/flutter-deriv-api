// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_settings_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetSettingsRequest _$SetSettingsRequestFromJson(Map<String, dynamic> json) {
  return SetSettingsRequest(
    accountOpeningReason: json['account_opening_reason'] as String,
    addressCity: json['address_city'] as String,
    addressLine1: json['address_line1'] as String,
    addressLine2: json['address_line2'] as String,
    addressPostcode: json['address_postcode'] as String,
    addressState: json['address_state'] as String,
    allowCopiers: json['allow_copiers'] as int,
    citizen: json['citizen'] as String,
    dateOfBirth: json['date_of_birth'] as String,
    emailConsent: json['email_consent'] as int,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    phone: json['phone'] as String,
    placeOfBirth: json['place_of_birth'] as String,
    requestProfessionalStatus: json['request_professional_status'] as int,
    residence: json['residence'] as String,
    salutation: json['salutation'] as String,
    secretAnswer: json['secret_answer'] as String,
    secretQuestion: json['secret_question'] as String,
    setSettings: json['set_settings'] as int,
    taxIdentificationNumber: json['tax_identification_number'] as String,
    taxResidence: json['tax_residence'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SetSettingsRequestToJson(SetSettingsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'account_opening_reason': instance.accountOpeningReason,
      'address_city': instance.addressCity,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'address_postcode': instance.addressPostcode,
      'address_state': instance.addressState,
      'allow_copiers': instance.allowCopiers,
      'citizen': instance.citizen,
      'date_of_birth': instance.dateOfBirth,
      'email_consent': instance.emailConsent,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'place_of_birth': instance.placeOfBirth,
      'request_professional_status': instance.requestProfessionalStatus,
      'residence': instance.residence,
      'salutation': instance.salutation,
      'secret_answer': instance.secretAnswer,
      'secret_question': instance.secretQuestion,
      'set_settings': instance.setSettings,
      'tax_identification_number': instance.taxIdentificationNumber,
      'tax_residence': instance.taxResidence,
    };
