// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_index_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetIndexResponse _$AssetIndexResponseFromJson(Map<String, dynamic> json) {
  return AssetIndexResponse(
    assetIndex: (json['asset_index'] as List).map((e) => e as String).toList(),
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AssetIndexResponseToJson(AssetIndexResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'asset_index': instance.assetIndex,
    };
