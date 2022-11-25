/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_markup_statistics_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// App markup statistics receive class.
class AppMarkupStatisticsReceive extends Response {
  /// Initialize AppMarkupStatisticsReceive.
  const AppMarkupStatisticsReceive({
    this.appMarkupStatistics,
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
  factory AppMarkupStatisticsReceive.fromJson(Map<String, dynamic> json) =>
      AppMarkupStatisticsReceive(
        appMarkupStatistics:
            json['app_markup_statistics'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// App Markup transaction statistics
  final Map<String, dynamic>? appMarkupStatistics;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_markup_statistics': appMarkupStatistics,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppMarkupStatisticsReceive copyWith({
    Map<String, dynamic>? appMarkupStatistics,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AppMarkupStatisticsReceive(
        appMarkupStatistics: appMarkupStatistics ?? this.appMarkupStatistics,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
