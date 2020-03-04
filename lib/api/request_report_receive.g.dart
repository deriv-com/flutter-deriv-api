// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_report_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestReportResponse _$RequestReportResponseFromJson(
    Map<String, dynamic> json) {
  return RequestReportResponse(
    requestReport: json['request_report'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RequestReportResponseToJson(
        RequestReportResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'request_report': instance.requestReport,
    };
