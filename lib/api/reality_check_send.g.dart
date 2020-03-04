// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reality_check_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealityCheckRequest _$RealityCheckRequestFromJson(Map<String, dynamic> json) {
  return RealityCheckRequest(
    realityCheck: json['reality_check'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RealityCheckRequestToJson(
        RealityCheckRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'reality_check': instance.realityCheck,
    };
