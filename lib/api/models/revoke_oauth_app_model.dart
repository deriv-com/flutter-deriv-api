import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Revoke oauth app model class
class RevokeOauthAppModel extends APIBaseModel {
  /// Initializes
  RevokeOauthAppModel({
    this.succeeded,
  });

  /// Creates instance from json
  factory RevokeOauthAppModel.fromJson(Map<String, dynamic> json) =>
      RevokeOauthAppModel(
        succeeded: getBool(json['revoke_oauth_app']),
      );

  /// `true` on success
  final bool succeeded;

  /// Creates copy of instance with given parameters
  RevokeOauthAppModel copyWith({
    int succeeded,
  }) =>
      RevokeOauthAppModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
