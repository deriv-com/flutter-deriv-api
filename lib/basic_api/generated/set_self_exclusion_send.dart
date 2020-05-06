/// generated automatically from flutter_deriv_api|lib/basic_api/generated/set_self_exclusion_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'set_self_exclusion_send.g.dart';

/// JSON conversion for 'set_self_exclusion_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
  final String max30dayLosses;

  /// [Optional] 30-day turnover limit.
  final String max30dayTurnover;

  /// [Optional] 7-day limit on losses.
  final String max7dayLosses;

  /// [Optional] 7-day turnover limit.
  final String max7dayTurnover;

  /// [Optional] Maximum account cash balance.
  final String maxBalance;

  /// [Optional] Deposit limit.
  final String maxDeposit;

  /// [Optional] Exclude me from making deposits when the cumulative sum of deposits exceeds specified deposit limit.
  final String maxDepositEndDate;

  /// [Optional] Daily limit on losses.
  final String maxLosses;

  /// [Optional] Maximum number of open positions.
  final String maxOpenBets;

  /// [Optional] Daily turnover limit.
  final String maxTurnover;

  /// [Optional] Session duration limit, in minutes.
  final String sessionDurationLimit;

  /// Must be `1`
  final int setSelfExclusion;

  /// [Optional] Exclude me from the website (for up to 6 weeks). Requires time in epoch format. Note: unlike `exclude_until`, this self-exclusion will be lifted automatically at the expiry of the timeout period.
  final String timeoutUntil;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$SetSelfExclusionRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  SetSelfExclusionRequest copyWith({
    String excludeUntil,
    String max30dayLosses,
    String max30dayTurnover,
    String max7dayLosses,
    String max7dayTurnover,
    String maxBalance,
    String maxDeposit,
    String maxDepositEndDate,
    String maxLosses,
    String maxOpenBets,
    String maxTurnover,
    String sessionDurationLimit,
    int setSelfExclusion,
    String timeoutUntil,
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
