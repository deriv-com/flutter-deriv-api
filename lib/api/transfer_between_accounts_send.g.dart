// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_between_accounts_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferBetweenAccountsRequest _$TransferBetweenAccountsRequestFromJson(
    Map<String, dynamic> json) {
  return TransferBetweenAccountsRequest(
    accountFrom: json['account_from'] as String,
    accountTo: json['account_to'] as String,
    accounts: json['accounts'] as String,
    amount: json['amount'] as num,
    currency: json['currency'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    transferBetweenAccounts: json['transfer_between_accounts'] as int,
  );
}

Map<String, dynamic> _$TransferBetweenAccountsRequestToJson(
        TransferBetweenAccountsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'account_from': instance.accountFrom,
      'account_to': instance.accountTo,
      'accounts': instance.accounts,
      'amount': instance.amount,
      'currency': instance.currency,
      'transfer_between_accounts': instance.transferBetweenAccounts,
    };
