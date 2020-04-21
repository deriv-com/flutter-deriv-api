// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertUpdateResponse _$P2pAdvertUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertUpdateResponse(
    p2pAdvertUpdate: json['p2p_advert_update'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertUpdateResponseToJson(
        P2pAdvertUpdateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'p2p_advert_update': instance.p2pAdvertUpdate,
    };
