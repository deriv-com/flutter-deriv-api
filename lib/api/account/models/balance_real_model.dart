import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Real account info
class BalanceRealModel extends APIBaseModel {
  /// Constructor
  BalanceRealModel({this.amount, this.currency});

  /// Instance from JSON
  factory BalanceRealModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      BalanceRealModel(
        amount: json['amount'],
        currency: json['currency'],
      );

  /// Total amount of all balances of all real accounts
  final double amount;

  /// Currency code.
  final String currency;

  /// ToJson
  BalanceRealModel copyWith({
    double amount,
    String currency,
  }) =>
      BalanceRealModel(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
