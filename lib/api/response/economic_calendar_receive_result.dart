import '../../helpers/helpers.dart';

/// Economic calendar response model class
abstract class EconomicCalendarResponseModel {
  /// Initializes
  EconomicCalendarResponseModel({
    this.economicCalendar,
  });

  /// Economic calendar.
  final EconomicCalendar? economicCalendar;
}

/// Economic calendar response class
class EconomicCalendarResponse extends EconomicCalendarResponseModel {
  /// Initializes
  EconomicCalendarResponse({
    EconomicCalendar? economicCalendar,
  }) : super(
          economicCalendar: economicCalendar,
        );

  /// Creates an instance from JSON
  factory EconomicCalendarResponse.fromJson(
    dynamic economicCalendarJson,
  ) =>
      EconomicCalendarResponse(
        economicCalendar: economicCalendarJson == null
            ? null
            : EconomicCalendar.fromJson(economicCalendarJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (economicCalendar != null) {
      resultMap['economic_calendar'] = economicCalendar!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  EconomicCalendarResponse copyWith({
    EconomicCalendar? economicCalendar,
  }) =>
      EconomicCalendarResponse(
        economicCalendar: economicCalendar ?? this.economicCalendar,
      );
}
/// Economic calendar model class
abstract class EconomicCalendarModel {
  /// Initializes
  EconomicCalendarModel({
    this.events,
  });

  /// Array of economic events
  final List<EventsItem>? events;
}

/// Economic calendar class
class EconomicCalendar extends EconomicCalendarModel {
  /// Initializes
  EconomicCalendar({
    List<EventsItem>? events,
  }) : super(
          events: events,
        );

  /// Creates an instance from JSON
  factory EconomicCalendar.fromJson(Map<String, dynamic> json) =>
      EconomicCalendar(
        events: json['events'] == null
            ? null
            : List<EventsItem>.from(
                json['events']?.map(
                  (dynamic item) => EventsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (events != null) {
      resultMap['events'] = events!
          .map<dynamic>(
            (EventsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  EconomicCalendar copyWith({
    List<EventsItem>? events,
  }) =>
      EconomicCalendar(
        events: events ?? this.events,
      );
}
/// Events item model class
abstract class EventsItemModel {
  /// Initializes
  EventsItemModel({
    this.actual,
    this.currency,
    this.eventName,
    this.forecast,
    this.impact,
    this.previous,
    this.releaseDate,
  });

  /// Actual value.
  final Actual? actual;

  /// Currency symbol.
  final String? currency;

  /// Event name.
  final String? eventName;

  /// Forecasted value.
  final Forecast? forecast;

  /// Impact.
  final int? impact;

  /// Previous value.
  final Previous? previous;

  /// Release date.
  final DateTime? releaseDate;
}

/// Events item class
class EventsItem extends EventsItemModel {
  /// Initializes
  EventsItem({
    Actual? actual,
    String? currency,
    String? eventName,
    Forecast? forecast,
    int? impact,
    Previous? previous,
    DateTime? releaseDate,
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
  factory EventsItem.fromJson(Map<String, dynamic> json) => EventsItem(
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
        releaseDate: getDateTime(json['release_date']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (actual != null) {
      resultMap['actual'] = actual!.toJson();
    }
    resultMap['currency'] = currency;
    resultMap['event_name'] = eventName;
    if (forecast != null) {
      resultMap['forecast'] = forecast!.toJson();
    }
    resultMap['impact'] = impact;
    if (previous != null) {
      resultMap['previous'] = previous!.toJson();
    }
    resultMap['release_date'] = getSecondsSinceEpochDateTime(releaseDate);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  EventsItem copyWith({
    Actual? actual,
    String? currency,
    String? eventName,
    Forecast? forecast,
    int? impact,
    Previous? previous,
    DateTime? releaseDate,
  }) =>
      EventsItem(
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
    this.displayValue,
  });

  /// Actual value.
  final String? displayValue;
}

/// Actual class
class Actual extends ActualModel {
  /// Initializes
  Actual({
    String? displayValue,
  }) : super(
          displayValue: displayValue,
        );

  /// Creates an instance from JSON
  factory Actual.fromJson(Map<String, dynamic> json) => Actual(
        displayValue: json['display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_value'] = displayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Actual copyWith({
    String? displayValue,
  }) =>
      Actual(
        displayValue: displayValue ?? this.displayValue,
      );
}
/// Forecast model class
abstract class ForecastModel {
  /// Initializes
  ForecastModel({
    this.displayValue,
  });

  /// Forecasted value.
  final String? displayValue;
}

/// Forecast class
class Forecast extends ForecastModel {
  /// Initializes
  Forecast({
    String? displayValue,
  }) : super(
          displayValue: displayValue,
        );

  /// Creates an instance from JSON
  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        displayValue: json['display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_value'] = displayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Forecast copyWith({
    String? displayValue,
  }) =>
      Forecast(
        displayValue: displayValue ?? this.displayValue,
      );
}
/// Previous model class
abstract class PreviousModel {
  /// Initializes
  PreviousModel({
    this.displayValue,
  });

  /// Previous value.
  final String? displayValue;
}

/// Previous class
class Previous extends PreviousModel {
  /// Initializes
  Previous({
    String? displayValue,
  }) : super(
          displayValue: displayValue,
        );

  /// Creates an instance from JSON
  factory Previous.fromJson(Map<String, dynamic> json) => Previous(
        displayValue: json['display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_value'] = displayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Previous copyWith({
    String? displayValue,
  }) =>
      Previous(
        displayValue: displayValue ?? this.displayValue,
      );
}
