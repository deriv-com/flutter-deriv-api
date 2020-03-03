// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return TransactionRequest(
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    subscribe: json['subscribe'] as int,
    transaction: json['transaction'] as int,
  );
}

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'subscribe': instance.subscribe,
      'transaction': instance.transaction,
    };
