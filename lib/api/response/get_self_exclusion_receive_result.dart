import 'package:meta/meta.dart';

import '../../basic_api/generated/get_self_exclusion_receive.dart';
import '../../basic_api/generated/get_self_exclusion_send.dart';
import '../../basic_api/generated/set_self_exclusion_receive.dart';
import '../../basic_api/generated/set_self_exclusion_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Get self exclusion response model class
abstract class GetSelfExclusionResponseModel {
  /// Initializes
  GetSelfExclusionResponseModel({
    @required this.getSelfExclusion,
  });

  /// List of values set for self exclusion.
  final GetSelfExclusion getSelfExclusion;
}

/// Get self exclusion response class
class GetSelfExclusionResponse extends GetSelfExclusionResponseModel {
  /// Initializes
  GetSelfExclusionResponse({
    @required GetSelfExclusion getSelfExclusion,
  }) : super(
          getSelfExclusion: getSelfExclusion,
        );

  /// Creates an instance from JSON
  factory GetSelfExclusionResponse.fromJson(
    dynamic getSelfExclusionJson,
  ) =>
      GetSelfExclusionResponse(
        getSelfExclusion: getSelfExclusionJson == null
            ? null
            : GetSelfExclusion.fromJson(getSelfExclusionJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getSelfExclusion != null) {
      resultMap['get_self_exclusion'] = getSelfExclusion.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Allows users to exclude themselves from the website for certain periods of time,
  /// or to set limits on their trading activities.
  ///
  /// This facility is a regulatory requirement for certain Landing Companies.
  /// For parameters information refer to [GetSelfExclusionRequest].
  /// Throws a [SelfExclusionException] if API response contains an error
  static Future<GetSelfExclusionResponse> fetchSelfExclusion([
    GetSelfExclusionSend request,
  ]) async {
    final GetSelfExclusionReceive response = await _api.call(
      request: request ?? const GetSelfExclusionSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          SelfExclusionException(baseExceptionModel: baseExceptionModel),
    );

    return GetSelfExclusionResponse.fromJson(response.getSelfExclusion);
  }

  /// Sets Self-Exclusion (this call should be used in conjunction with [fetchSelfExclusion])
  ///
  /// For parameters information refer to [SetSelfExclusionRequest].
  /// Throws a [SelfExclusionException] if API response contains an error
  static Future<bool> setSelfExclusion(SetSelfExclusionSend request) async {
    final SetSelfExclusionReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          SelfExclusionException(baseExceptionModel: baseExceptionModel),
    );

    return getBool(response.setSelfExclusion);
  }

  /// Excludes user from the website based this parameters
  ///
  /// (this call should be used in conjunction with [fetchSelfExclusion])
  /// Throws a [SelfExclusionException] if API response contains an error
  Future<bool> exclude() async {
    final SetSelfExclusionReceive response = await _api.call(
      request: SetSelfExclusionSend(
        excludeUntil: getSelfExclusion.excludeUntil,
        max30dayDeposit: getSelfExclusion.max30dayDeposit,
        max30dayLosses: getSelfExclusion.max30dayLosses,
        max30dayTurnover: getSelfExclusion.max30dayTurnover,
        max7dayDeposit: getSelfExclusion.max7dayDeposit,
        max7dayLosses: getSelfExclusion.max7dayLosses,
        max7dayTurnover: getSelfExclusion.max7dayTurnover,
        maxBalance: getSelfExclusion.maxBalance,
        maxDeposit: getSelfExclusion.maxDeposit,
        maxLosses: getSelfExclusion.maxLosses,
        maxOpenBets: getSelfExclusion.maxOpenBets,
        maxTurnover: getSelfExclusion.maxTurnover,
        sessionDurationLimit: getSelfExclusion.sessionDurationLimit,
        timeoutUntil:
            getSecondsSinceEpochDateTime(getSelfExclusion.timeoutUntil),
      ),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          SelfExclusionException(baseExceptionModel: baseExceptionModel),
    );

    return getBool(response.setSelfExclusion);
  }

  /// Creates a copy of instance with given parameters
  GetSelfExclusionResponse copyWith({
    GetSelfExclusion getSelfExclusion,
  }) =>
      GetSelfExclusionResponse(
        getSelfExclusion: getSelfExclusion ?? this.getSelfExclusion,
      );
}
/// Get self exclusion model class
abstract class GetSelfExclusionModel {
  /// Initializes
  GetSelfExclusionModel({
    @required this.timeoutUntil,
    @required this.sessionDurationLimit,
    @required this.maxTurnover,
    @required this.maxOpenBets,
    @required this.maxLosses,
    @required this.maxDeposit,
    @required this.maxBalance,
    @required this.max7dayTurnover,
    @required this.max7dayLosses,
    @required this.max7dayDeposit,
    @required this.max30dayTurnover,
    @required this.max30dayLosses,
    @required this.max30dayDeposit,
    @required this.excludeUntil,
  });

  /// Exclude me from the website (for up to 6 weeks). The time is in epoch format. Note: unlike `exclude_until`, this self-exclusion will be lifted automatically at the expiry of the timeout period.
  final DateTime timeoutUntil;

  /// Session duration limit, in minutes
  final int sessionDurationLimit;

  /// Daily turnover limit
  final double maxTurnover;

  /// Maximum number of open positions
  final int maxOpenBets;

  /// Daily limit on losses
  final double maxLosses;

  /// Daily limit on deposits
  final double maxDeposit;

  /// Maximum account cash balance
  final double maxBalance;

  /// 7-day turnover limit
  final double max7dayTurnover;

  /// 7-day limit on losses
  final double max7dayLosses;

  /// 7-day limit on deposits
  final double max7dayDeposit;

  /// 30-day turnover limit
  final double max30dayTurnover;

  /// 30-day limit on losses
  final double max30dayLosses;

  /// 30-day limit on deposits
  final double max30dayDeposit;

  /// Exclude me from the website (for a minimum of 6 months, up to a maximum of 5 years). Note: uplifting this self-exclusion may require contacting the company.
  final String excludeUntil;
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
    @required DateTime timeoutUntil,
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
        timeoutUntil: getDateTime(json['timeout_until']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['exclude_until'] = excludeUntil;
    resultMap['max_30day_deposit'] = max30dayDeposit;
    resultMap['max_30day_losses'] = max30dayLosses;
    resultMap['max_30day_turnover'] = max30dayTurnover;
    resultMap['max_7day_deposit'] = max7dayDeposit;
    resultMap['max_7day_losses'] = max7dayLosses;
    resultMap['max_7day_turnover'] = max7dayTurnover;
    resultMap['max_balance'] = maxBalance;
    resultMap['max_deposit'] = maxDeposit;
    resultMap['max_losses'] = maxLosses;
    resultMap['max_open_bets'] = maxOpenBets;
    resultMap['max_turnover'] = maxTurnover;
    resultMap['session_duration_limit'] = sessionDurationLimit;
    resultMap['timeout_until'] = getSecondsSinceEpochDateTime(timeoutUntil);

    return resultMap;
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
    DateTime timeoutUntil,
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
