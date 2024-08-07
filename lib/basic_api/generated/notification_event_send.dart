/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/notification_event_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Notification event request class.
class NotificationEventRequest extends Request {
  /// Initialize NotificationEventRequest.
  const NotificationEventRequest({
    required this.args,
    required this.category,
    required this.event,
    this.loginid,
    this.notificationEvent = true,
    super.msgType = 'notification_event',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory NotificationEventRequest.fromJson(Map<String, dynamic> json) =>
      NotificationEventRequest(
        args: json['args'] as Map<String, dynamic>?,
        category: json['category'] as String?,
        event: json['event'] as String?,
        loginid: json['loginid'] as String?,
        notificationEvent: json['notification_event'] == null
            ? null
            : json['notification_event'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Event arguments.
  final Map<String, dynamic>? args;

  /// The category or nature of the event.
  final String? category;

  /// The name of the event.
  final String? event;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? notificationEvent;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'args': args,
        'category': category,
        'event': event,
        'loginid': loginid,
        'notification_event': notificationEvent == null
            ? null
            : notificationEvent!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NotificationEventRequest copyWith({
    Map<String, dynamic>? args,
    String? category,
    String? event,
    String? loginid,
    bool? notificationEvent,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      NotificationEventRequest(
        args: args ?? this.args,
        category: category ?? this.category,
        event: event ?? this.event,
        loginid: loginid ?? this.loginid,
        notificationEvent: notificationEvent ?? this.notificationEvent,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
