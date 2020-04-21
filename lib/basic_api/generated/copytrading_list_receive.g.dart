// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copytrading_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopytradingListResponse _$CopytradingListResponseFromJson(
    Map<String, dynamic> json) {
  return CopytradingListResponse(
    copytradingList: json['copytrading_list'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CopytradingListResponseToJson(
        CopytradingListResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'copytrading_list': instance.copytradingList,
    };
