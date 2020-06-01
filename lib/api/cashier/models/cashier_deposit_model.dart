import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Cashier Deposit Information model class
class CashierDepositModel extends APIBaseModel {
  /// Initializes
  CashierDepositModel(this.address);

  /// Creates an instance from JSON
  factory CashierDepositModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CashierDepositModel(json['address']);

  /// Address for crypto deposit.
  final String address;

  /// Creates a copy of instance with given parameters
  CashierDepositModel copyWith(
    String address,
  ) =>
      CashierDepositModel(address ?? this.address);
}
