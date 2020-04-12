// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioRequest _$PortfolioRequestFromJson(Map<String, dynamic> json) {
  return PortfolioRequest(
    portfolio: json['portfolio'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PortfolioRequestToJson(PortfolioRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'portfolio': instance.portfolio,
    };
