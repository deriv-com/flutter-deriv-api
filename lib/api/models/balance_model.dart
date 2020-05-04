import 'balance_total_model.dart';
import 'base_model.dart';

/// Abstract class Balance of account
abstract class BalanceModel extends BaseModel {
  /// Constructor
  BalanceModel({
    this.balance,
    this.currency,
    this.id,
    this.loginId,
    this.total,
  });

  // Properties
  /// Balance amount
  final double balance;

  /// Currency code.
  final String currency;

  /// A stream ID that can be used to cancel this stream using the Forget request.
  final String id;

  /// Client loginid.
  final String loginId;

  /// Total amounts of balances
  final BalanceTotalModel total;
}
