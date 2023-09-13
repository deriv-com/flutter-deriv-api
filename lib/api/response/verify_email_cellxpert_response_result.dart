// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Verify email cellxpert response model class.
abstract class VerifyEmailCellxpertResponseModel {
  /// Initializes Verify email cellxpert response model class .
  const VerifyEmailCellxpertResponseModel({
    this.verifyEmailCellxpert,
  });

  /// 1 for success (secure code has been sent to the email address)
  final bool? verifyEmailCellxpert;
}

/// Verify email cellxpert response class.
class VerifyEmailCellxpertResponse extends VerifyEmailCellxpertResponseModel {
  /// Initializes Verify email cellxpert response class.
  const VerifyEmailCellxpertResponse({
    bool? verifyEmailCellxpert,
  }) : super(
          verifyEmailCellxpert: verifyEmailCellxpert,
        );

  /// Creates an instance from JSON.
  factory VerifyEmailCellxpertResponse.fromJson(
    dynamic verifyEmailCellxpertJson,
  ) =>
      VerifyEmailCellxpertResponse(
        verifyEmailCellxpert: getBool(verifyEmailCellxpertJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['verify_email_cellxpert'] = verifyEmailCellxpert;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  VerifyEmailCellxpertResponse copyWith({
    bool? verifyEmailCellxpert,
  }) =>
      VerifyEmailCellxpertResponse(
        verifyEmailCellxpert: verifyEmailCellxpert ?? this.verifyEmailCellxpert,
      );
}
