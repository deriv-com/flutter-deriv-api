// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_agent_info_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAgentInfoResponse _$P2pAgentInfoResponseFromJson(Map<String, dynamic> json) {
  return P2pAgentInfoResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pAgentInfo: json['p2p_agent_info'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAgentInfoResponseToJson(
        P2pAgentInfoResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_agent_info': instance.p2pAgentInfo,
      'req_id': instance.reqId,
    };
