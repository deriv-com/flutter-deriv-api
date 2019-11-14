// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_transfer_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentTransferRequest _$PaymentagentTransferRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentagentTransferRequest()
    ..paymentagentTransfer = json['paymentagent_transfer'] as int
    ..description = json['description'] as String
    ..amount = json['amount'] as num
    ..currency = json['currency'] as String
    ..dryRun = json['dry_run'] as int
    ..transferTo = json['transfer_to'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PaymentagentTransferRequestToJson(
        PaymentagentTransferRequest instance) =>
    <String, dynamic>{
      'paymentagent_transfer': instance.paymentagentTransfer,
      'description': instance.description,
      'amount': instance.amount,
      'currency': instance.currency,
      'dry_run': instance.dryRun,
      'transfer_to': instance.transferTo,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
