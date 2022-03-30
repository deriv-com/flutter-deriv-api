import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Copier mode class
class CopierModel extends APIBaseModel {
  /// Initializes
  CopierModel({this.loginId});

  /// Creates an instance from JSON
  factory CopierModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CopierModel(
        loginId: json['loginid'],
      );

  /// The loginId of the copier's account.
  final String? loginId;

  /// Generate a copy of instance with given parameters
  CopierModel copyWith({
    String? loginId,
  }) =>
      CopierModel(
        loginId: loginId ?? this.loginId,
      );
}
