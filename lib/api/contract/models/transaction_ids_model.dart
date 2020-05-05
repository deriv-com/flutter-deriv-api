import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Transaction id contract
class TransactionIdsModel extends APIBaseModel {
  /// Initializes
  TransactionIdsModel(
    this.buyID,
    this.sellID,
  );

  /// Generates an instance from json
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

  /// Generates a copy of instance with given parameters
  TransactionIdsModel copyWith(
    int buyID,
    int sellID,
  ) =>
      TransactionIdsModel(
        buyID ?? this.buyID,
        sellID ?? this.sellID,
      );
}
