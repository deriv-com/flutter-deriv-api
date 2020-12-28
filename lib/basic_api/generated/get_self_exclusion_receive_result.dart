/// Get self exclusion receive model class
abstract class GetSelfExclusionReceiveModel {
  /// Initializes
  GetSelfExclusionReceiveModel({
    @required this.getSelfExclusion,
  });

  /// List of values set for self exclusion.
  final GetSelfExclusion getSelfExclusion;
}

/// Get self exclusion receive class
class GetSelfExclusionReceive extends GetSelfExclusionReceiveModel {
  /// Initializes
  GetSelfExclusionReceive({
    @required GetSelfExclusion getSelfExclusion,
  }) : super(
          getSelfExclusion: getSelfExclusion,
        );

  /// Creates an instance from JSON
  factory GetSelfExclusionReceive.fromJson(Map<String, dynamic> json) =>
      GetSelfExclusionReceive(
        getSelfExclusion: json['get_self_exclusion'] == null
            ? null
            : GetSelfExclusion.fromJson(json['get_self_exclusion']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (getSelfExclusion != null) {
      result['get_self_exclusion'] = getSelfExclusion.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetSelfExclusionReceive copyWith({
    GetSelfExclusion getSelfExclusion,
  }) =>
      GetSelfExclusionReceive(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
      );
}
/// Get self exclusion model class
abstract class GetSelfExclusionModel {
  /// Initializes
  GetSelfExclusionModel({
    @required this.excludeUntil,
    @required this.max30dayDeposit,
    @required this.max30dayLosses,
    @required this.max30dayTurnover,
    @required this.max7dayDeposit,
    @required this.max7dayLosses,
    @required this.max7dayTurnover,
    @required this.maxBalance,
    @required this.maxDeposit,
    @required this.maxLosses,
    @required this.maxOpenBets,
    @required this.maxTurnover,
    @required this.sessionDurationLimit,
    @required this.timeoutUntil,
  });

  /// Exclude me from the website (for a minimum of 6 months, up to a maximum of 5 years). Note: uplifting this self-exclusion may require contacting the company.
  final String excludeUntil;

  /// 30-day limit on deposits
  final double max30dayDeposit;

  /// 30-day limit on losses
  final double max30dayLosses;

  /// 30-day turnover limit
  final double max30dayTurnover;

  /// 7-day limit on deposits
  final double max7dayDeposit;

  /// 7-day limit on losses
  final double max7dayLosses;

  /// 7-day turnover limit
  final double max7dayTurnover;

  /// Maximum account cash balance
  final double maxBalance;

  /// Daily limit on deposits
  final double maxDeposit;

  /// Daily limit on losses
  final double maxLosses;

  /// Maximum number of open positions
  final int maxOpenBets;

  /// Daily turnover limit
  final double maxTurnover;

  /// Session duration limit, in minutes
  final int sessionDurationLimit;

  /// Exclude me from the website (for up to 6 weeks). The time is in epoch format. Note: unlike `exclude_until`, this self-exclusion will be lifted automatically at the expiry of the timeout period.
  final int timeoutUntil;
}

/// Get self exclusion class
class GetSelfExclusion extends GetSelfExclusionModel {
  /// Initializes
  GetSelfExclusion({
    @required String excludeUntil,
    @required double max30dayDeposit,
    @required double max30dayLosses,
    @required double max30dayTurnover,
    @required double max7dayDeposit,
    @required double max7dayLosses,
    @required double max7dayTurnover,
    @required double maxBalance,
    @required double maxDeposit,
    @required double maxLosses,
    @required int maxOpenBets,
    @required double maxTurnover,
    @required int sessionDurationLimit,
    @required int timeoutUntil,
  }) : super(
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
  factory GetSelfExclusion.fromJson(Map<String, dynamic> json) =>
      GetSelfExclusion(
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
        maxOpenBets: json['max_open_bets'],
        maxTurnover: getDouble(json['max_turnover']),
        sessionDurationLimit: json['session_duration_limit'],
        timeoutUntil: json['timeout_until'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

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
  GetSelfExclusion copyWith({
    String excludeUntil,
    double max30dayDeposit,
    double max30dayLosses,
    double max30dayTurnover,
    double max7dayDeposit,
    double max7dayLosses,
    double max7dayTurnover,
    double maxBalance,
    double maxDeposit,
    double maxLosses,
    int maxOpenBets,
    double maxTurnover,
    int sessionDurationLimit,
    int timeoutUntil,
  }) =>
      GetSelfExclusion(
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
