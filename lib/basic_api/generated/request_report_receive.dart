/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/request_report_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Request report receive class.
class RequestReportReceive extends Response {
  /// Initialize RequestReportReceive.
  const RequestReportReceive({
    this.requestReport,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory RequestReportReceive.fromJson(Map<String, dynamic> json) =>
      RequestReportReceive(
        requestReport: json['request_report'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Response of request report
  final Map<String, dynamic>? requestReport;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'request_report': requestReport,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RequestReportReceive copyWith({
    Map<String, dynamic>? requestReport,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      RequestReportReceive(
        requestReport: requestReport ?? this.requestReport,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
