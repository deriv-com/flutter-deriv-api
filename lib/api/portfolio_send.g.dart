// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioRequest _$PortfolioRequestFromJson(Map<String, dynamic> json) {
  return PortfolioRequest(
    portfolio: json['portfolio'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$PortfolioRequestToJson(PortfolioRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'portfolio': instance.portfolio,
    };
