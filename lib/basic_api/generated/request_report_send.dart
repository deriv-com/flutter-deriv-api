/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/request_report_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Request report request class.
class RequestReportRequest extends Request {
  /// Initialize RequestReportRequest.
  const RequestReportRequest({
    required this.dateFrom,
    required this.dateTo,
    this.loginid,
    required this.reportType,
    this.requestReport = true,
    super.msgType = 'request_report',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory RequestReportRequest.fromJson(Map<String, dynamic> json) =>
      RequestReportRequest(
        dateFrom: json['date_from'] as int?,
        dateTo: json['date_to'] as int?,
        loginid: json['loginid'] as String?,
        reportType: json['report_type'] as String?,
        requestReport:
            json['request_report'] == null ? null : json['request_report'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Start date of the report
  final int? dateFrom;

  /// End date of the report
  final int? dateTo;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Type of report to be sent to client's registered e-mail address
  final String? reportType;

  /// Must be `true`
  final bool? requestReport;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date_from': dateFrom,
        'date_to': dateTo,
        'loginid': loginid,
        'report_type': reportType,
        'request_report': requestReport == null
            ? null
            : requestReport!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  RequestReportRequest copyWith({
    int? dateFrom,
    int? dateTo,
    String? loginid,
    String? reportType,
    bool? requestReport,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      RequestReportRequest(
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        loginid: loginid ?? this.loginid,
        reportType: reportType ?? this.reportType,
        requestReport: requestReport ?? this.requestReport,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
