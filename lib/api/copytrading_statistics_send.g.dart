// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copytrading_statistics_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopytradingStatisticsRequest _$CopytradingStatisticsRequestFromJson(
    Map<String, dynamic> json) {
  return CopytradingStatisticsRequest()
    ..copytradingStatistics = json['copytrading_statistics'] as int
    ..traderId = json['trader_id'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$CopytradingStatisticsRequestToJson(
        CopytradingStatisticsRequest instance) =>
    <String, dynamic>{
      'copytrading_statistics': instance.copytradingStatistics,
      'trader_id': instance.traderId,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
