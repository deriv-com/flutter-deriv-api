// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_table_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitTableResponse _$ProfitTableResponseFromJson(Map<String, dynamic> json) {
  return ProfitTableResponse(
    profitTable: json['profit_table'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ProfitTableResponseToJson(
        ProfitTableResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'profit_table': instance.profitTable,
    };
