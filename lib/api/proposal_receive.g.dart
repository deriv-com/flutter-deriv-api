// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalResponse _$ProposalResponseFromJson(Map<String, dynamic> json) {
  return ProposalResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    proposal: json['proposal'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    subscription: json['subscription'] as Map<String, dynamic>,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ProposalResponseToJson(ProposalResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'proposal': instance.proposal,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
    };
