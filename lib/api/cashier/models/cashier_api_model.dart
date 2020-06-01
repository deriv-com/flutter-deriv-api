import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'cashier_deposit_information.dart';

/// Cashier information for type API specified in request
class CashierAPIModel extends APIBaseModel {
  /// Initializes
  CashierAPIModel({
    this.action,
    this.depositInformation,
  });

  /// Creates an instance from JSON
  factory CashierAPIModel.fromJson(Map<String, dynamic> json) =>
      CashierAPIModel(
        action: json['action'],
        depositInformation: getItemFromMap(json['deposit'],
            itemToTypeCallback: (dynamic item) =>
                CashierDepositInformation.fromJson(item)),
      );

  /// Type of operation, which is requested.
  final String action;

  /// Result for deposit operation. (if deposit requested)
  final CashierDepositInformation depositInformation;

  /// Creates a copy with given parameters
  CashierAPIModel copyWith(
    String action,
    CashierDepositInformation depositInformation,
  ) =>
      CashierAPIModel(
        action: action ?? this.action,
        depositInformation: depositInformation ?? this.depositInformation,
      );
}
