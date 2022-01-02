// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform withdrawal response model class.
abstract class TradingPlatformWithdrawalResponseModel extends Equatable {
  /// Initializes Trading platform withdrawal response model class .
  const TradingPlatformWithdrawalResponseModel({
    this.tradingPlatformWithdrawal,
  });

  /// Information about withdrawal transaction
  final TradingPlatformWithdrawal? tradingPlatformWithdrawal;
}

/// Trading platform withdrawal response class.
class TradingPlatformWithdrawalResponse
    extends TradingPlatformWithdrawalResponseModel {
  /// Initializes Trading platform withdrawal response class.
  const TradingPlatformWithdrawalResponse({
    TradingPlatformWithdrawal? tradingPlatformWithdrawal,
  }) : super(
          tradingPlatformWithdrawal: tradingPlatformWithdrawal,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformWithdrawalResponse.fromJson(
    dynamic tradingPlatformWithdrawalJson,
  ) =>
      TradingPlatformWithdrawalResponse(
        tradingPlatformWithdrawal: tradingPlatformWithdrawalJson == null
            ? null
            : TradingPlatformWithdrawal.fromJson(tradingPlatformWithdrawalJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingPlatformWithdrawal != null) {
      resultMap['trading_platform_withdrawal'] =
          tradingPlatformWithdrawal!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformWithdrawalResponse copyWith({
    TradingPlatformWithdrawal? tradingPlatformWithdrawal,
  }) =>
      TradingPlatformWithdrawalResponse(
        tradingPlatformWithdrawal:
            tradingPlatformWithdrawal ?? this.tradingPlatformWithdrawal,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Trading platform withdrawal model class.
abstract class TradingPlatformWithdrawalModel extends Equatable {
  /// Initializes Trading platform withdrawal model class .
  const TradingPlatformWithdrawalModel({
    this.transactionId,
  });

  /// The reference number for the related withdrawal from the wallet account
  final int? transactionId;
}

/// Trading platform withdrawal class.
class TradingPlatformWithdrawal extends TradingPlatformWithdrawalModel {
  /// Initializes Trading platform withdrawal class.
  const TradingPlatformWithdrawal({
    int? transactionId,
  }) : super(
          transactionId: transactionId,
        );

  /// Creates an instance from JSON.
  factory TradingPlatformWithdrawal.fromJson(Map<String, dynamic> json) =>
      TradingPlatformWithdrawal(
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformWithdrawal copyWith({
    int? transactionId,
  }) =>
      TradingPlatformWithdrawal(
        transactionId: transactionId ?? this.transactionId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
