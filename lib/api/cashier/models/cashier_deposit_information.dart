import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Cashier Deposit Information model class
class CashierDepositInformation extends APIBaseModel {
  /// Initializes
  CashierDepositInformation(this.address);

  /// Creates an instance from JSON
  factory CashierDepositInformation.fromJson(
    Map<String, dynamic> json,
  ) =>
      CashierDepositInformation(json['address']);

  /// Address for crypto deposit.
  final String address;

  /// Creates a copy of instance with given parameters
  CashierDepositInformation copyWith(
    String address,
  ) =>
      CashierDepositInformation(address ?? this.address);
}
