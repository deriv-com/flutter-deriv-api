/// P2p advert update send model class
abstract class P2pAdvertUpdateSendModel {
  /// Initializes
  P2pAdvertUpdateSendModel({
    @required this.p2pAdvertUpdate,
    this.delete,
    @required this.id,
    this.isActive,
  });

  /// Must be 1
  final int p2pAdvertUpdate;

  /// [Optional] If set to `true`, permanently deletes the advert.
  final bool delete;

  /// The unique identifier for this advert.
  final String id;

  /// [Optional] Activate or deactivate the advert.
  final bool isActive;
}

/// P2p advert update send class
class P2pAdvertUpdateSend extends P2pAdvertUpdateSendModel {
  /// Initializes
  P2pAdvertUpdateSend({
    @required int p2pAdvertUpdate,
    bool delete,
    @required String id,
    bool isActive,
  }) : super(
          p2pAdvertUpdate: p2pAdvertUpdate,
          delete: delete,
          id: id,
          isActive: isActive,
        );

  /// Creates an instance from JSON
  factory P2pAdvertUpdateSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdateSend(
        p2pAdvertUpdate: json['p2p_advert_update'],
        delete: getBool(json['delete']),
        id: json['id'],
        isActive: getBool(json['is_active']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advert_update'] = p2pAdvertUpdate;
    result['delete'] = delete;
    result['id'] = id;
    result['is_active'] = isActive;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertUpdateSend copyWith({
    int p2pAdvertUpdate,
    bool delete,
    String id,
    bool isActive,
  }) =>
      P2pAdvertUpdateSend(
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
        delete: delete ?? this.delete,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
      );
}
