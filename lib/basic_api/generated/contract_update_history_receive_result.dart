/// Contract update history receive model class
abstract class ContractUpdateHistoryReceiveModel {
  /// Initializes
  ContractUpdateHistoryReceiveModel({
    @required this.contractUpdateHistory,
  });

  /// Contains the historical and the most recent update status of the contract
  final List<ContractUpdateHistory> contractUpdateHistory;
}

/// Contract update history receive class
class ContractUpdateHistoryReceive extends ContractUpdateHistoryReceiveModel {
  /// Initializes
  ContractUpdateHistoryReceive({
    @required List<ContractUpdateHistory> contractUpdateHistory,
  }) : super(
          contractUpdateHistory: contractUpdateHistory,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistoryReceive.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistoryReceive(
        contractUpdateHistory: json['contract_update_history'] == null
            ? null
            : json['contract_update_history']
                .map<ContractUpdateHistory>(
                    (dynamic item) => ContractUpdateHistory.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (contractUpdateHistory != null) {
      result['contract_update_history'] =
          contractUpdateHistory.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractUpdateHistoryReceive copyWith({
    List<ContractUpdateHistory> contractUpdateHistory,
  }) =>
      ContractUpdateHistoryReceive(
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
      );
}
/// Contract update history model class
abstract class ContractUpdateHistoryModel {
  /// Initializes
  ContractUpdateHistoryModel({
    @required this.displayName,
    @required this.orderAmount,
    @required this.orderDate,
    @required this.orderType,
    this.value,
  });

  /// Display name of the changed parameter.
  final String displayName;

  /// The amount.
  final String orderAmount;

  /// The epoch when the changed was done.
  final int orderDate;

  /// The contract parameter updated.
  final String orderType;

  /// The pip-sized barrier value.
  final UNKNOWN_TYPE value;
}

/// Contract update history class
class ContractUpdateHistory extends ContractUpdateHistoryModel {
  /// Initializes
  ContractUpdateHistory({
    @required String displayName,
    @required String orderAmount,
    @required int orderDate,
    @required String orderType,
    UNKNOWN_TYPE value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          orderType: orderType,
          value: value,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistory.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistory(
        displayName: json['display_name'],
        orderAmount: json['order_amount'],
        orderDate: json['order_date'],
        orderType: json['order_type'],
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['display_name'] = displayName;
    result['order_amount'] = orderAmount;
    result['order_date'] = orderDate;
    result['order_type'] = orderType;
    result['value'] = value;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractUpdateHistory copyWith({
    String displayName,
    String orderAmount,
    int orderDate,
    String orderType,
    UNKNOWN_TYPE value,
  }) =>
      ContractUpdateHistory(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        orderType: orderType ?? this.orderType,
        value: value ?? this.value,
      );
}
