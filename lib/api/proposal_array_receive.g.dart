// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_array_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalArrayResponse _$ProposalArrayResponseFromJson(
    Map<String, dynamic> json) {
  return ProposalArrayResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..proposalArray = json['proposal_array'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProposalArrayResponseToJson(
        ProposalArrayResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'proposal_array': instance.proposalArray,
      'req_id': instance.reqId,
    };
