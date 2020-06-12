import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'balance_account_model.dart';

/// Total Information of [BalanceModel]
class BalanceTotalModel extends APIBaseModel {
  /// Initializes
  BalanceTotalModel({this.mt5, this.real});

  /// Generate an instance from JSON
  factory BalanceTotalModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      BalanceTotalModel(
        mt5: getItemFromMap(
          json['mt5'],
          itemToTypeCallback: (dynamic item) => BalanceAccountModel.fromJson(item),
        ),
        real: getItemFromMap(
          json['real'],
          itemToTypeCallback: (dynamic item) => BalanceAccountModel.fromJson(item),
        ),
      );

  /// Total balance of all MT5 accounts
  final BalanceAccountModel mt5;

  /// Total amount of balance in all real accounts (excluding MT5)
  final BalanceAccountModel real;

  /// Generate a copy of instance with given parameters
  BalanceTotalModel copyWith({
    BalanceAccountModel mt5,
    BalanceAccountModel real,
  }) =>
      BalanceTotalModel(
        mt5: mt5 ?? this.mt5,
        real: real ?? this.real,
      );
}
