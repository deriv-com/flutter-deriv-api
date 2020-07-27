/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/economic_calendar_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'economic_calendar_send.g.dart';

/// JSON conversion for 'economic_calendar_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class EconomicCalendarRequest extends Request {
  /// Initialize EconomicCalendarRequest
  const EconomicCalendarRequest({
    this.currency,
    this.economicCalendar = 1,
    this.endDate,
    this.startDate,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'economic_calendar',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory EconomicCalendarRequest.fromJson(Map<String, dynamic> json) =>
      _$EconomicCalendarRequestFromJson(json);

  /// [Optional] Currency symbol.
  final String currency;

  /// Must be `1`
  final int economicCalendar;

  /// [Optional] End date.
  final int endDate;

  /// [Optional] Start date.
  final int startDate;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$EconomicCalendarRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  EconomicCalendarRequest copyWith({
    String currency,
    int economicCalendar,
    int endDate,
    int startDate,
    Map<String, dynamic> passthrough,
    int reqId,
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
  List<Object> get props => null;
}
