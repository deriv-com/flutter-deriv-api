// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_table_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfitTableRequest _$ProfitTableRequestFromJson(Map<String, dynamic> json) {
  return ProfitTableRequest()
    ..profitTable = json['profit_table'] as int
    ..description = json['description'] as int
    ..dateFrom = json['date_from'] as String
    ..dateTo = json['date_to'] as String
    ..limit = json['limit'] as num
    ..offset = json['offset'] as num
    ..sort = json['sort'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProfitTableRequestToJson(ProfitTableRequest instance) =>
    <String, dynamic>{
      'profit_table': instance.profitTable,
      'description': instance.description,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'limit': instance.limit,
      'offset': instance.offset,
      'sort': instance.sort,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
