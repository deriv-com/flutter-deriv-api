// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_statistics_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountStatisticsRequest _$AccountStatisticsRequestFromJson(
    Map<String, dynamic> json) {
  return AccountStatisticsRequest(
    accountStatistics: json['account_statistics'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AccountStatisticsRequestToJson(
        AccountStatisticsRequest instance) =>
    <String, dynamic>{
      'account_statistics': instance.accountStatistics,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
