// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts_for_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsForRequest _$ContractsForRequestFromJson(Map<String, dynamic> json) {
  return ContractsForRequest()
    ..contractsFor = json['contracts_for'] as String
    ..currency = json['currency'] as String
    ..landingCompany = json['landing_company'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..productType = json['product_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ContractsForRequestToJson(
        ContractsForRequest instance) =>
    <String, dynamic>{
      'contracts_for': instance.contractsFor,
      'currency': instance.currency,
      'landing_company': instance.landingCompany,
      'passthrough': instance.passthrough,
      'product_type': instance.productType,
      'req_id': instance.reqId,
    };
