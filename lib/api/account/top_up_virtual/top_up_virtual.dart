import 'package:flutter_deriv_api/api/account/models/top_up_virtual_model.dart';

/// Top-Up virtual class
class TopUpVirtual extends TopUpVirtualModel {
  /// Initializes
  TopUpVirtual({
    double amount,
    String currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Generate an instance from JSON
  factory TopUpVirtual.fromJson(Map<String, dynamic> json) => TopUpVirtual(
        amount: json['amount']?.toDouble(),
        currency: json['currency'],
      );

  /// Generate a copy of instance with given parameters
  TopUpVirtual copyWith({
    double amount,
    String currency,
  }) =>
      TopUpVirtual(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
