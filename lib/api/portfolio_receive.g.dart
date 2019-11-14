// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioResponse _$PortfolioResponseFromJson(Map<String, dynamic> json) {
  return PortfolioResponse()
    ..portfolio = json['portfolio'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PortfolioResponseToJson(PortfolioResponse instance) =>
    <String, dynamic>{
      'portfolio': instance.portfolio,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
