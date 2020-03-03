// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_statistics_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountStatisticsResponse _$AccountStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return AccountStatisticsResponse(
    accountStatistics: json['account_statistics'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$AccountStatisticsResponseToJson(
        AccountStatisticsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'account_statistics': instance.accountStatistics,
    };
