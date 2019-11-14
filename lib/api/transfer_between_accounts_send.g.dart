// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_between_accounts_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferBetweenAccountsRequest _$TransferBetweenAccountsRequestFromJson(
    Map<String, dynamic> json) {
  return TransferBetweenAccountsRequest()
    ..transferBetweenAccounts = json['transfer_between_accounts'] as int
    ..accountFrom = json['account_from'] as String
    ..accountTo = json['account_to'] as String
    ..accounts = json['accounts'] as String
    ..amount = json['amount'] as num
    ..currency = json['currency'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TransferBetweenAccountsRequestToJson(
        TransferBetweenAccountsRequest instance) =>
    <String, dynamic>{
      'transfer_between_accounts': instance.transferBetweenAccounts,
      'account_from': instance.accountFrom,
      'account_to': instance.accountTo,
      'accounts': instance.accounts,
      'amount': instance.amount,
      'currency': instance.currency,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
