// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeRequest _$AuthorizeRequestFromJson(Map<String, dynamic> json) {
  return AuthorizeRequest()
    ..authorize = json['authorize'] as String
    ..addToLoginHistory = json['add_to_login_history'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$AuthorizeRequestToJson(AuthorizeRequest instance) =>
    <String, dynamic>{
      'authorize': instance.authorize,
      'add_to_login_history': instance.addToLoginHistory,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
