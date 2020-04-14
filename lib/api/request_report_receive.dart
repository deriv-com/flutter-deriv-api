/// generated automatically from flutter_deriv_api|lib/api/request_report_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'request_report_receive.g.dart';

/// JSON conversion for 'request_report_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RequestReportResponse extends Response {
  /// Initialize RequestReportResponse
  const RequestReportResponse({
    this.requestReport,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory RequestReportResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestReportResponseFromJson(json);

  // Properties
  /// Response of request report
  final Map<String, dynamic> requestReport;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$RequestReportResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  RequestReportResponse copyWith({
    Map<String, dynamic> requestReport,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      RequestReportResponse(
        requestReport: requestReport ?? this.requestReport,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
