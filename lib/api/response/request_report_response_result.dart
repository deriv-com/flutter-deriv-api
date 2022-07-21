// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Request report response model class.
abstract class RequestReportResponseModel {
  /// Initializes Request report response model class .
  const RequestReportResponseModel({
    this.requestReport,
  });

  /// Response of request report
  final RequestReport? requestReport;
}

/// Request report response class.
class RequestReportResponse extends RequestReportResponseModel {
  /// Initializes Request report response class.
  const RequestReportResponse({
    RequestReport? requestReport,
  }) : super(
          requestReport: requestReport,
        );

  /// Creates an instance from JSON.
  factory RequestReportResponse.fromJson(
    dynamic requestReportJson,
  ) =>
      RequestReportResponse(
        requestReport: requestReportJson == null
            ? null
            : RequestReport.fromJson(requestReportJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (requestReport != null) {
      resultMap['request_report'] = requestReport!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequestReportResponse copyWith({
    RequestReport? requestReport,
  }) =>
      RequestReportResponse(
        requestReport: requestReport ?? this.requestReport,
      );
}
/// Request report model class.
abstract class RequestReportModel {
  /// Initializes Request report model class .
  const RequestReportModel({
    this.reportStatus,
  });

  /// `1` indicates that report will be e-mailed, otherwise an error with error_code and error_message will be returned
  final int? reportStatus;
}

/// Request report class.
class RequestReport extends RequestReportModel {
  /// Initializes Request report class.
  const RequestReport({
    int? reportStatus,
  }) : super(
          reportStatus: reportStatus,
        );

  /// Creates an instance from JSON.
  factory RequestReport.fromJson(Map<String, dynamic> json) => RequestReport(
        reportStatus: json['report_status'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['report_status'] = reportStatus;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequestReport copyWith({
    int? reportStatus,
  }) =>
      RequestReport(
        reportStatus: reportStatus ?? this.reportStatus,
      );
}
