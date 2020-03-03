// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_open_contract_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractResponse _$ProposalOpenContractResponseFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    proposalOpenContract:
        json['proposal_open_contract'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    subscription: json['subscription'] as Map<String, dynamic>,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ProposalOpenContractResponseToJson(
        ProposalOpenContractResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'proposal_open_contract': instance.proposalOpenContract,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
    };
