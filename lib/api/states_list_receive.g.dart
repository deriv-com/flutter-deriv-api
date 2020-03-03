// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesListResponse _$StatesListResponseFromJson(Map<String, dynamic> json) {
  return StatesListResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    statesList: (json['states_list'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$StatesListResponseToJson(StatesListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'states_list': instance.statesList,
    };
