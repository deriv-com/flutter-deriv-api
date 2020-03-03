// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_update_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractUpdateRequest _$ContractUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return ContractUpdateRequest(
    contractId: json['contract_id'] as int,
    contractUpdate: json['contract_update'] as int,
    limitOrder: json['limit_order'] as Map<String, dynamic>,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ContractUpdateRequestToJson(
        ContractUpdateRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'contract_id': instance.contractId,
      'contract_update': instance.contractUpdate,
      'limit_order': instance.limitOrder,
    };
