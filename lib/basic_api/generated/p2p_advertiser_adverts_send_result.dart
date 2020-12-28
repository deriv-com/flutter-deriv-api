/// P2p advertiser adverts send model class
abstract class P2pAdvertiserAdvertsSendModel {
  /// Initializes
  P2pAdvertiserAdvertsSendModel({
    @required this.p2pAdvertiserAdverts,
    this.limit,
    this.offset,
  });

  /// Must be 1
  final int p2pAdvertiserAdverts;

  /// [Optional] Used for paging.
  final int limit;

  /// [Optional] Used for paging.
  final int offset;
}

/// P2p advertiser adverts send class
class P2pAdvertiserAdvertsSend extends P2pAdvertiserAdvertsSendModel {
  /// Initializes
  P2pAdvertiserAdvertsSend({
    @required int p2pAdvertiserAdverts,
    int limit,
    int offset,
  }) : super(
          p2pAdvertiserAdverts: p2pAdvertiserAdverts,
          limit: limit,
          offset: offset,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserAdvertsSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserAdvertsSend(
        p2pAdvertiserAdverts: json['p2p_advertiser_adverts'],
        limit: json['limit'],
        offset: json['offset'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advertiser_adverts'] = p2pAdvertiserAdverts;
    result['limit'] = limit;
    result['offset'] = offset;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserAdvertsSend copyWith({
    int p2pAdvertiserAdverts,
    int limit,
    int offset,
  }) =>
      P2pAdvertiserAdvertsSend(
        p2pAdvertiserAdverts: p2pAdvertiserAdverts ?? this.p2pAdvertiserAdverts,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
      );
}
