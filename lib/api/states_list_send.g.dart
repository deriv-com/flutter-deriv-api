// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesListRequest _$StatesListRequestFromJson(Map<String, dynamic> json) {
  return StatesListRequest(
    statesList: json['states_list'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$StatesListRequestToJson(StatesListRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'states_list': instance.statesList,
    };
