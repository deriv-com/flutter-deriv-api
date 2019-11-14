// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_durations_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingDurationsRequest _$TradingDurationsRequestFromJson(
    Map<String, dynamic> json) {
  return TradingDurationsRequest()
    ..tradingDurations = json['trading_durations'] as int
    ..landingCompany = json['landing_company'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TradingDurationsRequestToJson(
        TradingDurationsRequest instance) =>
    <String, dynamic>{
      'trading_durations': instance.tradingDurations,
      'landing_company': instance.landingCompany,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
