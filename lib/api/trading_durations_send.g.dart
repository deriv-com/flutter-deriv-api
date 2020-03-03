// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_durations_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingDurationsRequest _$TradingDurationsRequestFromJson(
    Map<String, dynamic> json) {
  return TradingDurationsRequest(
    landingCompany: json['landing_company'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    tradingDurations: json['trading_durations'] as int,
  );
}

Map<String, dynamic> _$TradingDurationsRequestToJson(
        TradingDurationsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'landing_company': instance.landingCompany,
      'trading_durations': instance.tradingDurations,
    };
