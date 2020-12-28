/// Get limits receive model class
abstract class GetLimitsReceiveModel {
  /// Initializes
  GetLimitsReceiveModel({
    @required this.getLimits,
  });

  /// Trading limits of real account user
  final GetLimits getLimits;
}

/// Get limits receive class
class GetLimitsReceive extends GetLimitsReceiveModel {
  /// Initializes
  GetLimitsReceive({
    @required GetLimits getLimits,
  }) : super(
          getLimits: getLimits,
        );

  /// Creates an instance from JSON
  factory GetLimitsReceive.fromJson(Map<String, dynamic> json) =>
      GetLimitsReceive(
        getLimits: json['get_limits'] == null
            ? null
            : GetLimits.fromJson(json['get_limits']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (getLimits != null) {
      result['get_limits'] = getLimits.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetLimitsReceive copyWith({
    GetLimits getLimits,
  }) =>
      GetLimitsReceive(
        getLimits: getLimits ?? this.getLimits,
      );
}
/// Get limits model class
abstract class GetLimitsModel {
  /// Initializes
  GetLimitsModel({
    @required this.accountBalance,
    @required this.dailyTurnover,
    @required this.lifetimeLimit,
    @required this.marketSpecific,
    @required this.numOfDays,
    @required this.numOfDaysLimit,
    @required this.openPositions,
    @required this.payout,
    this.payoutPerSymbol,
    @required this.payoutPerSymbolAndContractType,
    @required this.remainder,
    @required this.withdrawalForXDaysMonetary,
    @required this.withdrawalSinceInceptionMonetary,
  });

  /// Maximum account cash balance
  final double accountBalance;

  /// Maximum daily turnover
  final double dailyTurnover;

  /// Lifetime withdrawal limit
  final double lifetimeLimit;

  /// Contains limitation information for each market.
  final Map<String, dynamic> marketSpecific;

  /// Number of days for num_of_days_limit withdrawal limit
  final int numOfDays;

  /// Withdrawal limit for num_of_days days
  final double numOfDaysLimit;

  /// Maximum number of open positions
  final int openPositions;

  /// Maximum aggregate payouts on open positions
  final double payout;

  /// Maximum payout for each symbol based on different barrier types.
  final UNKNOWN_TYPE payoutPerSymbol;

  /// Maximum aggregate payouts on open positions per symbol and contract type. This limit can be exceeded up to the overall payout limit if there is no prior open position.
  final double payoutPerSymbolAndContractType;

  /// Amount left to reach withdrawal limit
  final double remainder;

  /// Total withdrawal for num_of_days days
  final double withdrawalForXDaysMonetary;

  /// Total withdrawal since inception
  final double withdrawalSinceInceptionMonetary;
}

/// Get limits class
class GetLimits extends GetLimitsModel {
  /// Initializes
  GetLimits({
    @required double accountBalance,
    @required double dailyTurnover,
    @required double lifetimeLimit,
    @required Map<String, dynamic> marketSpecific,
    @required int numOfDays,
    @required double numOfDaysLimit,
    @required int openPositions,
    @required double payout,
    UNKNOWN_TYPE payoutPerSymbol,
    @required double payoutPerSymbolAndContractType,
    @required double remainder,
    @required double withdrawalForXDaysMonetary,
    @required double withdrawalSinceInceptionMonetary,
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

  /// Creates an instance from JSON
  factory GetLimits.fromJson(Map<String, dynamic> json) => GetLimits(
        accountBalance: getDouble(json['account_balance']),
        dailyTurnover: getDouble(json['daily_turnover']),
        lifetimeLimit: getDouble(json['lifetime_limit']),
        marketSpecific: json['market_specific'],
        numOfDays: json['num_of_days'],
        numOfDaysLimit: getDouble(json['num_of_days_limit']),
        openPositions: json['open_positions'],
        payout: getDouble(json['payout']),
        payoutPerSymbol: json['payout_per_symbol'],
        payoutPerSymbolAndContractType:
            getDouble(json['payout_per_symbol_and_contract_type']),
        remainder: getDouble(json['remainder']),
        withdrawalForXDaysMonetary:
            getDouble(json['withdrawal_for_x_days_monetary']),
        withdrawalSinceInceptionMonetary:
            getDouble(json['withdrawal_since_inception_monetary']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['account_balance'] = accountBalance;
    result['daily_turnover'] = dailyTurnover;
    result['lifetime_limit'] = lifetimeLimit;
    result['market_specific'] = marketSpecific;
    result['num_of_days'] = numOfDays;
    result['num_of_days_limit'] = numOfDaysLimit;
    result['open_positions'] = openPositions;
    result['payout'] = payout;
    result['payout_per_symbol'] = payoutPerSymbol;
    result['payout_per_symbol_and_contract_type'] =
        payoutPerSymbolAndContractType;
    result['remainder'] = remainder;
    result['withdrawal_for_x_days_monetary'] = withdrawalForXDaysMonetary;
    result['withdrawal_since_inception_monetary'] =
        withdrawalSinceInceptionMonetary;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetLimits copyWith({
    double accountBalance,
    double dailyTurnover,
    double lifetimeLimit,
    Map<String, dynamic> marketSpecific,
    int numOfDays,
    double numOfDaysLimit,
    int openPositions,
    double payout,
    UNKNOWN_TYPE payoutPerSymbol,
    double payoutPerSymbolAndContractType,
    double remainder,
    double withdrawalForXDaysMonetary,
    double withdrawalSinceInceptionMonetary,
  }) =>
      GetLimits(
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
