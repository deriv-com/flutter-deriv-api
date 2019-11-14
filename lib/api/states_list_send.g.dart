// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesListRequest _$StatesListRequestFromJson(Map<String, dynamic> json) {
  return StatesListRequest()
    ..statesList = json['states_list'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$StatesListRequestToJson(StatesListRequest instance) =>
    <String, dynamic>{
      'states_list': instance.statesList,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
