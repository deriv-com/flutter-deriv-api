import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

import 'cashier_deposit_model.dart';

/// Cashier information for type API specified in request
class CashierAPIModel extends APIBaseModel {
  /// Initializes
  CashierAPIModel({
    this.action,
    this.deposit,
  });

  /// Creates an instance from JSON
  factory CashierAPIModel.fromJson(Map<String, dynamic> json) =>
      CashierAPIModel(
        action: json['action'],
        deposit: getItemFromMap(
          json['deposit'],
          itemToTypeCallback: (dynamic item) =>
              CashierDepositModel.fromJson(item),
        ),
      );

  /// Type of operation, which is requested.
  final String? action;

  /// Result for deposit operation. (if deposit requested)
  final CashierDepositModel? deposit;

  /// Creates a copy with given parameters
  CashierAPIModel copyWith(
    String action,
    CashierDepositModel deposit,
  ) =>
      CashierAPIModel(
        action: action,
        deposit: deposit,
      );
}
