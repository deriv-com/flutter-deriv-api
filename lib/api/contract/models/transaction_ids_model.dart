import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Transaction id contract
class TransactionIdsModel extends APIBaseModel {
  /// Initializes
  TransactionIdsModel(
    this.buyID,
    this.sellID,
  );

  /// Generate an instance from JSON
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

  /// Generate a copy of instance with given parameters
  TransactionIdsModel copyWith(
    int buyID,
    int sellID,
  ) =>
      TransactionIdsModel(
        buyID ?? this.buyID,
        sellID ?? this.sellID,
      );
}
