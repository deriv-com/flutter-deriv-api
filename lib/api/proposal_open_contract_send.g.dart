// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_open_contract_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractRequest _$ProposalOpenContractRequestFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractRequest(
    contractId: json['contract_id'] as int,
    proposalOpenContract: json['proposal_open_contract'] as int,
    subscribe: json['subscribe'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ProposalOpenContractRequestToJson(
        ProposalOpenContractRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'contract_id': instance.contractId,
      'proposal_open_contract': instance.proposalOpenContract,
      'subscribe': instance.subscribe,
    };
