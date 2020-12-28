/// P2p advert info send model class
abstract class P2pAdvertInfoSendModel {
  /// Initializes
  P2pAdvertInfoSendModel({
    @required this.p2pAdvertInfo,
    @required this.id,
  });

  /// Must be 1
  final int p2pAdvertInfo;

  /// The unique identifier for this advert.
  final String id;
}

/// P2p advert info send class
class P2pAdvertInfoSend extends P2pAdvertInfoSendModel {
  /// Initializes
  P2pAdvertInfoSend({
    @required int p2pAdvertInfo,
    @required String id,
  }) : super(
          p2pAdvertInfo: p2pAdvertInfo,
          id: id,
        );

  /// Creates an instance from JSON
  factory P2pAdvertInfoSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertInfoSend(
        p2pAdvertInfo: json['p2p_advert_info'],
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advert_info'] = p2pAdvertInfo;
    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertInfoSend copyWith({
    int p2pAdvertInfo,
    String id,
  }) =>
      P2pAdvertInfoSend(
        p2pAdvertInfo: p2pAdvertInfo ?? this.p2pAdvertInfo,
        id: id ?? this.id,
      );
}
