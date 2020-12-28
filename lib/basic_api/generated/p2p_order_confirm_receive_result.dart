/// P2p order confirm receive model class
abstract class P2pOrderConfirmReceiveModel {
  /// Initializes
  P2pOrderConfirmReceiveModel({
    @required this.p2pOrderConfirm,
  });

  /// Confirmation details
  final P2pOrderConfirm p2pOrderConfirm;
}

/// P2p order confirm receive class
class P2pOrderConfirmReceive extends P2pOrderConfirmReceiveModel {
  /// Initializes
  P2pOrderConfirmReceive({
    @required P2pOrderConfirm p2pOrderConfirm,
  }) : super(
          p2pOrderConfirm: p2pOrderConfirm,
        );

  /// Creates an instance from JSON
  factory P2pOrderConfirmReceive.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirmReceive(
        p2pOrderConfirm: json['p2p_order_confirm'] == null
            ? null
            : P2pOrderConfirm.fromJson(json['p2p_order_confirm']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (p2pOrderConfirm != null) {
      result['p2p_order_confirm'] = p2pOrderConfirm.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderConfirmReceive copyWith({
    P2pOrderConfirm p2pOrderConfirm,
  }) =>
      P2pOrderConfirmReceive(
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
      );
}
/// P2p order confirm model class
abstract class P2pOrderConfirmModel {
  /// Initializes
  P2pOrderConfirmModel({
    @required this.id,
    @required this.status,
  });

  /// The unique identifier for the order.
  final String id;

  /// The new status of the order.
  final StatusEnum status;
}

/// P2p order confirm class
class P2pOrderConfirm extends P2pOrderConfirmModel {
  /// Initializes
  P2pOrderConfirm({
    @required String id,
    @required String status,
  }) : super(
          id: id,
          status: status,
        );

  /// Creates an instance from JSON
  factory P2pOrderConfirm.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirm(
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
  P2pOrderConfirm copyWith({
    String id,
    String status,
  }) =>
      P2pOrderConfirm(
        id: id ?? this.id,
        status: status ?? this.status,
      );
  // Creating Enum Mappers

  static final Map<StatusEnum, String> statusEnumMapper = {
    StatusEnum.buyer_confirmed: 'buyer-confirmed',
    StatusEnum.completed: 'completed',
  };
}

// Creating Enums

enum StatusEnum {
  buyer_confirmed,
  completed,
}
