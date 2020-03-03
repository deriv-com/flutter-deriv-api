// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetRequest _$ForgetRequestFromJson(Map<String, dynamic> json) {
  return ForgetRequest(
    forget: json['forget'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ForgetRequestToJson(ForgetRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'forget': instance.forget,
    };
