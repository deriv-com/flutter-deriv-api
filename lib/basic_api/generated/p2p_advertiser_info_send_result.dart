/// P2p advertiser info send model class
abstract class P2pAdvertiserInfoSendModel {
  /// Initializes
  P2pAdvertiserInfoSendModel({
    @required this.p2pAdvertiserInfo,
    this.id,
    this.subscribe,
  });

  /// Must be 1
  final int p2pAdvertiserInfo;

  /// [Optional] The unique identifier for this advertiser. If not provided, returns advertiser information about the current account.
  final String id;

  /// [Optional] If set to 1, will send updates whenever there is an update to advertiser
  final int subscribe;
}

/// P2p advertiser info send class
class P2pAdvertiserInfoSend extends P2pAdvertiserInfoSendModel {
  /// Initializes
  P2pAdvertiserInfoSend({
    @required int p2pAdvertiserInfo,
    String id,
    int subscribe,
  }) : super(
          p2pAdvertiserInfo: p2pAdvertiserInfo,
          id: id,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserInfoSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserInfoSend(
        p2pAdvertiserInfo: json['p2p_advertiser_info'],
        id: json['id'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advertiser_info'] = p2pAdvertiserInfo;
    result['id'] = id;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserInfoSend copyWith({
    int p2pAdvertiserInfo,
    String id,
    int subscribe,
  }) =>
      P2pAdvertiserInfoSend(
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        id: id ?? this.id,
        subscribe: subscribe ?? this.subscribe,
      );
}
