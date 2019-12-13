// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_offer_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOfferListResponse _$P2pOfferListResponseFromJson(Map<String, dynamic> json) {
  return P2pOfferListResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOfferList: json['p2p_offer_list'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOfferListResponseToJson(
        P2pOfferListResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_offer_list': instance.p2pOfferList,
      'req_id': instance.reqId,
    };
