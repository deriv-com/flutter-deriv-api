// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_table_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitTableRequest _$ProfitTableRequestFromJson(Map<String, dynamic> json) {
  return ProfitTableRequest()
    ..dateFrom = json['date_from'] as String
    ..dateTo = json['date_to'] as String
    ..description = json['description'] as int
    ..limit = json['limit'] as num
    ..offset = json['offset'] as num
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..profitTable = json['profit_table'] as int
    ..reqId = json['req_id'] as int
    ..sort = json['sort'] as String;
}

Map<String, dynamic> _$ProfitTableRequestToJson(ProfitTableRequest instance) =>
    <String, dynamic>{
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'description': instance.description,
      'limit': instance.limit,
      'offset': instance.offset,
      'passthrough': instance.passthrough,
      'profit_table': instance.profitTable,
      'req_id': instance.reqId,
      'sort': instance.sort,
    };
