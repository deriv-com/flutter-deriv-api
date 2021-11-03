/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/economic_calendar_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Economic calendar receive class.
class EconomicCalendarReceive extends Response {
  /// Initialize EconomicCalendarReceive.
  const EconomicCalendarReceive({
    this.economicCalendar,
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
  factory EconomicCalendarReceive.fromJson(Map<String, dynamic> json) =>
      EconomicCalendarReceive(
        economicCalendar: json['economic_calendar'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Economic calendar.
  final Map<String, dynamic>? economicCalendar;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'economic_calendar': economicCalendar,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  EconomicCalendarReceive copyWith({
    Map<String, dynamic>? economicCalendar,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      EconomicCalendarReceive(
        economicCalendar: economicCalendar ?? this.economicCalendar,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
