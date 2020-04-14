// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_update_history_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractUpdateHistoryRequest _$ContractUpdateHistoryRequestFromJson(
    Map<String, dynamic> json) {
  return ContractUpdateHistoryRequest(
    contractId: json['contract_id'] as int,
    contractUpdateHistory: json['contract_update_history'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ContractUpdateHistoryRequestToJson(
        ContractUpdateHistoryRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'contract_id': instance.contractId,
      'contract_update_history': instance.contractUpdateHistory,
    };
