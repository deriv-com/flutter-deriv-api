// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRequest _$CancelRequestFromJson(Map<String, dynamic> json) {
  return CancelRequest(
    cancel: json['cancel'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CancelRequestToJson(CancelRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'cancel': instance.cancel,
    };
