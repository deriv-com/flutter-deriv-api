import 'package:flutter_deriv_api/api/account/models/balance_active_account_model.dart';
import 'package:flutter_deriv_api/api/account/models/balance_total_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Abstract class Balance of account
abstract class BalanceModel extends APIBaseModel {
  /// Initializes
  BalanceModel({
    this.accounts,
    this.balance,
    this.currency,
    this.id,
    this.loginId,
    this.total,
  });

  /// User active accounts list
  final List<BalanceActiveAccountModel> accounts;

  /// Balance amount
  final double balance;

  /// Currency code.
  final String currency;

  /// A stream ID that can be used to cancel this stream using the Forget request.
  final String id;

  /// Client login id.
  final String loginId;

  /// Total amounts of balances
  final BalanceTotalModel total;
}
