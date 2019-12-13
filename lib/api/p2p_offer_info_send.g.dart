// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_offer_info_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOfferInfoRequest _$P2pOfferInfoRequestFromJson(Map<String, dynamic> json) {
  return P2pOfferInfoRequest(
    offerId: json['offer_id'] as String,
    p2pOfferInfo: json['p2p_offer_info'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOfferInfoRequestToJson(
        P2pOfferInfoRequest instance) =>
    <String, dynamic>{
      'offer_id': instance.offerId,
      'p2p_offer_info': instance.p2pOfferInfo,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
