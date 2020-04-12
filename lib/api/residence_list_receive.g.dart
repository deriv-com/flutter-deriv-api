// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidenceListResponse _$ResidenceListResponseFromJson(
    Map<String, dynamic> json) {
  return ResidenceListResponse(
    residenceList: (json['residence_list'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ResidenceListResponseToJson(
        ResidenceListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'residence_list': instance.residenceList,
    };
