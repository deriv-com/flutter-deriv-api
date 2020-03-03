// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertUpdateResponse _$P2pAdvertUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertUpdateResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pAdvertUpdate: json['p2p_advert_update'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$P2pAdvertUpdateResponseToJson(
        P2pAdvertUpdateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'p2p_advert_update': instance.p2pAdvertUpdate,
    };
