// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_transfer_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentTransferResponse _$PaymentagentTransferResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentagentTransferResponse()
    ..paymentagentTransfer = json['paymentagent_transfer'] as int
    ..clientToFullName = json['client_to_full_name'] as String
    ..clientToLoginid = json['client_to_loginid'] as String
    ..transactionId = json['transaction_id'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PaymentagentTransferResponseToJson(
        PaymentagentTransferResponse instance) =>
    <String, dynamic>{
      'paymentagent_transfer': instance.paymentagentTransfer,
      'client_to_full_name': instance.clientToFullName,
      'client_to_loginid': instance.clientToLoginid,
      'transaction_id': instance.transactionId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
