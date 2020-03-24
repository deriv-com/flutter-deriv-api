// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_between_accounts_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferBetweenAccountsResponse _$TransferBetweenAccountsResponseFromJson(
    Map<String, dynamic> json) {
  return TransferBetweenAccountsResponse(
    accounts: (json['accounts'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    clientToFullName: json['client_to_full_name'] as String,
    clientToLoginid: json['client_to_loginid'] as String,
    transactionId: json['transaction_id'] as int,
    transferBetweenAccounts: json['transfer_between_accounts'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$TransferBetweenAccountsResponseToJson(
        TransferBetweenAccountsResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'accounts': instance.accounts,
      'client_to_full_name': instance.clientToFullName,
      'client_to_loginid': instance.clientToLoginid,
      'transaction_id': instance.transactionId,
      'transfer_between_accounts': instance.transferBetweenAccounts,
    };
