// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Confirm email response model class.
abstract class ConfirmEmailResponseModel {
  /// Initializes Confirm email response model class .
  const ConfirmEmailResponseModel({
    this.confirmEmail,
  });

  /// 1 for success (The verification code has been successfully verified)
  final bool? confirmEmail;
}

/// Confirm email response class.
class ConfirmEmailResponse extends ConfirmEmailResponseModel {
  /// Initializes Confirm email response class.
  const ConfirmEmailResponse({
    super.confirmEmail,
  });

  /// Creates an instance from JSON.
  factory ConfirmEmailResponse.fromJson(
    dynamic confirmEmailJson,
  ) =>
      ConfirmEmailResponse(
        confirmEmail: getBool(confirmEmailJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['confirm_email'] = confirmEmail;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ConfirmEmailResponse copyWith({
    bool? confirmEmail,
  }) =>
      ConfirmEmailResponse(
        confirmEmail: confirmEmail ?? this.confirmEmail,
      );
}
