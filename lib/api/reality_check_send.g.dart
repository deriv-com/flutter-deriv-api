// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reality_check_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealityCheckRequest _$RealityCheckRequestFromJson(Map<String, dynamic> json) {
  return RealityCheckRequest()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..realityCheck = json['reality_check'] as int
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$RealityCheckRequestToJson(
        RealityCheckRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'reality_check': instance.realityCheck,
      'req_id': instance.reqId,
    };
