// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_index_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetIndexResponse _$AssetIndexResponseFromJson(Map<String, dynamic> json) {
  return AssetIndexResponse(
    assetIndex: (json['asset_index'] as List).map((e) => e as String).toList(),
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$AssetIndexResponseToJson(AssetIndexResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'asset_index': instance.assetIndex,
    };
