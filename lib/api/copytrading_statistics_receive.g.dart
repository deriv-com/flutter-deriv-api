// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copytrading_statistics_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopytradingStatisticsResponse _$CopytradingStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return CopytradingStatisticsResponse(
    copytradingStatistics:
        json['copytrading_statistics'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CopytradingStatisticsResponseToJson(
        CopytradingStatisticsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'copytrading_statistics': instance.copytradingStatistics,
    };
