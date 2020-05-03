import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Top-Up virtual model class
abstract class TopUpVirtualModel extends BaseModel {
  /// Initializes
  TopUpVirtualModel({
    this.amount,
    this.currency,
  });

  /// Top up amount
  final double amount;

  /// Top up currency string
  final String currency;
}
