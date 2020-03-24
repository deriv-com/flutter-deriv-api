// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_limits_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLimitsRequest _$GetLimitsRequestFromJson(Map<String, dynamic> json) {
  return GetLimitsRequest(
    getLimits: json['get_limits'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$GetLimitsRequestToJson(GetLimitsRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'get_limits': instance.getLimits,
    };
