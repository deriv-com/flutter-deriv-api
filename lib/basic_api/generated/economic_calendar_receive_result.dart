/// Economic calendar receive model class
abstract class EconomicCalendarReceiveModel {
  /// Initializes
  EconomicCalendarReceiveModel({
    @required this.economicCalendar,
  });

  /// Economic calendar.
  final EconomicCalendar economicCalendar;
}

/// Economic calendar receive class
class EconomicCalendarReceive extends EconomicCalendarReceiveModel {
  /// Initializes
  EconomicCalendarReceive({
    @required EconomicCalendar economicCalendar,
  }) : super(
          economicCalendar: economicCalendar,
        );

  /// Creates an instance from JSON
  factory EconomicCalendarReceive.fromJson(Map<String, dynamic> json) =>
      EconomicCalendarReceive(
        economicCalendar: json['economic_calendar'] == null
            ? null
            : EconomicCalendar.fromJson(json['economic_calendar']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (economicCalendar != null) {
      result['economic_calendar'] = economicCalendar.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  EconomicCalendarReceive copyWith({
    EconomicCalendar economicCalendar,
  }) =>
      EconomicCalendarReceive(
        economicCalendar: economicCalendar ?? this.economicCalendar,
      );
}
/// Economic calendar model class
abstract class EconomicCalendarModel {
  /// Initializes
  EconomicCalendarModel({
    @required this.events,
  });

  /// Array of economic events
  final List<Event> events;
}

/// Economic calendar class
class EconomicCalendar extends EconomicCalendarModel {
  /// Initializes
  EconomicCalendar({
    @required List<Event> events,
  }) : super(
          events: events,
        );

  /// Creates an instance from JSON
  factory EconomicCalendar.fromJson(Map<String, dynamic> json) =>
      EconomicCalendar(
        events: json['events'] == null
            ? null
            : json['events']
                .map<Event>((dynamic item) => Event.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (events != null) {
      result['events'] = events.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  EconomicCalendar copyWith({
    List<Event> events,
  }) =>
      EconomicCalendar(
        events: events ?? this.events,
      );
}
/// Event model class
abstract class EventModel {
  /// Initializes
  EventModel({
    @required this.actual,
    @required this.currency,
    @required this.eventName,
    @required this.forecast,
    @required this.impact,
    @required this.previous,
    @required this.releaseDate,
  });

  /// Actual value.
  final Actual actual;

  /// Currency symbol.
  final String currency;

  /// Event name.
  final String eventName;

  /// Forecasted value.
  final Forecast forecast;

  /// Impact.
  final int impact;

  /// Previous value.
  final Previous previous;

  /// Release date.
  final int releaseDate;
}

/// Event class
class Event extends EventModel {
  /// Initializes
  Event({
    @required Actual actual,
    @required String currency,
    @required String eventName,
    @required Forecast forecast,
    @required int impact,
    @required Previous previous,
    @required int releaseDate,
  }) : super(
          actual: actual,
          currency: currency,
          eventName: eventName,
          forecast: forecast,
          impact: impact,
          previous: previous,
          releaseDate: releaseDate,
        );

  /// Creates an instance from JSON
  factory Event.fromJson(Map<String, dynamic> json) => Event(
        actual: json['actual'] == null ? null : Actual.fromJson(json['actual']),
        currency: json['currency'],
        eventName: json['event_name'],
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast']),
        impact: json['impact'],
        previous: json['previous'] == null
            ? null
            : Previous.fromJson(json['previous']),
        releaseDate: json['release_date'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (actual != null) {
      result['actual'] = actual.toJson();
    }
    result['currency'] = currency;
    result['event_name'] = eventName;
    if (forecast != null) {
      result['forecast'] = forecast.toJson();
    }
    result['impact'] = impact;
    if (previous != null) {
      result['previous'] = previous.toJson();
    }
    result['release_date'] = releaseDate;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Event copyWith({
    Actual actual,
    String currency,
    String eventName,
    Forecast forecast,
    int impact,
    Previous previous,
    int releaseDate,
  }) =>
      Event(
        actual: actual ?? this.actual,
        currency: currency ?? this.currency,
        eventName: eventName ?? this.eventName,
        forecast: forecast ?? this.forecast,
        impact: impact ?? this.impact,
        previous: previous ?? this.previous,
        releaseDate: releaseDate ?? this.releaseDate,
      );
}
/// Actual model class
abstract class ActualModel {
  /// Initializes
  ActualModel({
    @required this.displayValue,
  });

  /// Actual value.
  final String displayValue;
}

/// Actual class
class Actual extends ActualModel {
  /// Initializes
  Actual({
    @required String displayValue,
  }) : super(
          displayValue: displayValue,
        );

  /// Creates an instance from JSON
  factory Actual.fromJson(Map<String, dynamic> json) => Actual(
        displayValue: json['display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_value'] = displayValue;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Actual copyWith({
    String displayValue,
  }) =>
      Actual(
        displayValue: displayValue ?? this.displayValue,
      );
}
/// Forecast model class
abstract class ForecastModel {
  /// Initializes
  ForecastModel({
    @required this.displayValue,
  });

  /// Forecasted value.
  final String displayValue;
}

/// Forecast class
class Forecast extends ForecastModel {
  /// Initializes
  Forecast({
    @required String displayValue,
  }) : super(
          displayValue: displayValue,
        );

  /// Creates an instance from JSON
  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        displayValue: json['display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_value'] = displayValue;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Forecast copyWith({
    String displayValue,
  }) =>
      Forecast(
        displayValue: displayValue ?? this.displayValue,
      );
}
/// Previous model class
abstract class PreviousModel {
  /// Initializes
  PreviousModel({
    @required this.displayValue,
  });

  /// Previous value.
  final String displayValue;
}

/// Previous class
class Previous extends PreviousModel {
  /// Initializes
  Previous({
    @required String displayValue,
  }) : super(
          displayValue: displayValue,
        );

  /// Creates an instance from JSON
  factory Previous.fromJson(Map<String, dynamic> json) => Previous(
        displayValue: json['display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_value'] = displayValue;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Previous copyWith({
    String displayValue,
  }) =>
      Previous(
        displayValue: displayValue ?? this.displayValue,
      );
}
