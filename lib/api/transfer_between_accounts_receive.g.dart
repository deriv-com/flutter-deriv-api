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
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TransferBetweenAccountsResponseToJson(
        TransferBetweenAccountsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'accounts': instance.accounts,
      'client_to_full_name': instance.clientToFullName,
      'client_to_loginid': instance.clientToLoginid,
      'transaction_id': instance.transactionId,
      'transfer_between_accounts': instance.transferBetweenAccounts,
    };
