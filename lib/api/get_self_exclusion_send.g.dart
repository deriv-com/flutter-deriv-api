// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_self_exclusion_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSelfExclusionRequest _$GetSelfExclusionRequestFromJson(
    Map<String, dynamic> json) {
  return GetSelfExclusionRequest(
    getSelfExclusion: json['get_self_exclusion'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetSelfExclusionRequestToJson(
        GetSelfExclusionRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'get_self_exclusion': instance.getSelfExclusion,
    };
