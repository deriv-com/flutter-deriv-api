// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractUpdateResponse _$ContractUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return ContractUpdateResponse(
    contractUpdate: json['contract_update'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ContractUpdateResponseToJson(
        ContractUpdateResponse instance) =>
    <String, dynamic>{
      'contract_update': instance.contractUpdate,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
