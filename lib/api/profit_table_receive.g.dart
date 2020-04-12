// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_table_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitTableResponse _$ProfitTableResponseFromJson(Map<String, dynamic> json) {
  return ProfitTableResponse(
    profitTable: json['profit_table'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ProfitTableResponseToJson(
        ProfitTableResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'profit_table': instance.profitTable,
    };
