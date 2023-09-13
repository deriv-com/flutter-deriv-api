// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Unsubscribe email response model class.
abstract class UnsubscribeEmailResponseModel {
  /// Initializes Unsubscribe email response model class .
  const UnsubscribeEmailResponseModel({
    this.binaryUserId,
    this.emailUnsubscribeStatus,
  });

  /// Customer User ID.
  final double? binaryUserId;

  /// `true`: email notification unsubscribed sucssesfully, `false`: failed to unsubscribed email notification
  final bool? emailUnsubscribeStatus;
}

/// Unsubscribe email response class.
class UnsubscribeEmailResponse extends UnsubscribeEmailResponseModel {
  /// Initializes Unsubscribe email response class.
  const UnsubscribeEmailResponse({
    double? binaryUserId,
    bool? emailUnsubscribeStatus,
  }) : super(
          binaryUserId: binaryUserId,
          emailUnsubscribeStatus: emailUnsubscribeStatus,
        );

  /// Creates an instance from JSON.
  factory UnsubscribeEmailResponse.fromJson(
    dynamic binaryUserIdJson,
    dynamic emailUnsubscribeStatusJson,
  ) =>
      UnsubscribeEmailResponse(
        binaryUserId: getDouble(binaryUserIdJson),
        emailUnsubscribeStatus: getBool(emailUnsubscribeStatusJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['binary_user_id'] = binaryUserId;
    resultMap['email_unsubscribe_status'] = emailUnsubscribeStatus;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  UnsubscribeEmailResponse copyWith({
    double? binaryUserId,
    bool? emailUnsubscribeStatus,
  }) =>
      UnsubscribeEmailResponse(
        binaryUserId: binaryUserId ?? this.binaryUserId,
        emailUnsubscribeStatus:
            emailUnsubscribeStatus ?? this.emailUnsubscribeStatus,
      );
}
