// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_array_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalArrayResponse _$ProposalArrayResponseFromJson(
    Map<String, dynamic> json) {
  return ProposalArrayResponse(
    proposalArray: json['proposal_array'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ProposalArrayResponseToJson(
        ProposalArrayResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'proposal_array': instance.proposalArray,
    };
