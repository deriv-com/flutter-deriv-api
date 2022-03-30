import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Transaction id contract
class TransactionIdsModel extends APIBaseModel {
  /// Initializes
  TransactionIdsModel({
    this.buyId,
    this.sellId,
  });

  /// Generate an instance from JSON
  factory TransactionIdsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      TransactionIdsModel(
        buyId: json['buy'],
        sellId: json['sell'],
      );

  /// Buy ID
  final int? buyId;

  /// Sell ID
  final int? sellId;

  /// Generate a copy of instance with given parameters
  TransactionIdsModel copyWith(
    int buyId,
    int sellId,
  ) =>
      TransactionIdsModel(
        buyId: buyId,
        sellId: sellId,
      );
}
