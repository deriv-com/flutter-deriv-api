// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reality_check_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealityCheckRequest _$RealityCheckRequestFromJson(Map<String, dynamic> json) {
  return RealityCheckRequest()
    ..realityCheck = json['reality_check'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$RealityCheckRequestToJson(
        RealityCheckRequest instance) =>
    <String, dynamic>{
      'reality_check': instance.realityCheck,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
