// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_markup_details_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppMarkupDetailsRequest _$AppMarkupDetailsRequestFromJson(
    Map<String, dynamic> json) {
  return AppMarkupDetailsRequest()
    ..appMarkupDetails = json['app_markup_details'] as int
    ..description = json['description'] as int
    ..appId = json['app_id'] as int
    ..clientLoginid = json['client_loginid'] as String
    ..dateFrom = json['date_from'] as String
    ..dateTo = json['date_to'] as String
    ..limit = json['limit'] as num
    ..offset = json['offset'] as num
    ..sort = json['sort'] as String
    ..sortFields =
        (json['sort_fields'] as List).map((e) => e as String).toList()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$AppMarkupDetailsRequestToJson(
        AppMarkupDetailsRequest instance) =>
    <String, dynamic>{
      'app_markup_details': instance.appMarkupDetails,
      'description': instance.description,
      'app_id': instance.appId,
      'client_loginid': instance.clientLoginid,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'limit': instance.limit,
      'offset': instance.offset,
      'sort': instance.sort,
      'sort_fields': instance.sortFields,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
