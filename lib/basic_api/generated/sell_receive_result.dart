/// Sell receive model class
abstract class SellReceiveModel {
  /// Initializes
  SellReceiveModel({
    @required this.sell,
  });

  /// Receipt for the transaction
  final Sell sell;
}

/// Sell receive class
class SellReceive extends SellReceiveModel {
  /// Initializes
  SellReceive({
    @required Sell sell,
  }) : super(
          sell: sell,
        );

  /// Creates an instance from JSON
  factory SellReceive.fromJson(Map<String, dynamic> json) => SellReceive(
        sell: json['sell'] == null ? null : Sell.fromJson(json['sell']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (sell != null) {
      result['sell'] = sell.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  SellReceive copyWith({
    Sell sell,
  }) =>
      SellReceive(
        sell: sell ?? this.sell,
      );
}
/// Sell model class
abstract class SellModel {
  /// Initializes
  SellModel({
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

/// Sell class
class Sell extends SellModel {
  /// Initializes
  Sell({
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
  factory Sell.fromJson(Map<String, dynamic> json) => Sell(
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
  Sell copyWith({
    double balanceAfter,
    int contractId,
    int referenceId,
    double soldFor,
    int transactionId,
  }) =>
      Sell(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
