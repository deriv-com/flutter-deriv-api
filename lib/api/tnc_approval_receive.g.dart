// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tnc_approval_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TncApprovalResponse _$TncApprovalResponseFromJson(Map<String, dynamic> json) {
  return TncApprovalResponse()
    ..tncApproval = json['tnc_approval'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TncApprovalResponseToJson(
        TncApprovalResponse instance) =>
    <String, dynamic>{
      'tnc_approval': instance.tncApproval,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
