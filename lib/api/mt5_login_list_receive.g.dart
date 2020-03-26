// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_login_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5LoginListResponse _$Mt5LoginListResponseFromJson(Map<String, dynamic> json) {
  return Mt5LoginListResponse(
    mt5LoginList: (json['mt5_login_list'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5LoginListResponseToJson(
        Mt5LoginListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'mt5_login_list': instance.mt5LoginList,
    };
