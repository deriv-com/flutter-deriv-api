import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

/// Model class for OAuth application that used for the authorized account
abstract class OauthAppModel extends APIBaseModel {
  /// Initializes
  OauthAppModel({
    this.appId,
    this.appMarkupPercentage,
    this.lastUsed,
    this.name,
    this.scopes,
  });

  /// Application ID.
  final int? appId;

  /// Markup added to contract prices (as a percentage of contract payout)
  final double? appMarkupPercentage;

  /// The last date which the application has been used.
  final DateTime? lastUsed;

  /// Application name
  final String? name;

  /// The list of permission scopes grant for each app.
  final List<TokenScope?>? scopes;
}
