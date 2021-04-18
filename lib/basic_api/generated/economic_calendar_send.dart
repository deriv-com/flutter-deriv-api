/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/economic_calendar_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Economic calendar request class
class EconomicCalendarRequest extends Request {
  /// Initialize EconomicCalendarRequest
  const EconomicCalendarRequest({
    this.currency,
    this.economicCalendar = true,
    this.endDate,
    this.startDate,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'economic_calendar',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory EconomicCalendarRequest.fromJson(Map<String, dynamic> json) =>
      EconomicCalendarRequest(
        currency: json['currency'] as String?,
        economicCalendar: json['economic_calendar'] == null
            ? null
            : json['economic_calendar'] == 1,
        endDate: json['end_date'] as int?,
        startDate: json['start_date'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Currency symbol.
  final String? currency;

  /// Must be `true`
  final bool? economicCalendar;

  /// [Optional] End date.
  final int? endDate;

  /// [Optional] Start date.
  final int? startDate;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'currency': currency,
        'economic_calendar': economicCalendar == null
            ? null
            : economicCalendar!
                ? 1
                : 0,
        'end_date': endDate,
        'start_date': startDate,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  EconomicCalendarRequest copyWith({
    String? currency,
    bool? economicCalendar,
    int? endDate,
    int? startDate,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      EconomicCalendarRequest(
        currency: currency ?? this.currency,
        economicCalendar: economicCalendar ?? this.economicCalendar,
        endDate: endDate ?? this.endDate,
        startDate: startDate ?? this.startDate,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
