// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertUpdateResponse _$P2pAdvertUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertUpdateResponse(
    p2pAdvertUpdate: json['p2p_advert_update'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pAdvertUpdateResponseToJson(
        P2pAdvertUpdateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'p2p_advert_update': instance.p2pAdvertUpdate,
    };
