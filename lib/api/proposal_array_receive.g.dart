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
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ProposalArrayResponseToJson(
        ProposalArrayResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'proposal_array': instance.proposalArray,
    };
