// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts_for_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsForResponse _$ContractsForResponseFromJson(Map<String, dynamic> json) {
  return ContractsForResponse(
    contractsFor: json['contracts_for'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ContractsForResponseToJson(
        ContractsForResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'contracts_for': instance.contractsFor,
    };
