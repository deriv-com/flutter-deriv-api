// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalResponse _$ProposalResponseFromJson(Map<String, dynamic> json) {
  return ProposalResponse()
    ..proposal = json['proposal'] as Map<String, dynamic>
    ..subscription = json['subscription'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProposalResponseToJson(ProposalResponse instance) =>
    <String, dynamic>{
      'proposal': instance.proposal,
      'subscription': instance.subscription,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
