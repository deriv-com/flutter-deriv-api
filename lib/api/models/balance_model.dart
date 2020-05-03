import 'api_base_model.dart';
import 'balance_total_model.dart';

/// Abstract class Balance of account
abstract class BalanceModel extends APIBaseModel {
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
