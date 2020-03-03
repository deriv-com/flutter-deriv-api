// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_table_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitTableResponse _$ProfitTableResponseFromJson(Map<String, dynamic> json) {
  return ProfitTableResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    profitTable: json['profit_table'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ProfitTableResponseToJson(
        ProfitTableResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'profit_table': instance.profitTable,
      'req_id': instance.reqId,
    };
