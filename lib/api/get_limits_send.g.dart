// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_limits_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLimitsRequest _$GetLimitsRequestFromJson(Map<String, dynamic> json) {
  return GetLimitsRequest(
    getLimits: json['get_limits'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetLimitsRequestToJson(GetLimitsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'get_limits': instance.getLimits,
    };
