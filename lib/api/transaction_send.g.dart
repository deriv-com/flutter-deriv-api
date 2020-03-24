// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return TransactionRequest(
    subscribe: json['subscribe'] as int,
    transaction: json['transaction'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'subscribe': instance.subscribe,
      'transaction': instance.transaction,
    };
