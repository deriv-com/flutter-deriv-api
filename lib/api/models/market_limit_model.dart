import 'base_model.dart';

/// Contains limitation information for a market
class MarketLimitModel extends BaseModel {
  /// Initializes
  MarketLimitModel({
    this.name,
    this.payoutLimit,
    this.profileName,
    this.turnoverLimit,
  });

  /// From JSON
  factory MarketLimitModel.fromJson(Map<String, dynamic> json) =>
      MarketLimitModel(
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

  /// Clones a new instance
  MarketLimitModel copyWith({
    String name,
    double payoutLimit,
    String profileName,
    double turnoverLimit,
  }) =>
      MarketLimitModel(
        name: name ?? this.name,
        payoutLimit: payoutLimit ?? this.payoutLimit,
        profileName: profileName ?? this.profileName,
        turnoverLimit: turnoverLimit ?? this.turnoverLimit,
      );
}
