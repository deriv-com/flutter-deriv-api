import 'total.dart';

/// Abstract class Balance of account
abstract class BalanceModel {
  /// Constructor
  BalanceModel({
    this.balance,
    this.currency,
    this.id,
    this.loginid,
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
  final String loginid;

  /// Total amounts of balances
  final Total total;
}
