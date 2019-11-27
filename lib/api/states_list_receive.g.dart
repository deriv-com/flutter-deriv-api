// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesListResponse _$StatesListResponseFromJson(Map<String, dynamic> json) {
  return StatesListResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int
    ..statesList = (json['states_list'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();
}

Map<String, dynamic> _$StatesListResponseToJson(StatesListResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'states_list': instance.statesList,
    };
