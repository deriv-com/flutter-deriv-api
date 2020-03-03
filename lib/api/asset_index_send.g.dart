// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_index_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetIndexRequest _$AssetIndexRequestFromJson(Map<String, dynamic> json) {
  return AssetIndexRequest(
    assetIndex: json['asset_index'] as int,
    landingCompany: json['landing_company'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AssetIndexRequestToJson(AssetIndexRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'asset_index': instance.assetIndex,
      'landing_company': instance.landingCompany,
    };
