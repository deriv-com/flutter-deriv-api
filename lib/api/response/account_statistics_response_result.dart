// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Account statistics response model class.
abstract class AccountStatisticsResponseModel extends Equatable {
  /// Initializes Account statistics response model class .
  const AccountStatisticsResponseModel({
    this.accountStatistics,
  });

  /// Response of account statistics
  final AccountStatistics? accountStatistics;
}

/// Account statistics response class.
class AccountStatisticsResponse extends AccountStatisticsResponseModel {
  /// Initializes Account statistics response class.
  const AccountStatisticsResponse({
    AccountStatistics? accountStatistics,
  }) : super(
          accountStatistics: accountStatistics,
        );

  /// Creates an instance from JSON.
  factory AccountStatisticsResponse.fromJson(
    dynamic accountStatisticsJson,
  ) =>
      AccountStatisticsResponse(
        accountStatistics: accountStatisticsJson == null
            ? null
            : AccountStatistics.fromJson(accountStatisticsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (accountStatistics != null) {
      resultMap['account_statistics'] = accountStatistics!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountStatisticsResponse copyWith({
    AccountStatistics? accountStatistics,
  }) =>
      AccountStatisticsResponse(
        accountStatistics: accountStatistics ?? this.accountStatistics,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Account statistics model class.
abstract class AccountStatisticsModel extends Equatable {
  /// Initializes Account statistics model class .
  const AccountStatisticsModel({
    this.currency,
    this.totalDeposits,
    this.totalWithdrawals,
  });

  /// Currency of an account
  final String? currency;

  /// Sum of all deposits of an account
  final double? totalDeposits;

  /// Sum of all withdrawals of an account
  final double? totalWithdrawals;
}

/// Account statistics class.
class AccountStatistics extends AccountStatisticsModel {
  /// Initializes Account statistics class.
  const AccountStatistics({
    String? currency,
    double? totalDeposits,
    double? totalWithdrawals,
  }) : super(
          currency: currency,
          totalDeposits: totalDeposits,
          totalWithdrawals: totalWithdrawals,
        );

  /// Creates an instance from JSON.
  factory AccountStatistics.fromJson(Map<String, dynamic> json) =>
      AccountStatistics(
        currency: json['currency'],
        totalDeposits: getDouble(json['total_deposits']),
        totalWithdrawals: getDouble(json['total_withdrawals']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['currency'] = currency;
    resultMap['total_deposits'] = totalDeposits;
    resultMap['total_withdrawals'] = totalWithdrawals;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AccountStatistics copyWith({
    String? currency,
    double? totalDeposits,
    double? totalWithdrawals,
  }) =>
      AccountStatistics(
        currency: currency ?? this.currency,
        totalDeposits: totalDeposits ?? this.totalDeposits,
        totalWithdrawals: totalWithdrawals ?? this.totalWithdrawals,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
