// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_open_contract_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractRequest _$ProposalOpenContractRequestFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractRequest()
    ..proposalOpenContract = json['proposal_open_contract'] as int
    ..contractId = json['contract_id'] as int
    ..subscribe = json['subscribe'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProposalOpenContractRequestToJson(
        ProposalOpenContractRequest instance) =>
    <String, dynamic>{
      'proposal_open_contract': instance.proposalOpenContract,
      'contract_id': instance.contractId,
      'subscribe': instance.subscribe,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
