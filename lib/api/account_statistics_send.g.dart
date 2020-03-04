// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_statistics_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountStatisticsRequest _$AccountStatisticsRequestFromJson(
    Map<String, dynamic> json) {
  return AccountStatisticsRequest(
    accountStatistics: json['account_statistics'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AccountStatisticsRequestToJson(
        AccountStatisticsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'account_statistics': instance.accountStatistics,
    };
