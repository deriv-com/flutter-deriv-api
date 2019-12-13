// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_transfer_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentTransferRequest _$PaymentagentTransferRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentagentTransferRequest(
    amount: json['amount'] as num,
    currency: json['currency'] as String,
    description: json['description'] as String,
    dryRun: json['dry_run'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    paymentagentTransfer: json['paymentagent_transfer'] as int,
    reqId: json['req_id'] as int,
    transferTo: json['transfer_to'] as String,
  );
}

Map<String, dynamic> _$PaymentagentTransferRequestToJson(
        PaymentagentTransferRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'dry_run': instance.dryRun,
      'passthrough': instance.passthrough,
      'paymentagent_transfer': instance.paymentagentTransfer,
      'req_id': instance.reqId,
      'transfer_to': instance.transferTo,
    };
