// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_withdraw_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentWithdrawResponse _$PaymentagentWithdrawResponseFromJson(
    Map<String, dynamic> json) {
  return PaymentagentWithdrawResponse(
    paymentagentName: json['paymentagent_name'] as String,
    paymentagentWithdraw: json['paymentagent_withdraw'] as int,
    transactionId: json['transaction_id'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PaymentagentWithdrawResponseToJson(
        PaymentagentWithdrawResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'paymentagent_name': instance.paymentagentName,
      'paymentagent_withdraw': instance.paymentagentWithdraw,
      'transaction_id': instance.transactionId,
    };
