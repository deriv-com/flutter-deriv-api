import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Real account info
class BalanceRealModel extends APIBaseModel {
  /// Initializes
  BalanceRealModel({this.amount, this.currency});

  /// Generate an instance from JSON
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

  /// Generate a copy of instance with given parameters
  BalanceRealModel copyWith({
    double amount,
    String currency,
  }) =>
      BalanceRealModel(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
