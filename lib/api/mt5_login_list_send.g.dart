// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_login_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5LoginListRequest _$Mt5LoginListRequestFromJson(Map<String, dynamic> json) {
  return Mt5LoginListRequest(
    mt5LoginList: json['mt5_login_list'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$Mt5LoginListRequestToJson(
        Mt5LoginListRequest instance) =>
    <String, dynamic>{
      'mt5_login_list': instance.mt5LoginList,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
