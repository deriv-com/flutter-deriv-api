/// Contract update history send model class
abstract class ContractUpdateHistorySendModel {
  /// Initializes
  ContractUpdateHistorySendModel({
    @required this.contractUpdateHistory,
    @required this.contractId,
    this.limit,
  });

  /// Must be `1`
  final int contractUpdateHistory;

  /// Internal unique contract identifier.
  final int contractId;

  /// [Optional] Maximum number of historical updates to receive.
  final double limit;
}

/// Contract update history send class
class ContractUpdateHistorySend extends ContractUpdateHistorySendModel {
  /// Initializes
  ContractUpdateHistorySend({
    @required int contractUpdateHistory,
    @required int contractId,
    double limit,
  }) : super(
          contractUpdateHistory: contractUpdateHistory,
          contractId: contractId,
          limit: limit,
        );

  /// Creates an instance from JSON
  factory ContractUpdateHistorySend.fromJson(Map<String, dynamic> json) =>
      ContractUpdateHistorySend(
        contractUpdateHistory: json['contract_update_history'],
        contractId: json['contract_id'],
        limit: getDouble(json['limit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['contract_update_history'] = contractUpdateHistory;
    result['contract_id'] = contractId;
    result['limit'] = limit;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractUpdateHistorySend copyWith({
    int contractUpdateHistory,
    int contractId,
    double limit,
  }) =>
      ContractUpdateHistorySend(
        contractUpdateHistory:
            contractUpdateHistory ?? this.contractUpdateHistory,
        contractId: contractId ?? this.contractId,
        limit: limit ?? this.limit,
      );
}
