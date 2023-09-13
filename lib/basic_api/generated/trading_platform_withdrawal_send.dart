/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_withdrawal_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform withdrawal request class.
class TradingPlatformWithdrawalRequest extends Request {
  /// Initialize TradingPlatformWithdrawalRequest.
  const TradingPlatformWithdrawalRequest({
    required this.amount,
    required this.fromAccount,
    required this.platform,
    required this.toAccount,
    this.tradingPlatformWithdrawal = true,
    super.msgType = 'trading_platform_withdrawal',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformWithdrawalRequest.fromJson(
          Map<String, dynamic> json) =>
      TradingPlatformWithdrawalRequest(
        amount: json['amount'] as num?,
        fromAccount: json['from_account'] as String?,
        platform: json['platform'] as String?,
        toAccount: json['to_account'] as String?,
        tradingPlatformWithdrawal: json['trading_platform_withdrawal'] == null
            ? null
            : json['trading_platform_withdrawal'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Amount to withdraw (in the currency of the Trading account).
  final num? amount;

  /// Trading account login to withdraw money from.
  final String? fromAccount;

  /// Name of trading platform.
  final String? platform;

  /// Wallet account loginid to transfer money to.
  final String? toAccount;

  /// Must be `true`
  final bool? tradingPlatformWithdrawal;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'from_account': fromAccount,
        'platform': platform,
        'to_account': toAccount,
        'trading_platform_withdrawal': tradingPlatformWithdrawal == null
            ? null
            : tradingPlatformWithdrawal!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformWithdrawalRequest copyWith({
    num? amount,
    String? fromAccount,
    String? platform,
    String? toAccount,
    bool? tradingPlatformWithdrawal,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformWithdrawalRequest(
        amount: amount ?? this.amount,
        fromAccount: fromAccount ?? this.fromAccount,
        platform: platform ?? this.platform,
        toAccount: toAccount ?? this.toAccount,
        tradingPlatformWithdrawal:
            tradingPlatformWithdrawal ?? this.tradingPlatformWithdrawal,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
