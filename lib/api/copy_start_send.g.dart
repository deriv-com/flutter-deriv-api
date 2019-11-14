// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_start_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopyStartRequest _$CopyStartRequestFromJson(Map<String, dynamic> json) {
  return CopyStartRequest()
    ..copyStart = json['copy_start'] as String
    ..assets = json['assets'] as String
    ..maxTradeStake = json['max_trade_stake'] as num
    ..minTradeStake = json['min_trade_stake'] as num
    ..tradeTypes = json['trade_types'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$CopyStartRequestToJson(CopyStartRequest instance) =>
    <String, dynamic>{
      'copy_start': instance.copyStart,
      'assets': instance.assets,
      'max_trade_stake': instance.maxTradeStake,
      'min_trade_stake': instance.minTradeStake,
      'trade_types': instance.tradeTypes,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
