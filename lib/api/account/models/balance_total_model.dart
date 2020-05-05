import 'package:flutter_deriv_api/api/account/models/balance_mt5_model.dart';
import 'package:flutter_deriv_api/api/account/models/balance_real_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Total Information of [BalanceModel]
class BalanceTotalModel extends APIBaseModel {
  /// Initializes
  BalanceTotalModel({this.mt5, this.real});

  /// Generates an instance from json
  factory BalanceTotalModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      BalanceTotalModel(
        mt5: getItemFromMap(
          json['mt5'],
          itemToTypeCallback: (dynamic item) => BalanceMt5Model.fromJson(item),
        ),
        real: getItemFromMap(
          json['real'],
          itemToTypeCallback: (dynamic item) => BalanceRealModel.fromJson(item),
        ),
      );

  /// Total balance of all MT5 accounts
  final BalanceMt5Model mt5;

  /// Total amount of balance in all real accounts (excluding MT5)
  final BalanceRealModel real;

  /// Generates a copy of instance with given parameters
  BalanceTotalModel copyWith({
    BalanceMt5Model mt5,
    BalanceRealModel real,
  }) =>
      BalanceTotalModel(
        mt5: mt5 ?? this.mt5,
        real: real ?? this.real,
      );
}
