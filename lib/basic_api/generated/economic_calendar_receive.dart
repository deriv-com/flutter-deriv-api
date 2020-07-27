/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/economic_calendar_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'economic_calendar_receive.g.dart';

/// JSON conversion for 'economic_calendar_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class EconomicCalendarResponse extends Response {
  /// Initialize EconomicCalendarResponse
  const EconomicCalendarResponse({
    this.economicCalendar,
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

  /// Creates an instance from JSON
  factory EconomicCalendarResponse.fromJson(Map<String, dynamic> json) =>
      _$EconomicCalendarResponseFromJson(json);

  /// Economic calendar.
  final Map<String, dynamic> economicCalendar;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$EconomicCalendarResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  EconomicCalendarResponse copyWith({
    Map<String, dynamic> economicCalendar,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      EconomicCalendarResponse(
        economicCalendar: economicCalendar ?? this.economicCalendar,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
