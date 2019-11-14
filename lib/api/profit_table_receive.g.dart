// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_table_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitTableResponse _$ProfitTableResponseFromJson(Map<String, dynamic> json) {
  return ProfitTableResponse()
    ..profitTable = json['profit_table'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProfitTableResponseToJson(
        ProfitTableResponse instance) =>
    <String, dynamic>{
      'profit_table': instance.profitTable,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
