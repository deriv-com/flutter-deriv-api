// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalRequest _$ProposalRequestFromJson(Map<String, dynamic> json) {
  return ProposalRequest()
    ..proposal = json['proposal'] as int
    ..amount = json['amount'] as num
    ..barrier = json['barrier'] as String
    ..barrier2 = json['barrier2'] as String
    ..basis = json['basis'] as String
    ..contractType = json['contract_type'] as String
    ..currency = json['currency'] as String
    ..dateExpiry = json['date_expiry'] as int
    ..dateStart = json['date_start'] as int
    ..duration = json['duration'] as int
    ..durationUnit = json['duration_unit'] as String
    ..multiplier = json['multiplier'] as num
    ..productType = json['product_type'] as String
    ..selectedTick = json['selected_tick'] as int
    ..subscribe = json['subscribe'] as int
    ..symbol = json['symbol'] as String
    ..tradingPeriodStart = json['trading_period_start'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProposalRequestToJson(ProposalRequest instance) =>
    <String, dynamic>{
      'proposal': instance.proposal,
      'amount': instance.amount,
      'barrier': instance.barrier,
      'barrier2': instance.barrier2,
      'basis': instance.basis,
      'contract_type': instance.contractType,
      'currency': instance.currency,
      'date_expiry': instance.dateExpiry,
      'date_start': instance.dateStart,
      'duration': instance.duration,
      'duration_unit': instance.durationUnit,
      'multiplier': instance.multiplier,
      'product_type': instance.productType,
      'selected_tick': instance.selectedTick,
      'subscribe': instance.subscribe,
      'symbol': instance.symbol,
      'trading_period_start': instance.tradingPeriodStart,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
