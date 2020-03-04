// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts_for_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsForResponse _$ContractsForResponseFromJson(Map<String, dynamic> json) {
  return ContractsForResponse(
    contractsFor: json['contracts_for'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ContractsForResponseToJson(
        ContractsForResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'contracts_for': instance.contractsFor,
    };
