// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_symbols_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbolsRequest _$ActiveSymbolsRequestFromJson(Map<String, dynamic> json) {
  return ActiveSymbolsRequest()
    ..activeSymbols = json['active_symbols'] as String
    ..landingCompany = json['landing_company'] as String
    ..productType = json['product_type'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ActiveSymbolsRequestToJson(
        ActiveSymbolsRequest instance) =>
    <String, dynamic>{
      'active_symbols': instance.activeSymbols,
      'landing_company': instance.landingCompany,
      'product_type': instance.productType,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
