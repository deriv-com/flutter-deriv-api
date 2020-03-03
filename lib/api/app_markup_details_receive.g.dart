// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_markup_details_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppMarkupDetailsResponse _$AppMarkupDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return AppMarkupDetailsResponse(
    appMarkupDetails: json['app_markup_details'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$AppMarkupDetailsResponseToJson(
        AppMarkupDetailsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'app_markup_details': instance.appMarkupDetails,
    };
