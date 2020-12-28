/// P2p advertiser stats send model class
abstract class P2pAdvertiserStatsSendModel {
  /// Initializes
  P2pAdvertiserStatsSendModel({
    @required this.p2pAdvertiserStats,
    this.days,
    this.id,
  });

  /// Must be 1
  final int p2pAdvertiserStats;

  /// [Optional] The time period to create statistics for, in days. If not provided, 30 days will be used.
  final int days;

  /// [Optional] The unique identifier for this advertiser. If not provided, returns advertiser statistics of the current account.
  final String id;
}

/// P2p advertiser stats send class
class P2pAdvertiserStatsSend extends P2pAdvertiserStatsSendModel {
  /// Initializes
  P2pAdvertiserStatsSend({
    @required int p2pAdvertiserStats,
    int days,
    String id,
  }) : super(
          p2pAdvertiserStats: p2pAdvertiserStats,
          days: days,
          id: id,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserStatsSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserStatsSend(
        p2pAdvertiserStats: json['p2p_advertiser_stats'],
        days: json['days'],
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advertiser_stats'] = p2pAdvertiserStats;
    result['days'] = days;
    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserStatsSend copyWith({
    int p2pAdvertiserStats,
    int days,
    String id,
  }) =>
      P2pAdvertiserStatsSend(
        p2pAdvertiserStats: p2pAdvertiserStats ?? this.p2pAdvertiserStats,
        days: days ?? this.days,
        id: id ?? this.id,
      );
}
