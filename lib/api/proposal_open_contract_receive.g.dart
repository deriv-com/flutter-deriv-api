// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_open_contract_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractResponse _$ProposalOpenContractResponseFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractResponse(
    proposalOpenContract:
        json['proposal_open_contract'] as Map<String, dynamic>,
    subscription: json['subscription'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ProposalOpenContractResponseToJson(
        ProposalOpenContractResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'proposal_open_contract': instance.proposalOpenContract,
      'subscription': instance.subscription,
    };
