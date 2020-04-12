// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_update_history_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractUpdateHistoryResponse _$ContractUpdateHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return ContractUpdateHistoryResponse(
    contractUpdateHistory: (json['contract_update_history'] as List)
        .map((e) => e as String)
        .toList(),
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ContractUpdateHistoryResponseToJson(
        ContractUpdateHistoryResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'contract_update_history': instance.contractUpdateHistory,
    };
