// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidenceListRequest _$ResidenceListRequestFromJson(Map<String, dynamic> json) {
  return ResidenceListRequest(
    residenceList: json['residence_list'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ResidenceListRequestToJson(
        ResidenceListRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'residence_list': instance.residenceList,
    };
