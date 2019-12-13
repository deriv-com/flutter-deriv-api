// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_open_contract_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractRequest _$ProposalOpenContractRequestFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractRequest(
    contractId: json['contract_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    proposalOpenContract: json['proposal_open_contract'] as int,
    reqId: json['req_id'] as int,
    subscribe: json['subscribe'] as int,
  );
}

Map<String, dynamic> _$ProposalOpenContractRequestToJson(
        ProposalOpenContractRequest instance) =>
    <String, dynamic>{
      'contract_id': instance.contractId,
      'passthrough': instance.passthrough,
      'proposal_open_contract': instance.proposalOpenContract,
      'req_id': instance.reqId,
      'subscribe': instance.subscribe,
    };
