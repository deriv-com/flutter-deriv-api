// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementRequest _$StatementRequestFromJson(Map<String, dynamic> json) {
  return StatementRequest(
    actionType: json['action_type'] as String,
    dateFrom: json['date_from'] as int,
    dateTo: json['date_to'] as int,
    description: json['description'] as int,
    limit: json['limit'] as num,
    offset: json['offset'] as num,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    statement: json['statement'] as int,
  );
}

Map<String, dynamic> _$StatementRequestToJson(StatementRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'action_type': instance.actionType,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'description': instance.description,
      'limit': instance.limit,
      'offset': instance.offset,
      'statement': instance.statement,
    };
