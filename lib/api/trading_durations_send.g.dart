// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_durations_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingDurationsRequest _$TradingDurationsRequestFromJson(
    Map<String, dynamic> json) {
  return TradingDurationsRequest(
    landingCompany: json['landing_company'] as String,
    tradingDurations: json['trading_durations'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$TradingDurationsRequestToJson(
        TradingDurationsRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'landing_company': instance.landingCompany,
      'trading_durations': instance.tradingDurations,
    };
