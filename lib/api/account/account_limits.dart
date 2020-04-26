import 'package:flutter_deriv_api/api/models/account_limits_model.dart';

/// Trading limits of real account user
class AccountLimits extends AccountLimitsModel {
  /// Initializes
  AccountLimits({
    double accountBalance,
    double dailyTurnover,
    double lifetimeLimit,
    Map<String, dynamic> marketSpecific,
    int numOfDays,
    double numOfDaysLimit,
    int openPositions,
    double payout,
    String payoutPerSymbol,
    double payoutPerSymbolAndContractType,
    double remainder,
    double withdrawalForXDaysMonetary,
    double withdrawalSinceInceptionMonetary,
  }) : super(
          accountBalance: accountBalance,
          dailyTurnover: dailyTurnover,
          lifetimeLimit: lifetimeLimit,
          marketSpecific: marketSpecific,
          numOfDays: numOfDays,
          numOfDaysLimit: numOfDaysLimit,
          openPositions: openPositions,
          payout: payout,
          payoutPerSymbol: payoutPerSymbol,
          payoutPerSymbolAndContractType: payoutPerSymbolAndContractType,
          remainder: remainder,
          withdrawalForXDaysMonetary: withdrawalForXDaysMonetary,
          withdrawalSinceInceptionMonetary: withdrawalSinceInceptionMonetary,
        );

  /// Instance from JSON
  factory AccountLimits.fromJson(Map<String, dynamic> json) => AccountLimits(
        accountBalance: json['account_balance']?.toDouble(),
        dailyTurnover: json['daily_turnover'],
        lifetimeLimit: json['lifetime_limit']?.toDouble(),
        marketSpecific: json['market_specific'],
        numOfDays: json['num_of_days'],
        numOfDaysLimit: json['num_of_days_limit']?.toDouble(),
        openPositions: json['open_positions'],
        payout: json['payout']?.toDouble(),
        payoutPerSymbol: json['payout_per_symbol'],
        payoutPerSymbolAndContractType:
            json['payout_per_symbol_and_contract_type'],
        remainder: json['remainder']?.toDouble(),
        withdrawalForXDaysMonetary:
            json['withdrawal_for_x_days_monetary']?.toDouble(),
        withdrawalSinceInceptionMonetary:
            json['withdrawal_since_inception_monetary']?.toDouble(),
      );

  /// Clones a new instance
  AccountLimits copyWith({
    double accountBalance,
    double dailyTurnover,
    double lifetimeLimit,
    Map<String, dynamic> marketSpecific,
    int numOfDays,
    double numOfDaysLimit,
    int openPositions,
    double payout,
    String payoutPerSymbol,
    double payoutPerSymbolAndContractType,
    double remainder,
    double withdrawalForXDaysMonetary,
    double withdrawalSinceInceptionMonetary,
  }) =>
      AccountLimits(
        accountBalance: accountBalance ?? this.accountBalance,
        dailyTurnover: dailyTurnover ?? this.dailyTurnover,
        lifetimeLimit: lifetimeLimit ?? this.lifetimeLimit,
        marketSpecific: marketSpecific ?? this.marketSpecific,
        numOfDays: numOfDays ?? this.numOfDays,
        numOfDaysLimit: numOfDaysLimit ?? this.numOfDaysLimit,
        openPositions: openPositions ?? this.openPositions,
        payout: payout ?? this.payout,
        payoutPerSymbol: payoutPerSymbol ?? this.payoutPerSymbol,
        payoutPerSymbolAndContractType: payoutPerSymbolAndContractType ??
            this.payoutPerSymbolAndContractType,
        remainder: remainder ?? this.remainder,
        withdrawalForXDaysMonetary:
            withdrawalForXDaysMonetary ?? this.withdrawalForXDaysMonetary,
        withdrawalSinceInceptionMonetary: withdrawalSinceInceptionMonetary ??
            this.withdrawalSinceInceptionMonetary,
      );
}
