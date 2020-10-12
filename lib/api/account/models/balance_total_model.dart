import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'balance_account_model.dart';

/// Total Information of [BalanceModel]
class BalanceTotalModel extends APIBaseModel {
  /// Initializes
  BalanceTotalModel({
    this.mt5,
    this.mt5Demo,
    this.deriv,
    this.derivDemo,
    this.real,
  });

  /// Generate an instance from JSON
  factory BalanceTotalModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      BalanceTotalModel(
        mt5: getItemFromMap(
          json['mt5'],
          itemToTypeCallback: (dynamic item) =>
              BalanceAccountModel.fromJson(item),
        ),
        mt5Demo: getItemFromMap(
          json['mt5_demo'],
          itemToTypeCallback: (dynamic item) =>
              BalanceAccountModel.fromJson(item),
        ),
        deriv: getItemFromMap(
          json['deriv'],
          itemToTypeCallback: (dynamic item) =>
              BalanceAccountModel.fromJson(item),
        ),
        derivDemo: getItemFromMap(
          json['deriv_demo'],
          itemToTypeCallback: (dynamic item) =>
              BalanceAccountModel.fromJson(item),
        ),
        real: getItemFromMap(
          json['real'],
          itemToTypeCallback: (dynamic item) =>
              BalanceAccountModel.fromJson(item),
        ),
      );

  /// Total balance of all MT5 accounts
  final BalanceAccountModel mt5;

  /// Total balance of all MT5 demo accounts.
  final BalanceAccountModel mt5Demo;

  /// Total balance of all real money Deriv accounts.
  final BalanceAccountModel deriv;

  /// Total balance of all demo Deriv accounts.
  final BalanceAccountModel derivDemo;

  /// Total amount of balance in all real accounts (excluding MT5)
  final BalanceAccountModel real;

  /// Generate a copy of instance with given parameters
  BalanceTotalModel copyWith({
    BalanceAccountModel mt5,
    BalanceAccountModel mt5Demo,
    BalanceAccountModel deriv,
    BalanceAccountModel derivDemo,
    BalanceAccountModel real,
  }) =>
      BalanceTotalModel(
        mt5: mt5 ?? this.mt5,
        mt5Demo: mt5Demo ?? this.mt5Demo,
        deriv: deriv ?? this.deriv,
        derivDemo: derivDemo ?? this.derivDemo,
        real: real ?? this.real,
      );
}
