// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbols_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbolsResponse _$ActiveSymbolsResponseFromJson(
    Map<String, dynamic> json) {
  return ActiveSymbolsResponse(
    activeSymbols: (json['active_symbols'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ActiveSymbolsResponseToJson(
        ActiveSymbolsResponse instance) =>
    <String, dynamic>{
      'active_symbols': instance.activeSymbols,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
