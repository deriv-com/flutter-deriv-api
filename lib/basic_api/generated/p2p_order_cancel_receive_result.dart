/// P2p order cancel receive model class
abstract class P2pOrderCancelReceiveModel {
  /// Initializes
  P2pOrderCancelReceiveModel({
    @required this.p2pOrderCancel,
  });

  /// Cancellation details
  final P2pOrderCancel p2pOrderCancel;
}

/// P2p order cancel receive class
class P2pOrderCancelReceive extends P2pOrderCancelReceiveModel {
  /// Initializes
  P2pOrderCancelReceive({
    @required P2pOrderCancel p2pOrderCancel,
  }) : super(
          p2pOrderCancel: p2pOrderCancel,
        );

  /// Creates an instance from JSON
  factory P2pOrderCancelReceive.fromJson(Map<String, dynamic> json) =>
      P2pOrderCancelReceive(
        p2pOrderCancel: json['p2p_order_cancel'] == null
            ? null
            : P2pOrderCancel.fromJson(json['p2p_order_cancel']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (p2pOrderCancel != null) {
      result['p2p_order_cancel'] = p2pOrderCancel.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderCancelReceive copyWith({
    P2pOrderCancel p2pOrderCancel,
  }) =>
      P2pOrderCancelReceive(
        p2pOrderCancel: p2pOrderCancel ?? this.p2pOrderCancel,
      );
}
/// P2p order cancel model class
abstract class P2pOrderCancelModel {
  /// Initializes
  P2pOrderCancelModel({
    @required this.id,
    @required this.status,
  });

  /// The unique identifier for the order.
  final String id;

  /// The new status of the order.
  final StatusEnum status;
}

/// P2p order cancel class
class P2pOrderCancel extends P2pOrderCancelModel {
  /// Initializes
  P2pOrderCancel({
    @required String id,
    @required String status,
  }) : super(
          id: id,
          status: status,
        );

  /// Creates an instance from JSON
  factory P2pOrderCancel.fromJson(Map<String, dynamic> json) => P2pOrderCancel(
        id: json['id'],
        status: json['status'] == null
            ? null
            : statusEnumMapper.entries
                .firstWhere((entry) => entry.value == json['status'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['id'] = id;
    result['status'] = statusEnumMapper[status];

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderCancel copyWith({
    String id,
    String status,
  }) =>
      P2pOrderCancel(
        id: id ?? this.id,
        status: status ?? this.status,
      );
  // Creating Enum Mappers

  static final Map<StatusEnum, String> statusEnumMapper = {
    StatusEnum.cancelled: 'cancelled',
  };
}

// Creating Enums

enum StatusEnum {
  cancelled,
}
