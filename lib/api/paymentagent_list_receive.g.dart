// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentListResponse _$PaymentagentListResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentagentListResponse(
    paymentagentList: json['paymentagent_list'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$PaymentagentListResponseToJson(
        PaymentagentListResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'paymentagent_list': instance.paymentagentList,
    };
