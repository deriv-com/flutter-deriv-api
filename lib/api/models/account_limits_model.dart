import 'account_market_specific_model.dart';
import 'base_model.dart';

/// Model class Trading limits of real account user
abstract class AccountLimitsModel extends BaseModel{
  /// Initializes
  AccountLimitsModel({
    this.accountBalance,
    this.dailyTurnover,
    this.lifetimeLimit,
    this.marketSpecific,
    this.numOfDays,
    this.numOfDaysLimit,
    this.openPositions,
    this.payout,
    this.payoutPerSymbol,
    this.payoutPerSymbolAndContractType,
    this.remainder,
    this.withdrawalForXDaysMonetary,
    this.withdrawalSinceInceptionMonetary,
  });

  /// Maximum account cash balance
  final double accountBalance;

  /// Maximum daily turnover
  final double dailyTurnover;

  /// Lifetime withdrawal limit
  final double lifetimeLimit;

  /// Contains limitation information for each market.
  final AccountMarketSpecificModel marketSpecific;

  /// Number of days for num_of_days_limit withdrawal limit
  final int numOfDays;

  /// Withdrawal limit for num_of_days days
  final double numOfDaysLimit;

  /// Maximum number of open positions
  final int openPositions;

  /// Maximum aggregate payouts on open positions
  final double payout;

  /// Maximum payout for each symbol based on different barrier types.
  final String payoutPerSymbol;

  /// Maximum aggregate payouts on open positions per symbol and contract type. This limit can be exceeded up to the overall payout limit if there is no prior open position.
  final double payoutPerSymbolAndContractType;

  /// Amount left to reach withdrawal limit
  final double remainder;

  /// Total withdrawal for num_of_days days
  final double withdrawalForXDaysMonetary;

  /// Total withdrawal since inception
  final double withdrawalSinceInceptionMonetary;
}
