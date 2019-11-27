// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesListRequest _$StatesListRequestFromJson(Map<String, dynamic> json) {
  return StatesListRequest()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int
    ..statesList = json['states_list'] as String;
}

Map<String, dynamic> _$StatesListRequestToJson(StatesListRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'states_list': instance.statesList,
    };
