// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_report_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestReportResponse _$RequestReportResponseFromJson(
    Map<String, dynamic> json) {
  return RequestReportResponse(
    requestReport: json['request_report'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$RequestReportResponseToJson(
        RequestReportResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'request_report': instance.requestReport,
    };
