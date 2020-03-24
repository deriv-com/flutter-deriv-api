// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts_for_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsForResponse _$ContractsForResponseFromJson(Map<String, dynamic> json) {
  return ContractsForResponse(
    contractsFor: json['contracts_for'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ContractsForResponseToJson(
        ContractsForResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'contracts_for': instance.contractsFor,
    };
