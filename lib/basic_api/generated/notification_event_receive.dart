/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/notification_event_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Notification event receive class.
class NotificationEventReceive extends Response {
  /// Initialize NotificationEventReceive.
  const NotificationEventReceive({
    this.notificationEvent,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory NotificationEventReceive.fromJson(Map<String, dynamic> json) =>
      NotificationEventReceive(
        notificationEvent: json['notification_event'] == null
            ? null
            : json['notification_event'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `true`: all actions finished successfully, `false`: at least one or more actions failed.
  final bool? notificationEvent;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'notification_event': notificationEvent == null
            ? null
            : notificationEvent!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NotificationEventReceive copyWith({
    bool? notificationEvent,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      NotificationEventReceive(
        notificationEvent: notificationEvent ?? this.notificationEvent,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
