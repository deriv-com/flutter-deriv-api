/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_platform_deposit_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Trading platform deposit request class.
class TradingPlatformDepositRequest extends Request {
  /// Initialize TradingPlatformDepositRequest.
  const TradingPlatformDepositRequest({
    required this.amount,
    required this.fromAccount,
    required this.platform,
    required this.toAccount,
    this.tradingPlatformDeposit = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'trading_platform_deposit',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformDepositRequest.fromJson(Map<String, dynamic> json) =>
      TradingPlatformDepositRequest(
        amount: json['amount'] as num?,
        fromAccount: json['from_account'] as String?,
        platform: json['platform'] as String?,
        toAccount: json['to_account'] as String?,
        tradingPlatformDeposit: json['trading_platform_deposit'] == null
            ? null
            : json['trading_platform_deposit'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Amount to deposit (in the currency of from_wallet).
  final num? amount;

  /// Wallet account to transfer money from.
  final String? fromAccount;

  /// Name of trading platform.
  final String? platform;

  /// Trading account login to deposit money to.
  final String? toAccount;

  /// Must be `true`
  final bool? tradingPlatformDeposit;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'from_account': fromAccount,
        'platform': platform,
        'to_account': toAccount,
        'trading_platform_deposit': tradingPlatformDeposit == null
            ? null
            : tradingPlatformDeposit!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingPlatformDepositRequest copyWith({
    num? amount,
    String? fromAccount,
    String? platform,
    String? toAccount,
    bool? tradingPlatformDeposit,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingPlatformDepositRequest(
        amount: amount ?? this.amount,
        fromAccount: fromAccount ?? this.fromAccount,
        platform: platform ?? this.platform,
        toAccount: toAccount ?? this.toAccount,
        tradingPlatformDeposit:
            tradingPlatformDeposit ?? this.tradingPlatformDeposit,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
