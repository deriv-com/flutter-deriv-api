/// Cancel receive model class
abstract class CancelReceiveModel {
  /// Initializes
  CancelReceiveModel({
    @required this.cancel,
  });

  /// Receipt for the transaction
  final Cancel cancel;
}

/// Cancel receive class
class CancelReceive extends CancelReceiveModel {
  /// Initializes
  CancelReceive({
    @required Cancel cancel,
  }) : super(
          cancel: cancel,
        );

  /// Creates an instance from JSON
  factory CancelReceive.fromJson(Map<String, dynamic> json) => CancelReceive(
        cancel: json['cancel'] == null ? null : Cancel.fromJson(json['cancel']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (cancel != null) {
      result['cancel'] = cancel.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  CancelReceive copyWith({
    Cancel cancel,
  }) =>
      CancelReceive(
        cancel: cancel ?? this.cancel,
      );
}
/// Cancel model class
abstract class CancelModel {
  /// Initializes
  CancelModel({
    @required this.balanceAfter,
    @required this.contractId,
    @required this.referenceId,
    @required this.soldFor,
    @required this.transactionId,
  });

  /// New account balance after completion of the sale
  final double balanceAfter;

  /// Internal contract identifier for the sold contract
  final int contractId;

  /// Internal transaction identifier for the corresponding buy transaction
  final int referenceId;

  /// Actual effected sale price
  final double soldFor;

  /// Internal transaction identifier for the sale transaction
  final int transactionId;
}

/// Cancel class
class Cancel extends CancelModel {
  /// Initializes
  Cancel({
    @required double balanceAfter,
    @required int contractId,
    @required int referenceId,
    @required double soldFor,
    @required int transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          contractId: contractId,
          referenceId: referenceId,
          soldFor: soldFor,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory Cancel.fromJson(Map<String, dynamic> json) => Cancel(
        balanceAfter: getDouble(json['balance_after']),
        contractId: json['contract_id'],
        referenceId: json['reference_id'],
        soldFor: getDouble(json['sold_for']),
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['balance_after'] = balanceAfter;
    result['contract_id'] = contractId;
    result['reference_id'] = referenceId;
    result['sold_for'] = soldFor;
    result['transaction_id'] = transactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Cancel copyWith({
    double balanceAfter,
    int contractId,
    int referenceId,
    double soldFor,
    int transactionId,
  }) =>
      Cancel(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
