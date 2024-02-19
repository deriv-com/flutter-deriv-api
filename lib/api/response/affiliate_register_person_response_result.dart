// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Affiliate register person response model class.
abstract class AffiliateRegisterPersonResponseModel {
  /// Initializes Affiliate register person response model class .
  const AffiliateRegisterPersonResponseModel({
    this.success,
  });

  /// Affiliate was successfully added, `false`:unsuccessful `true`:successful
  final bool? success;
}

/// Affiliate register person response class.
class AffiliateRegisterPersonResponse
    extends AffiliateRegisterPersonResponseModel {
  /// Initializes Affiliate register person response class.
  const AffiliateRegisterPersonResponse({
    super.success,
  });

  /// Creates an instance from JSON.
  factory AffiliateRegisterPersonResponse.fromJson(
    dynamic successJson,
  ) =>
      AffiliateRegisterPersonResponse(
        success: getBool(successJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['success'] = success;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AffiliateRegisterPersonResponse copyWith({
    bool? success,
  }) =>
      AffiliateRegisterPersonResponse(
        success: success ?? this.success,
      );
}
