import 'package:flutter_deriv_api/api/account/models/balance_model.dart';
import 'package:flutter_deriv_api/api/account/models/balance_total_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Balance information if account
class Balance extends BalanceModel {
  /// Initializes
  Balance({
    double balance,
    String currency,
    String id,
    String loginId,
    BalanceTotalModel total,
  }) : super(
          balance: balance,
          currency: currency,
          id: id,
          loginId: loginId,
          total: total,
        );

  /// Instance from JSON
  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: json['balance'],
        currency: json['currency'],
        id: json['id'],
        loginId: json['loginid'],
        total: getItemFromMap(
          json['total'],
          itemToTypeCallback: (dynamic item) =>
              BalanceTotalModel.fromJson(item),
        ),
      );

  /// Get balance of account
  /// If set to 'all', return the balances of all accounts one by one;
  /// if set to 'current', return the balance of current account; if set as an
  /// account id, return the balance of that account.
  static Future<Balance> getBalance({String forAccount = 'current'}) async =>
      null;

  /// Instead of one call [Balance.getBalance] gets stream of [Balance]
  static Stream<Balance> getBalanceUpdate({String forAccount = 'current'}) =>
      null;

  /// Creates copy of instance with given parameters
  Balance copyWith({
    double balance,
    String currency,
    String id,
    String loginId,
    BalanceTotalModel total,
  }) =>
      Balance(
        balance: balance ?? this.balance,
        currency: currency ?? this.currency,
        id: id ?? this.id,
        loginId: loginId ?? this.loginId,
        total: total ?? this.total,
      );
}
