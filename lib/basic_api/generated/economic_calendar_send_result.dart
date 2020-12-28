/// Economic calendar send model class
abstract class EconomicCalendarSendModel {
  /// Initializes
  EconomicCalendarSendModel({
    @required this.economicCalendar,
    this.currency,
    this.endDate,
    this.startDate,
  });

  /// Must be `1`
  final int economicCalendar;

  /// [Optional] Currency symbol.
  final String currency;

  /// [Optional] End date.
  final int endDate;

  /// [Optional] Start date.
  final int startDate;
}

/// Economic calendar send class
class EconomicCalendarSend extends EconomicCalendarSendModel {
  /// Initializes
  EconomicCalendarSend({
    @required int economicCalendar,
    String currency,
    int endDate,
    int startDate,
  }) : super(
          economicCalendar: economicCalendar,
          currency: currency,
          endDate: endDate,
          startDate: startDate,
        );

  /// Creates an instance from JSON
  factory EconomicCalendarSend.fromJson(Map<String, dynamic> json) =>
      EconomicCalendarSend(
        economicCalendar: json['economic_calendar'],
        currency: json['currency'],
        endDate: json['end_date'],
        startDate: json['start_date'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['economic_calendar'] = economicCalendar;
    result['currency'] = currency;
    result['end_date'] = endDate;
    result['start_date'] = startDate;

    return result;
  }

  /// Creates a copy of instance with given parameters
  EconomicCalendarSend copyWith({
    int economicCalendar,
    String currency,
    int endDate,
    int startDate,
  }) =>
      EconomicCalendarSend(
        economicCalendar: economicCalendar ?? this.economicCalendar,
        currency: currency ?? this.currency,
        endDate: endDate ?? this.endDate,
        startDate: startDate ?? this.startDate,
      );
}
