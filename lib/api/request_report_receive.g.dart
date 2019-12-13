// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_report_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestReportResponse _$RequestReportResponseFromJson(
    Map<String, dynamic> json) {
  return RequestReportResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    requestReport: json['request_report'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RequestReportResponseToJson(
        RequestReportResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'request_report': instance.requestReport,
    };
