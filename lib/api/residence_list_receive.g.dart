// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidenceListResponse _$ResidenceListResponseFromJson(
    Map<String, dynamic> json) {
  return ResidenceListResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    residenceList: (json['residence_list'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ResidenceListResponseToJson(
        ResidenceListResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'residence_list': instance.residenceList,
    };
