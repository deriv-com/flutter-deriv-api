// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_start_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopyStartRequest _$CopyStartRequestFromJson(Map<String, dynamic> json) {
  return CopyStartRequest(
    assets: json['assets'] as String,
    copyStart: json['copy_start'] as String,
    maxTradeStake: json['max_trade_stake'] as num,
    minTradeStake: json['min_trade_stake'] as num,
    tradeTypes: json['trade_types'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CopyStartRequestToJson(CopyStartRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'assets': instance.assets,
      'copy_start': instance.copyStart,
      'max_trade_stake': instance.maxTradeStake,
      'min_trade_stake': instance.minTradeStake,
      'trade_types': instance.tradeTypes,
    };
