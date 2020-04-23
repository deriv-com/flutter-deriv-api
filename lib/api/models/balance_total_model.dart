import 'balance_mt5_model.dart';
import 'balance_real_model.dart';
import 'base_model.dart';

/// Total Information of [BalanceModel]
class BalanceTotalModel extends BaseModel {
  /// Constructor
  BalanceTotalModel({this.mt5, this.real});

  /// Instance from JSON
  factory BalanceTotalModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      BalanceTotalModel(
        mt5: json['mt5'] == null ? null : BalanceMt5Model.fromJson(json),
        real: json['real'] != null ? null : BalanceRealModel.fromJson(json),
      );

  /// Total balance of all MT5 accounts
  final BalanceMt5Model mt5;

  /// Total amount of balance in all real accounts (excluding MT5)
  final BalanceRealModel real;

  /// ToJson
  BalanceTotalModel copyWith({
    BalanceMt5Model mt5,
    BalanceRealModel real,
  }) =>
      BalanceTotalModel(
        mt5: mt5 ?? this.mt5,
        real: real ?? this.real,
      );
}
