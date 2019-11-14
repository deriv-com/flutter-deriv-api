// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidenceListResponse _$ResidenceListResponseFromJson(
    Map<String, dynamic> json) {
  return ResidenceListResponse()
    ..residenceList =
        (json['residence_list'] as List).map((e) => e as String).toList()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ResidenceListResponseToJson(
        ResidenceListResponse instance) =>
    <String, dynamic>{
      'residence_list': instance.residenceList,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
