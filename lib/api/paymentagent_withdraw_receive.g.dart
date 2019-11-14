// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_withdraw_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentWithdrawResponse _$PaymentagentWithdrawResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentagentWithdrawResponse()
    ..paymentagentWithdraw = json['paymentagent_withdraw'] as int
    ..paymentagentName = json['paymentagent_name'] as String
    ..transactionId = json['transaction_id'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PaymentagentWithdrawResponseToJson(
        PaymentagentWithdrawResponse instance) =>
    <String, dynamic>{
      'paymentagent_withdraw': instance.paymentagentWithdraw,
      'paymentagent_name': instance.paymentagentName,
      'transaction_id': instance.transactionId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
