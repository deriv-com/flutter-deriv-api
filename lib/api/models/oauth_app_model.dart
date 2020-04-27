import 'base_model.dart';

/// Model class for OAuth application that used for the authorized account
abstract class OauthAppModel extends BaseModel {
  /// Initializes
  OauthAppModel({
    this.appId,
    this.appMarkupPercentage,
    this.lastUsed,
    this.name,
    this.scopes,
  });

  /// Application ID.
  final int appId;

  /// Markup added to contract prices (as a percentage of contract payout)
  final double appMarkupPercentage;

  /// The last date which the application has been used.
  final DateTime lastUsed;

  /// Application name
  final String name;

  // TODO(ramin): Change to enum later
  /// The list of permission scopes grant for each app.
  final List<String> scopes;
}
