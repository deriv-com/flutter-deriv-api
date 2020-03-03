// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeRequest _$AuthorizeRequestFromJson(Map<String, dynamic> json) {
  return AuthorizeRequest(
    addToLoginHistory: json['add_to_login_history'] as int,
    authorize: json['authorize'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AuthorizeRequestToJson(AuthorizeRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'add_to_login_history': instance.addToLoginHistory,
      'authorize': instance.authorize,
    };
