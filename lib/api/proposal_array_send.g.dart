// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_array_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalArrayRequest _$ProposalArrayRequestFromJson(Map<String, dynamic> json) {
  return ProposalArrayRequest()
    ..proposalArray = json['proposal_array'] as int
    ..amount = json['amount'] as num
    ..barriers = (json['barriers'] as List).map((e) => e as String).toList()
    ..basis = json['basis'] as String
    ..contractType =
        (json['contract_type'] as List).map((e) => e as String).toList()
    ..currency = json['currency'] as String
    ..dateExpiry = json['date_expiry'] as int
    ..dateStart = json['date_start'] as int
    ..duration = json['duration'] as int
    ..durationUnit = json['duration_unit'] as String
    ..multiplier = json['multiplier'] as num
    ..productType = json['product_type'] as String
    ..subscribe = json['subscribe'] as int
    ..symbol = json['symbol'] as String
    ..tradingPeriodStart = json['trading_period_start'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProposalArrayRequestToJson(
        ProposalArrayRequest instance) =>
    <String, dynamic>{
      'proposal_array': instance.proposalArray,
      'amount': instance.amount,
      'barriers': instance.barriers,
      'basis': instance.basis,
      'contract_type': instance.contractType,
      'currency': instance.currency,
      'date_expiry': instance.dateExpiry,
      'date_start': instance.dateStart,
      'duration': instance.duration,
      'duration_unit': instance.durationUnit,
      'multiplier': instance.multiplier,
      'product_type': instance.productType,
      'subscribe': instance.subscribe,
      'symbol': instance.symbol,
      'trading_period_start': instance.tradingPeriodStart,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
