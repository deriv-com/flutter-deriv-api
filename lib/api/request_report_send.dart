/// generated automatically from flutter_deriv_api|lib/api/request_report_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'request_report_send.g.dart';

/// JSON conversion for 'request_report_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RequestReportRequest extends Request {
  /// Initialize RequestReportRequest
  const RequestReportRequest({
    this.dateFrom,
    this.dateTo,
    this.reportType,
    this.requestReport = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory RequestReportRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestReportRequestFromJson(json);

  // Properties
  /// Start date of the report
  final int dateFrom;

  /// End date of the report
  final int dateTo;

  /// Type of report to be sent to client's registered e-mail address
  final String reportType;

  /// Must be `1`
  final int requestReport;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$RequestReportRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  RequestReportRequest copyWith({
    int dateFrom,
    int dateTo,
    String reportType,
    int requestReport,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      RequestReportRequest(
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        reportType: reportType ?? this.reportType,
        requestReport: requestReport ?? this.requestReport,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
