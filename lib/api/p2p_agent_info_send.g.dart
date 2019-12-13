// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_agent_info_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAgentInfoRequest _$P2pAgentInfoRequestFromJson(Map<String, dynamic> json) {
  return P2pAgentInfoRequest(
    agentId: json['agent_id'] as String,
    p2pAgentInfo: json['p2p_agent_info'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAgentInfoRequestToJson(
        P2pAgentInfoRequest instance) =>
    <String, dynamic>{
      'agent_id': instance.agentId,
      'p2p_agent_info': instance.p2pAgentInfo,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
