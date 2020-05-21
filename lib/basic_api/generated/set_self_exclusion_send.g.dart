// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_self_exclusion_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetSelfExclusionRequest _$SetSelfExclusionRequestFromJson(
    Map<String, dynamic> json) {
  return SetSelfExclusionRequest(
    excludeUntil: json['exclude_until'] as String,
    max30dayLosses: json['max30day_losses'] as num,
    max30dayTurnover: json['max30day_turnover'] as num,
    max7dayLosses: json['max7day_losses'] as num,
    max7dayTurnover: json['max7day_turnover'] as num,
    maxBalance: json['max_balance'] as num,
    maxDeposit: json['max_deposit'] as num,
    maxDepositEndDate: json['max_deposit_end_date'] as String,
    maxLosses: json['max_losses'] as num,
    maxOpenBets: json['max_open_bets'] as int,
    maxTurnover: json['max_turnover'] as num,
    sessionDurationLimit: json['session_duration_limit'] as int,
    setSelfExclusion: json['set_self_exclusion'] as int,
    timeoutUntil: json['timeout_until'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$SetSelfExclusionRequestToJson(
        SetSelfExclusionRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'exclude_until': instance.excludeUntil,
      'max30day_losses': instance.max30dayLosses,
      'max30day_turnover': instance.max30dayTurnover,
      'max7day_losses': instance.max7dayLosses,
      'max7day_turnover': instance.max7dayTurnover,
      'max_balance': instance.maxBalance,
      'max_deposit': instance.maxDeposit,
      'max_deposit_end_date': instance.maxDepositEndDate,
      'max_losses': instance.maxLosses,
      'max_open_bets': instance.maxOpenBets,
      'max_turnover': instance.maxTurnover,
      'session_duration_limit': instance.sessionDurationLimit,
      'set_self_exclusion': instance.setSelfExclusion,
      'timeout_until': instance.timeoutUntil,
    };
