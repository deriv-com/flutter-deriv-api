// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return TransactionRequest(
    subscribe: json['subscribe'] as int,
    transaction: json['transaction'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'subscribe': instance.subscribe,
      'transaction': instance.transaction,
    };
