// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_index_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetIndexResponse _$AssetIndexResponseFromJson(Map<String, dynamic> json) {
  return AssetIndexResponse(
    assetIndex: (json['asset_index'] as List).map((e) => e as String).toList(),
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AssetIndexResponseToJson(AssetIndexResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'asset_index': instance.assetIndex,
    };
