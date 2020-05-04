import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Contains limitation information for a market
class AccountMarketLimitsModel extends APIBaseModel {
  /// Initializes
  AccountMarketLimitsModel({
    this.name,
    this.payoutLimit,
    this.profileName,
    this.turnoverLimit,
  });

  /// Generate an instance from json
  factory AccountMarketLimitsModel.fromJson(Map<String, dynamic> json) =>
      AccountMarketLimitsModel(
        name: json['name'],
        payoutLimit: json['payout_limit']?.toDouble(),
        profileName: json['profile_name'],
        turnoverLimit: json['turnover_limit']?.toDouble(),
      );

  /// The submarket display name.
  final String name;

  /// The limit of payout for the submarket
  final double payoutLimit;

  /// The limitation profile name.
  final String profileName;

  /// The limit of turnover for the submarket
  final double turnoverLimit;

  /// Generate a copy of instance with given parameters
  AccountMarketLimitsModel copyWith({
    String name,
    double payoutLimit,
    String profileName,
    double turnoverLimit,
  }) =>
      AccountMarketLimitsModel(
        name: name ?? this.name,
        payoutLimit: payoutLimit ?? this.payoutLimit,
        profileName: profileName ?? this.profileName,
        turnoverLimit: turnoverLimit ?? this.turnoverLimit,
      );
}
