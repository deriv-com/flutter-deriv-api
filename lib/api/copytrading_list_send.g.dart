// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copytrading_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopytradingListRequest _$CopytradingListRequestFromJson(
    Map<String, dynamic> json) {
  return CopytradingListRequest(
    copytradingList: json['copytrading_list'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CopytradingListRequestToJson(
        CopytradingListRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'copytrading_list': instance.copytradingList,
    };
