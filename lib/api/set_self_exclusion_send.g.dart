// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_self_exclusion_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetSelfExclusionRequest _$SetSelfExclusionRequestFromJson(
    Map<String, dynamic> json) {
  return SetSelfExclusionRequest(
    excludeUntil: json['exclude_until'] as String,
    max30dayLosses: json['max30day_losses'] as String,
    max30dayTurnover: json['max30day_turnover'] as String,
    max7dayLosses: json['max7day_losses'] as String,
    max7dayTurnover: json['max7day_turnover'] as String,
    maxBalance: json['max_balance'] as String,
    maxDeposit: json['max_deposit'] as String,
    maxDepositEndDate: json['max_deposit_end_date'] as String,
    maxLosses: json['max_losses'] as String,
    maxOpenBets: json['max_open_bets'] as String,
    maxTurnover: json['max_turnover'] as String,
    sessionDurationLimit: json['session_duration_limit'] as String,
    setSelfExclusion: json['set_self_exclusion'] as int,
    timeoutUntil: json['timeout_until'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SetSelfExclusionRequestToJson(
        SetSelfExclusionRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
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
