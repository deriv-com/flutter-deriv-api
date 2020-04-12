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
    paymentagentTransfer: json['paymentagent_transfer'] as int,
    transferTo: json['transfer_to'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PaymentagentTransferRequestToJson(
        PaymentagentTransferRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'dry_run': instance.dryRun,
      'paymentagent_transfer': instance.paymentagentTransfer,
      'transfer_to': instance.transferTo,
    };
