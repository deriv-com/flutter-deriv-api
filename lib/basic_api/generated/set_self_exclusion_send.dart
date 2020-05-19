/// generated automatically from flutter_deriv_api|lib/basic_api/generated/set_self_exclusion_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'set_self_exclusion_send.g.dart';

/// JSON conversion for 'set_self_exclusion_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class SetSelfExclusionRequest extends Request {
  /// Initialize SetSelfExclusionRequest
  const SetSelfExclusionRequest({
    this.excludeUntil,
    this.max30dayLosses,
    this.max30dayTurnover,
    this.max7dayLosses,
    this.max7dayTurnover,
    this.maxBalance,
    this.maxDeposit,
    this.maxDepositEndDate,
    this.maxLosses,
    this.maxOpenBets,
    this.maxTurnover,
    this.sessionDurationLimit,
    this.setSelfExclusion = 1,
    this.timeoutUntil,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'set_self_exclusion',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SetSelfExclusionRequest.fromJson(Map<String, dynamic> json) =>
      _$SetSelfExclusionRequestFromJson(json);

  // Properties
  /// [Optional] Exclude me from the website (for a minimum of 6 months, up to a maximum of 5 years). Note: uplifting this self-exclusion may require contacting the company.
  final String excludeUntil;

  /// [Optional] 30-day limit on losses.
  final num max30dayLosses;

  /// [Optional] 30-day turnover limit.
  final num max30dayTurnover;

  /// [Optional] 7-day limit on losses.
  final num max7dayLosses;

  /// [Optional] 7-day turnover limit.
  final num max7dayTurnover;

  /// [Optional] Maximum account cash balance.
  final num maxBalance;

  /// [Optional] Deposit limit.
  final num maxDeposit;

  /// [Optional] Exclude me from making deposits when the cumulative sum of deposits exceeds specified deposit limit.
  final String maxDepositEndDate;

  /// [Optional] Daily limit on losses.
  final num maxLosses;

  /// [Optional] Maximum number of open positions.
  final int maxOpenBets;

  /// [Optional] Daily turnover limit.
  final num maxTurnover;

  /// [Optional] Session duration limit, in minutes.
  final int sessionDurationLimit;

  /// Must be `1`
  final int setSelfExclusion;

  /// [Optional] Exclude me from the website (for up to 6 weeks). Requires time in epoch format. Note: unlike `exclude_until`, this self-exclusion will be lifted automatically at the expiry of the timeout period.
  final int timeoutUntil;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$SetSelfExclusionRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  SetSelfExclusionRequest copyWith({
    String excludeUntil,
    num max30dayLosses,
    num max30dayTurnover,
    num max7dayLosses,
    num max7dayTurnover,
    num maxBalance,
    num maxDeposit,
    String maxDepositEndDate,
    num maxLosses,
    int maxOpenBets,
    num maxTurnover,
    int sessionDurationLimit,
    int setSelfExclusion,
    int timeoutUntil,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      SetSelfExclusionRequest(
        excludeUntil: excludeUntil ?? this.excludeUntil,
        max30dayLosses: max30dayLosses ?? this.max30dayLosses,
        max30dayTurnover: max30dayTurnover ?? this.max30dayTurnover,
        max7dayLosses: max7dayLosses ?? this.max7dayLosses,
        max7dayTurnover: max7dayTurnover ?? this.max7dayTurnover,
        maxBalance: maxBalance ?? this.maxBalance,
        maxDeposit: maxDeposit ?? this.maxDeposit,
        maxDepositEndDate: maxDepositEndDate ?? this.maxDepositEndDate,
        maxLosses: maxLosses ?? this.maxLosses,
        maxOpenBets: maxOpenBets ?? this.maxOpenBets,
        maxTurnover: maxTurnover ?? this.maxTurnover,
        sessionDurationLimit: sessionDurationLimit ?? this.sessionDurationLimit,
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
        timeoutUntil: timeoutUntil ?? this.timeoutUntil,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
