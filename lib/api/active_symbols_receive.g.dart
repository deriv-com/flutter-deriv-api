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
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ActiveSymbolsResponseToJson(
        ActiveSymbolsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'active_symbols': instance.activeSymbols,
    };
