// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_offer_info_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOfferInfoResponse _$P2pOfferInfoResponseFromJson(Map<String, dynamic> json) {
  return P2pOfferInfoResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOfferInfo: json['p2p_offer_info'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOfferInfoResponseToJson(
        P2pOfferInfoResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_offer_info': instance.p2pOfferInfo,
      'req_id': instance.reqId,
    };
