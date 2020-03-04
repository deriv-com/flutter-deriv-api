// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioResponse _$PortfolioResponseFromJson(Map<String, dynamic> json) {
  return PortfolioResponse(
    portfolio: json['portfolio'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PortfolioResponseToJson(PortfolioResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'portfolio': instance.portfolio,
    };
