import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// MT5 accounts info
class BalanceMt5Model extends APIBaseModel {
  /// Initializes
  BalanceMt5Model({this.amount, this.currency});

  /// Generates an instance from json
  factory BalanceMt5Model.fromJson(
    Map<String, dynamic> json,
  ) =>
      BalanceMt5Model(
        amount: json['amount'],
        currency: json['currency'],
      );

  /// Total balance of all MT5 accounts
  final double amount;

  /// Currency code.
  final String currency;

  /// Generates a copy of instance with given parameters
  BalanceMt5Model copyWith({
    double amount,
    String currency,
  }) =>
      BalanceMt5Model(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
