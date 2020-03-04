// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts_for_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsForRequest _$ContractsForRequestFromJson(Map<String, dynamic> json) {
  return ContractsForRequest(
    contractsFor: json['contracts_for'] as String,
    currency: json['currency'] as String,
    landingCompany: json['landing_company'] as String,
    productType: json['product_type'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ContractsForRequestToJson(
        ContractsForRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'contracts_for': instance.contractsFor,
      'currency': instance.currency,
      'landing_company': instance.landingCompany,
      'product_type': instance.productType,
    };
