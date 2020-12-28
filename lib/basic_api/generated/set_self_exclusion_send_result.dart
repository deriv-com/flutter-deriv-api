/// Set self exclusion send model class
abstract class SetSelfExclusionSendModel {
  /// Initializes
  SetSelfExclusionSendModel({
    @required this.setSelfExclusion,
    this.excludeUntil,
    this.max30dayDeposit,
    this.max30dayLosses,
    this.max30dayTurnover,
    this.max7dayDeposit,
    this.max7dayLosses,
    this.max7dayTurnover,
    this.maxBalance,
    this.maxDeposit,
    this.maxLosses,
    this.maxOpenBets,
    this.maxTurnover,
    this.sessionDurationLimit,
    this.timeoutUntil,
  });

  /// Must be `1`
  final int setSelfExclusion;

  /// [Optional] Exclude me from the website (for a minimum of 6 months, up to a maximum of 5 years). Note: uplifting this self-exclusion may require contacting the company.
  final UNKNOWN_TYPE excludeUntil;

  /// [Optional] 7-day limit on deposits.
  final double max30dayDeposit;

  /// [Optional] 30-day limit on losses.
  final double max30dayLosses;

  /// [Optional] 30-day turnover limit.
  final double max30dayTurnover;

  /// [Optional] 7-day limit on deposits.
  final double max7dayDeposit;

  /// [Optional] 7-day limit on losses.
  final double max7dayLosses;

  /// [Optional] 7-day turnover limit.
  final double max7dayTurnover;

  /// [Optional] Maximum account cash balance.
  final double maxBalance;

  /// [Optional] Daily deposit limit.
  final double maxDeposit;

  /// [Optional] Daily limit on losses.
  final double maxLosses;

  /// [Optional] Maximum number of open positions.
  final double maxOpenBets;

  /// [Optional] Daily turnover limit.
  final double maxTurnover;

  /// [Optional] Session duration limit, in minutes.
  final double sessionDurationLimit;

  /// [Optional] Exclude me from the website (for up to 6 weeks). Requires time in epoch format. Note: unlike `exclude_until`, this self-exclusion will be lifted automatically at the expiry of the timeout period.
  final double timeoutUntil;
}

/// Set self exclusion send class
class SetSelfExclusionSend extends SetSelfExclusionSendModel {
  /// Initializes
  SetSelfExclusionSend({
    @required int setSelfExclusion,
    UNKNOWN_TYPE excludeUntil,
    double max30dayDeposit,
    double max30dayLosses,
    double max30dayTurnover,
    double max7dayDeposit,
    double max7dayLosses,
    double max7dayTurnover,
    double maxBalance,
    double maxDeposit,
    double maxLosses,
    double maxOpenBets,
    double maxTurnover,
    double sessionDurationLimit,
    double timeoutUntil,
  }) : super(
          setSelfExclusion: setSelfExclusion,
          excludeUntil: excludeUntil,
          max30dayDeposit: max30dayDeposit,
          max30dayLosses: max30dayLosses,
          max30dayTurnover: max30dayTurnover,
          max7dayDeposit: max7dayDeposit,
          max7dayLosses: max7dayLosses,
          max7dayTurnover: max7dayTurnover,
          maxBalance: maxBalance,
          maxDeposit: maxDeposit,
          maxLosses: maxLosses,
          maxOpenBets: maxOpenBets,
          maxTurnover: maxTurnover,
          sessionDurationLimit: sessionDurationLimit,
          timeoutUntil: timeoutUntil,
        );

  /// Creates an instance from JSON
  factory SetSelfExclusionSend.fromJson(Map<String, dynamic> json) =>
      SetSelfExclusionSend(
        setSelfExclusion: json['set_self_exclusion'],
        excludeUntil: json['exclude_until'],
        max30dayDeposit: getDouble(json['max_30day_deposit']),
        max30dayLosses: getDouble(json['max_30day_losses']),
        max30dayTurnover: getDouble(json['max_30day_turnover']),
        max7dayDeposit: getDouble(json['max_7day_deposit']),
        max7dayLosses: getDouble(json['max_7day_losses']),
        max7dayTurnover: getDouble(json['max_7day_turnover']),
        maxBalance: getDouble(json['max_balance']),
        maxDeposit: getDouble(json['max_deposit']),
        maxLosses: getDouble(json['max_losses']),
        maxOpenBets: getDouble(json['max_open_bets']),
        maxTurnover: getDouble(json['max_turnover']),
        sessionDurationLimit: getDouble(json['session_duration_limit']),
        timeoutUntil: getDouble(json['timeout_until']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['set_self_exclusion'] = setSelfExclusion;
    result['exclude_until'] = excludeUntil;
    result['max_30day_deposit'] = max30dayDeposit;
    result['max_30day_losses'] = max30dayLosses;
    result['max_30day_turnover'] = max30dayTurnover;
    result['max_7day_deposit'] = max7dayDeposit;
    result['max_7day_losses'] = max7dayLosses;
    result['max_7day_turnover'] = max7dayTurnover;
    result['max_balance'] = maxBalance;
    result['max_deposit'] = maxDeposit;
    result['max_losses'] = maxLosses;
    result['max_open_bets'] = maxOpenBets;
    result['max_turnover'] = maxTurnover;
    result['session_duration_limit'] = sessionDurationLimit;
    result['timeout_until'] = timeoutUntil;

    return result;
  }

  /// Creates a copy of instance with given parameters
  SetSelfExclusionSend copyWith({
    int setSelfExclusion,
    UNKNOWN_TYPE excludeUntil,
    double max30dayDeposit,
    double max30dayLosses,
    double max30dayTurnover,
    double max7dayDeposit,
    double max7dayLosses,
    double max7dayTurnover,
    double maxBalance,
    double maxDeposit,
    double maxLosses,
    double maxOpenBets,
    double maxTurnover,
    double sessionDurationLimit,
    double timeoutUntil,
  }) =>
      SetSelfExclusionSend(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
        excludeUntil: excludeUntil ?? this.excludeUntil,
        max30dayDeposit: max30dayDeposit ?? this.max30dayDeposit,
        max30dayLosses: max30dayLosses ?? this.max30dayLosses,
        max30dayTurnover: max30dayTurnover ?? this.max30dayTurnover,
        max7dayDeposit: max7dayDeposit ?? this.max7dayDeposit,
        max7dayLosses: max7dayLosses ?? this.max7dayLosses,
        max7dayTurnover: max7dayTurnover ?? this.max7dayTurnover,
        maxBalance: maxBalance ?? this.maxBalance,
        maxDeposit: maxDeposit ?? this.maxDeposit,
        maxLosses: maxLosses ?? this.maxLosses,
        maxOpenBets: maxOpenBets ?? this.maxOpenBets,
        maxTurnover: maxTurnover ?? this.maxTurnover,
        sessionDurationLimit: sessionDurationLimit ?? this.sessionDurationLimit,
        timeoutUntil: timeoutUntil ?? this.timeoutUntil,
      );
}
