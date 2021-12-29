/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_self_exclusion_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Set self exclusion request class.
class SetSelfExclusionRequest extends Request {
  /// Initialize SetSelfExclusionRequest.
  const SetSelfExclusionRequest({
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
    this.setSelfExclusion = true,
    this.timeoutUntil,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'set_self_exclusion',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory SetSelfExclusionRequest.fromJson(Map<String, dynamic> json) =>
      SetSelfExclusionRequest(
        excludeUntil: json['exclude_until'] as String?,
        max30dayDeposit: json['max_30day_deposit'] as num?,
        max30dayLosses: json['max_30day_losses'] as num?,
        max30dayTurnover: json['max_30day_turnover'] as num?,
        max7dayDeposit: json['max_7day_deposit'] as num?,
        max7dayLosses: json['max_7day_losses'] as num?,
        max7dayTurnover: json['max_7day_turnover'] as num?,
        maxBalance: json['max_balance'] as num?,
        maxDeposit: json['max_deposit'] as num?,
        maxLosses: json['max_losses'] as num?,
        maxOpenBets: json['max_open_bets'] as int?,
        maxTurnover: json['max_turnover'] as num?,
        sessionDurationLimit: json['session_duration_limit'] as int?,
        setSelfExclusion: json['set_self_exclusion'] == null
            ? null
            : json['set_self_exclusion'] == 1,
        timeoutUntil: json['timeout_until'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Exclude me from the website (for a minimum of 6 months, up to a maximum of 5 years). Note: uplifting this self-exclusion may require contacting the company.
  final String? excludeUntil;

  /// [Optional] 7-day limit on deposits.
  final num? max30dayDeposit;

  /// [Optional] 30-day limit on losses.
  final num? max30dayLosses;

  /// [Optional] 30-day turnover limit.
  final num? max30dayTurnover;

  /// [Optional] 7-day limit on deposits.
  final num? max7dayDeposit;

  /// [Optional] 7-day limit on losses.
  final num? max7dayLosses;

  /// [Optional] 7-day turnover limit.
  final num? max7dayTurnover;

  /// [Optional] Maximum account cash balance.
  final num? maxBalance;

  /// [Optional] Daily deposit limit.
  final num? maxDeposit;

  /// [Optional] Daily limit on losses.
  final num? maxLosses;

  /// [Optional] Maximum number of open positions.
  final int? maxOpenBets;

  /// [Optional] Daily turnover limit.
  final num? maxTurnover;

  /// [Optional] Session duration limit, in minutes.
  final int? sessionDurationLimit;

  /// Must be `true`
  final bool? setSelfExclusion;

  /// [Optional] Exclude me from the website (for up to 6 weeks). Requires time in epoch format. Note: unlike `exclude_until`, this self-exclusion will be lifted automatically at the expiry of the timeout period.
  final int? timeoutUntil;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'exclude_until': excludeUntil,
        'max_30day_deposit': max30dayDeposit,
        'max_30day_losses': max30dayLosses,
        'max_30day_turnover': max30dayTurnover,
        'max_7day_deposit': max7dayDeposit,
        'max_7day_losses': max7dayLosses,
        'max_7day_turnover': max7dayTurnover,
        'max_balance': maxBalance,
        'max_deposit': maxDeposit,
        'max_losses': maxLosses,
        'max_open_bets': maxOpenBets,
        'max_turnover': maxTurnover,
        'session_duration_limit': sessionDurationLimit,
        'set_self_exclusion': setSelfExclusion == null
            ? null
            : setSelfExclusion!
                ? 1
                : 0,
        'timeout_until': timeoutUntil,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetSelfExclusionRequest copyWith({
    String? excludeUntil,
    num? max30dayDeposit,
    num? max30dayLosses,
    num? max30dayTurnover,
    num? max7dayDeposit,
    num? max7dayLosses,
    num? max7dayTurnover,
    num? maxBalance,
    num? maxDeposit,
    num? maxLosses,
    int? maxOpenBets,
    num? maxTurnover,
    int? sessionDurationLimit,
    bool? setSelfExclusion,
    int? timeoutUntil,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SetSelfExclusionRequest(
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
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
        timeoutUntil: timeoutUntil ?? this.timeoutUntil,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
