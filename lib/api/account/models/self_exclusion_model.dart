import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Self exclusion model class
abstract class SelfExclusionModel extends APIBaseModel {
  /// Initializes
  SelfExclusionModel({
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

  /// Exclude me from the website (for a minimum of 6 months, up to a maximum of 5 years). Note: uplifting this self-exclusion may require contacting the company.
  final DateTime? excludeUntil;

  /// 7-day limit on deposits.
  final num? max30dayDeposit;

  /// 30-day limit on losses
  final double? max30dayLosses;

  /// 30-day turnover limit
  final double? max30dayTurnover;

  /// 7-day limit on deposits.
  final num? max7dayDeposit;

  /// 7-day limit on losses
  final double? max7dayLosses;

  /// 7-day turnover limit
  final double? max7dayTurnover;

  /// Maximum account cash balance
  final double? maxBalance;

  /// Deposit limit.
  final double? maxDeposit;

  /// Daily limit on losses
  final double? maxLosses;

  /// Maximum number of open positions
  final int? maxOpenBets;

  /// Daily turnover limit
  final double? maxTurnover;

  /// Session duration limit, in minutes
  final int? sessionDurationLimit;

  /// Exclude me from the website (for up to 6 weeks). The time is in epoch format. Note: unlike `exclude_until`, this self-exclusion will be lifted automatically at the expiry of the timeout period.
  final DateTime? timeoutUntil;
}
