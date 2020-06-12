import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Real account info
class BalanceAccountModel extends APIBaseModel {
  /// Initializes
  BalanceAccountModel({this.amount, this.currency});

  /// Generates an instance from JSON
  factory BalanceAccountModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      BalanceAccountModel(
        amount: json['amount'],
        currency: json['currency'],
      );

  /// Total amount of all balances of all real accounts
  final double amount;

  /// Currency code.
  final String currency;

  /// Generates a copy of instance with given parameters
  BalanceAccountModel copyWith({
    double amount,
    String currency,
  }) =>
      BalanceAccountModel(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
