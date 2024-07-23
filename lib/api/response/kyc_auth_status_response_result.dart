// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Kyc auth status response model class.
abstract class KycAuthStatusResponseModel {
  /// Initializes Kyc auth status response model class .
  const KycAuthStatusResponseModel({
    this.kycAuthStatus,
  });

  /// Proof of Identity (POI) and Proof of Address (POA) authentication status details.
  final Map<String, dynamic>? kycAuthStatus;
}

/// Kyc auth status response class.
class KycAuthStatusResponse extends KycAuthStatusResponseModel {
  /// Initializes Kyc auth status response class.
  const KycAuthStatusResponse({
    super.kycAuthStatus,
  });

  /// Creates an instance from JSON.
  factory KycAuthStatusResponse.fromJson(
    dynamic kycAuthStatusJson,
  ) =>
      KycAuthStatusResponse(
        kycAuthStatus: kycAuthStatusJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['kyc_auth_status'] = kycAuthStatus;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  KycAuthStatusResponse copyWith({
    Map<String, dynamic>? kycAuthStatus,
  }) =>
      KycAuthStatusResponse(
        kycAuthStatus: kycAuthStatus ?? this.kycAuthStatus,
      );
}
