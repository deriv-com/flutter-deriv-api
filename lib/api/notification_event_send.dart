/// Autogenerated from flutter_deriv_api|lib/api/notification_event_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'notification_event_send.g.dart';

///
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NotificationEventRequest extends Request {
  ///
  NotificationEventRequest(
      {this.category,
      this.event,
      this.notificationEvent,
      int reqId,
      Map<String, dynamic> passthrough})
      : super(reqId: reqId, passthrough: passthrough);

  /// Instance from JSON
  factory NotificationEventRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationEventRequestFromJson(json);

  /// Instance to JSON
  @override
  Map<String, dynamic> toJson() => _$NotificationEventRequestToJson(this);

  // Properties
  /// The category or nature of the event.
  String category;

  /// The name of the event.
  String event;

  /// Must be `1`
  int notificationEvent;
}
