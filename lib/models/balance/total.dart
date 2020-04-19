import 'mt5.dart';
import 'real.dart';

/// Total Information of [BalanceModel]
class Total {
  /// Constructor
  Total({this.mt5, this.real});

  /// Instance from JSON
  factory Total.fromJson(Map<String, dynamic> json) => Total(
        mt5: json['mt5'] != null ? Mt5.fromJson(json) : null,
        real: json['real'] != null ? Real.fromJson(json) : null,
      );

  /// Total balance of all MT5 accounts
  final Mt5 mt5;

  /// Total amount of balance in all real accounts (excluding MT5)
  final Real real;

  /// ToJson
  Total copyWith({
    Mt5 mt5,
    Real real,
  }) =>
      Total(mt5: mt5 ?? this.mt5, real: real ?? this.real);
}
