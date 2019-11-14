// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_array_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalArrayResponse _$ProposalArrayResponseFromJson(
    Map<String, dynamic> json) {
  return ProposalArrayResponse()
    ..proposalArray = json['proposal_array'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProposalArrayResponseToJson(
        ProposalArrayResponse instance) =>
    <String, dynamic>{
      'proposal_array': instance.proposalArray,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
