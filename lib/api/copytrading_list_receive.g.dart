// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copytrading_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopytradingListResponse _$CopytradingListResponseFromJson(
    Map<String, dynamic> json) {
  return CopytradingListResponse(
    copytradingList: json['copytrading_list'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CopytradingListResponseToJson(
        CopytradingListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'copytrading_list': instance.copytradingList,
    };
