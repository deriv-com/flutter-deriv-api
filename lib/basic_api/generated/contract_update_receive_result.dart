/// Contract update receive model class
abstract class ContractUpdateReceiveModel {
  /// Initializes
  ContractUpdateReceiveModel({
    @required this.contractUpdate,
  });

  /// Contains the update status of the request
  final ContractUpdate contractUpdate;
}

/// Contract update receive class
class ContractUpdateReceive extends ContractUpdateReceiveModel {
  /// Initializes
  ContractUpdateReceive({
    @required ContractUpdate contractUpdate,
  }) : super(
          contractUpdate: contractUpdate,
        );

  /// Creates an instance from JSON
  factory ContractUpdateReceive.fromJson(Map<String, dynamic> json) =>
      ContractUpdateReceive(
        contractUpdate: json['contract_update'] == null
            ? null
            : ContractUpdate.fromJson(json['contract_update']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (contractUpdate != null) {
      result['contract_update'] = contractUpdate.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractUpdateReceive copyWith({
    ContractUpdate contractUpdate,
  }) =>
      ContractUpdateReceive(
        contractUpdate: contractUpdate ?? this.contractUpdate,
      );
}
/// Contract update model class
abstract class ContractUpdateModel {
  /// Initializes
  ContractUpdateModel({
    @required this.stopLoss,
    @required this.takeProfit,
  });

  /// The target spot price where the contract will be closed automatically at the loss specified by the user.
  final StopLoss stopLoss;

  /// The target spot price where the contract will be closed automatically at the profit specified by the user.
  final TakeProfit takeProfit;
}

/// Contract update class
class ContractUpdate extends ContractUpdateModel {
  /// Initializes
  ContractUpdate({
    @required StopLoss stopLoss,
    @required TakeProfit takeProfit,
  }) : super(
          stopLoss: stopLoss,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON
  factory ContractUpdate.fromJson(Map<String, dynamic> json) => ContractUpdate(
        stopLoss: json['stop_loss'] == null
            ? null
            : StopLoss.fromJson(json['stop_loss']),
        takeProfit: json['take_profit'] == null
            ? null
            : TakeProfit.fromJson(json['take_profit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (stopLoss != null) {
      result['stop_loss'] = stopLoss.toJson();
    }
    if (takeProfit != null) {
      result['take_profit'] = takeProfit.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractUpdate copyWith({
    StopLoss stopLoss,
    TakeProfit takeProfit,
  }) =>
      ContractUpdate(
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
/// Stop loss model class
abstract class StopLossModel {
  /// Initializes
  StopLossModel({
    @required this.displayName,
    this.orderAmount,
    @required this.orderDate,
    this.value,
  });

  /// Localized display name
  final String displayName;

  /// Stop loss amount
  final double orderAmount;

  /// Stop loss order epoch
  final int orderDate;

  /// Stop loss pip-sized barrier value
  final UNKNOWN_TYPE value;
}

/// Stop loss class
class StopLoss extends StopLossModel {
  /// Initializes
  StopLoss({
    @required String displayName,
    double orderAmount,
    @required int orderDate,
    UNKNOWN_TYPE value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory StopLoss.fromJson(Map<String, dynamic> json) => StopLoss(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: json['order_date'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['order_amount'] = orderAmount;
    result['order_date'] = orderDate;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  StopLoss copyWith({
    String displayName,
    double orderAmount,
    int orderDate,
    UNKNOWN_TYPE value,
  }) =>
      StopLoss(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
/// Take profit model class
abstract class TakeProfitModel {
  /// Initializes
  TakeProfitModel({
    @required this.displayName,
    this.orderAmount,
    @required this.orderDate,
    this.value,
  });

  /// Localized display name
  final String displayName;

  /// Take profit amount
  final double orderAmount;

  /// Take profit order epoch
  final int orderDate;

  /// Take profit pip-sized barrier value
  final UNKNOWN_TYPE value;
}

/// Take profit class
class TakeProfit extends TakeProfitModel {
  /// Initializes
  TakeProfit({
    @required String displayName,
    double orderAmount,
    @required int orderDate,
    UNKNOWN_TYPE value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory TakeProfit.fromJson(Map<String, dynamic> json) => TakeProfit(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: json['order_date'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['order_amount'] = orderAmount;
    result['order_date'] = orderDate;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TakeProfit copyWith({
    String displayName,
    double orderAmount,
    int orderDate,
    UNKNOWN_TYPE value,
  }) =>
      TakeProfit(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
