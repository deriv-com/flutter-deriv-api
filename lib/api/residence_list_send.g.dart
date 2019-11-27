// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidenceListRequest _$ResidenceListRequestFromJson(Map<String, dynamic> json) {
  return ResidenceListRequest()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int
    ..residenceList = json['residence_list'] as int;
}

Map<String, dynamic> _$ResidenceListRequestToJson(
        ResidenceListRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'residence_list': instance.residenceList,
    };
