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
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ProposalOpenContractResponseToJson(
        ProposalOpenContractResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'proposal_open_contract': instance.proposalOpenContract,
      'subscription': instance.subscription,
    };
