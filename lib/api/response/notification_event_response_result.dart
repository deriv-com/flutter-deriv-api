// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Notification event response model class.
abstract class NotificationEventResponseModel extends Equatable {
  /// Initializes Notification event response model class .
  const NotificationEventResponseModel({
    this.notificationEvent,
  });

  /// `true`: all actions finished successfully, `false`: at least one or more actions failed.
  final bool? notificationEvent;
}

/// Notification event response class.
class NotificationEventResponse extends NotificationEventResponseModel {
  /// Initializes Notification event response class.
  const NotificationEventResponse({
    bool? notificationEvent,
  }) : super(
          notificationEvent: notificationEvent,
        );

  /// Creates an instance from JSON.
  factory NotificationEventResponse.fromJson(
    dynamic notificationEventJson,
  ) =>
      NotificationEventResponse(
        notificationEvent: getBool(notificationEventJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['notification_event'] = notificationEvent;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  NotificationEventResponse copyWith({
    bool? notificationEvent,
  }) =>
      NotificationEventResponse(
        notificationEvent: notificationEvent ?? this.notificationEvent,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
