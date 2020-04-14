/// generated automatically from flutter_deriv_api|lib/api/notification_event_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'notification_event_send.g.dart';

/// JSON conversion for 'notification_event_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NotificationEventRequest extends Request {
  /// Initialize NotificationEventRequest
  const NotificationEventRequest({
    this.category,
    this.event,
    this.notificationEvent = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory NotificationEventRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationEventRequestFromJson(json);

  // Properties
  /// The category or nature of the event.
  final String category;

  /// The name of the event.
  final String event;

  /// Must be `1`
  final int notificationEvent;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NotificationEventRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  NotificationEventRequest copyWith({
    String category,
    String event,
    int notificationEvent,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      NotificationEventRequest(
        category: category ?? this.category,
        event: event ?? this.event,
        notificationEvent: notificationEvent ?? this.notificationEvent,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
