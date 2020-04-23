/// Transaction id contract
class TransactionIdsModel {
  /// Initializes
  TransactionIdsModel(
    this.buyID,
    this.sellID,
  );

  /// From JSON
  factory TransactionIdsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      TransactionIdsModel(
        json['buy'],
        json['sell'],
      );

  /// Buy ID
  final int buyID;

  /// Sell ID
  final int sellID;

  /// Clones a new instance
  TransactionIdsModel copyWith(
    int buyID,
    int sellID,
  ) =>
      TransactionIdsModel(
        buyID ?? this.buyID,
        sellID ?? this.sellID,
      );
}
