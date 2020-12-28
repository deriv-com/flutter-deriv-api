/// Contract update send model class
abstract class ContractUpdateSendModel {
  /// Initializes
  ContractUpdateSendModel({
    @required this.contractUpdate,
    @required this.contractId,
    @required this.limitOrder,
  });

  /// Must be `1`
  final int contractUpdate;

  /// Internal unique contract identifier.
  final int contractId;

  /// Specify limit order to update.
  final LimitOrder limitOrder;
}

/// Contract update send class
class ContractUpdateSend extends ContractUpdateSendModel {
  /// Initializes
  ContractUpdateSend({
    @required int contractUpdate,
    @required int contractId,
    @required LimitOrder limitOrder,
  }) : super(
          contractUpdate: contractUpdate,
          contractId: contractId,
          limitOrder: limitOrder,
        );

  /// Creates an instance from JSON
  factory ContractUpdateSend.fromJson(Map<String, dynamic> json) =>
      ContractUpdateSend(
        contractUpdate: json['contract_update'],
        contractId: json['contract_id'],
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrder.fromJson(json['limit_order']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['contract_update'] = contractUpdate;
    result['contract_id'] = contractId;
    if (limitOrder != null) {
      result['limit_order'] = limitOrder.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractUpdateSend copyWith({
    int contractUpdate,
    int contractId,
    LimitOrder limitOrder,
  }) =>
      ContractUpdateSend(
        contractUpdate: contractUpdate ?? this.contractUpdate,
        contractId: contractId ?? this.contractId,
        limitOrder: limitOrder ?? this.limitOrder,
      );
}
/// Limit order model class
abstract class LimitOrderModel {
  /// Initializes
  LimitOrderModel({
    this.stopLoss,
    this.takeProfit,
  });

  /// New stop loss value for a contract. To cancel, pass `null`.
  final double stopLoss;

  /// New take profit value for a contract. To cancel, pass `null`.
  final double takeProfit;
}

/// Limit order class
class LimitOrder extends LimitOrderModel {
  /// Initializes
  LimitOrder({
    double stopLoss,
    double takeProfit,
  }) : super(
          stopLoss: stopLoss,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON
  factory LimitOrder.fromJson(Map<String, dynamic> json) => LimitOrder(
        stopLoss: getDouble(json['stop_loss']),
        takeProfit: getDouble(json['take_profit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['stop_loss'] = stopLoss;
    result['take_profit'] = takeProfit;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LimitOrder copyWith({
    double stopLoss,
    double takeProfit,
  }) =>
      LimitOrder(
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
