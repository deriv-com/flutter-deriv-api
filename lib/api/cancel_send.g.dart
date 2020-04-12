// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRequest _$CancelRequestFromJson(Map<String, dynamic> json) {
  return CancelRequest(
    cancel: json['cancel'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CancelRequestToJson(CancelRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'cancel': instance.cancel,
    };
