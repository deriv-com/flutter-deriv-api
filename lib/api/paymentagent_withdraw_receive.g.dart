// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_withdraw_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentWithdrawResponse _$PaymentagentWithdrawResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentagentWithdrawResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    paymentagentName: json['paymentagent_name'] as String,
    paymentagentWithdraw: json['paymentagent_withdraw'] as int,
    reqId: json['req_id'] as int,
    transactionId: json['transaction_id'] as int,
  );
}

Map<String, dynamic> _$PaymentagentWithdrawResponseToJson(
        PaymentagentWithdrawResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'paymentagent_name': instance.paymentagentName,
      'paymentagent_withdraw': instance.paymentagentWithdraw,
      'req_id': instance.reqId,
      'transaction_id': instance.transactionId,
    };
