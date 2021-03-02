import 'package:meta/meta.dart';


/// P2p order confirm response model class
abstract class P2pOrderConfirmResponseModel {
  /// Initializes
  P2pOrderConfirmResponseModel({
    @required this.p2pOrderConfirm,
  });

  /// Confirmation details
  final P2pOrderConfirm p2pOrderConfirm;
}

/// P2p order confirm response class
class P2pOrderConfirmResponse extends P2pOrderConfirmResponseModel {
  /// Initializes
  P2pOrderConfirmResponse({
    @required P2pOrderConfirm p2pOrderConfirm,
  }) : super(
          p2pOrderConfirm: p2pOrderConfirm,
        );

  /// Creates an instance from JSON
  factory P2pOrderConfirmResponse.fromJson(
    dynamic p2pOrderConfirmJson,
  ) =>
      P2pOrderConfirmResponse(
        p2pOrderConfirm: p2pOrderConfirmJson == null
            ? null
            : P2pOrderConfirm.fromJson(p2pOrderConfirmJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderConfirm != null) {
      resultMap['p2p_order_confirm'] = p2pOrderConfirm.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderConfirmResponse copyWith({
    P2pOrderConfirm p2pOrderConfirm,
  }) =>
      P2pOrderConfirmResponse(
        p2pOrderConfirm: p2pOrderConfirm ?? this.p2pOrderConfirm,
      );
}

final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "buyer-confirmed": StatusEnum.buyerConfirmed,
  "completed": StatusEnum.completed,
};

/// status Enum
enum StatusEnum {
  buyerConfirmed,
  completed,
}
/// P2p order confirm model class
abstract class P2pOrderConfirmModel {
  /// Initializes
  P2pOrderConfirmModel({
    @required this.status,
    @required this.id,
  });

  /// The new status of the order.
  final StatusEnum status;

  /// The unique identifier for the order.
  final String id;
}

/// P2p order confirm class
class P2pOrderConfirm extends P2pOrderConfirmModel {
  /// Initializes
  P2pOrderConfirm({
    @required String id,
    @required StatusEnum status,
  }) : super(
          id: id,
          status: status,
        );

  /// Creates an instance from JSON
  factory P2pOrderConfirm.fromJson(Map<String, dynamic> json) =>
      P2pOrderConfirm(
        id: json['id'],
        status: statusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere((entry) => entry.value == status, orElse: () => null)
        ?.key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderConfirm copyWith({
    String id,
    StatusEnum status,
  }) =>
      P2pOrderConfirm(
        id: id ?? this.id,
        status: status ?? this.status,
      );
}
