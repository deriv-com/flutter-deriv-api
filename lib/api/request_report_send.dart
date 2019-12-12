/// Autogenerated from flutter_deriv_api|lib/api/request_report_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'request_report_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class RequestReportRequest {
  RequestReportRequest(
      {this.dateFrom,
      this.dateTo,
      this.passthrough,
      this.reportType,
      this.reqId,
      this.requestReport});
  factory RequestReportRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestReportRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RequestReportRequestToJson(this);

  // Properties
  /// Start date of the report
  int dateFrom;

  /// End date of the report
  int dateTo;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// Type of report to be sent to client's registered e-mail address
  String reportType;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Must be `1`
  int requestReport;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
