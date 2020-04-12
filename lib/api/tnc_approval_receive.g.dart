// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tnc_approval_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TncApprovalResponse _$TncApprovalResponseFromJson(Map<String, dynamic> json) {
  return TncApprovalResponse(
    tncApproval: json['tnc_approval'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TncApprovalResponseToJson(
        TncApprovalResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'tnc_approval': instance.tncApproval,
    };
