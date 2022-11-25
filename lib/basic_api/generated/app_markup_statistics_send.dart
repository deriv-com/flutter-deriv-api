/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_markup_statistics_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// App markup statistics request class.
class AppMarkupStatisticsRequest extends Request {
  /// Initialize AppMarkupStatisticsRequest.
  const AppMarkupStatisticsRequest({
    this.appMarkupStatistics = true,
    required this.dateFrom,
    required this.dateTo,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'app_markup_statistics',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory AppMarkupStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      AppMarkupStatisticsRequest(
        appMarkupStatistics: json['app_markup_statistics'] == null
            ? null
            : json['app_markup_statistics'] == 1,
        dateFrom: json['date_from'] as String?,
        dateTo: json['date_to'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? appMarkupStatistics;

  /// Start date (epoch or YYYY-MM-DD HH:MM:SS). Results are inclusive of this time.
  final String? dateFrom;

  /// End date (epoch or YYYY-MM-DD HH::MM::SS). Results are inclusive of this time.
  final String? dateTo;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_markup_statistics': appMarkupStatistics == null
            ? null
            : appMarkupStatistics!
                ? 1
                : 0,
        'date_from': dateFrom,
        'date_to': dateTo,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppMarkupStatisticsRequest copyWith({
    bool? appMarkupStatistics,
    String? dateFrom,
    String? dateTo,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AppMarkupStatisticsRequest(
        appMarkupStatistics: appMarkupStatistics ?? this.appMarkupStatistics,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
