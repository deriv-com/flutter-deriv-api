// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copytrading_statistics_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopytradingStatisticsResponse _$CopytradingStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return CopytradingStatisticsResponse()
    ..copytradingStatistics =
        json['copytrading_statistics'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$CopytradingStatisticsResponseToJson(
        CopytradingStatisticsResponse instance) =>
    <String, dynamic>{
      'copytrading_statistics': instance.copytradingStatistics,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
