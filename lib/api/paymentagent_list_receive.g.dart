// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentListResponse _$PaymentagentListResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentagentListResponse(
    paymentagentList: json['paymentagent_list'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PaymentagentListResponseToJson(
        PaymentagentListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'paymentagent_list': instance.paymentagentList,
    };
