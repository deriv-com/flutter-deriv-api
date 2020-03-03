// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copytrading_statistics_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopytradingStatisticsRequest _$CopytradingStatisticsRequestFromJson(
    Map<String, dynamic> json) {
  return CopytradingStatisticsRequest(
    copytradingStatistics: json['copytrading_statistics'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    traderId: json['trader_id'] as String,
  );
}

Map<String, dynamic> _$CopytradingStatisticsRequestToJson(
        CopytradingStatisticsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'copytrading_statistics': instance.copytradingStatistics,
      'trader_id': instance.traderId,
    };
