/// generated automatically from flutter_deriv_api|lib/api/notification_event_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'notification_event_receive.g.dart';

/// JSON conversion for 'notification_event_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NotificationEventResponse extends Response {
  /// Initialize NotificationEventResponse
  const NotificationEventResponse({
    this.notificationEvent,
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

  /// Creates instance from JSON
  factory NotificationEventResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationEventResponseFromJson(json);

  // Properties
  /// `1`: all actions finished successfully, `0`: at least one or more actions failed.
  final int notificationEvent;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NotificationEventResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  NotificationEventResponse copyWith({
    int notificationEvent,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      NotificationEventResponse(
        notificationEvent: notificationEvent ?? this.notificationEvent,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
