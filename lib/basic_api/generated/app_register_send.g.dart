// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_register_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppRegisterRequest _$AppRegisterRequestFromJson(Map<String, dynamic> json) {
  return AppRegisterRequest(
    appMarkupPercentage: json['app_markup_percentage'] as num,
    appRegister: json['app_register'] as int,
    appstore: json['appstore'] as String,
    github: json['github'] as String,
    googleplay: json['googleplay'] as String,
    homepage: json['homepage'] as String,
    name: json['name'] as String,
    redirectUri: json['redirect_uri'] as String,
    scopes: (json['scopes'] as List)?.map((e) => e as String)?.toList(),
    verificationUri: json['verification_uri'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AppRegisterRequestToJson(AppRegisterRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'app_markup_percentage': instance.appMarkupPercentage,
      'app_register': instance.appRegister,
      'appstore': instance.appstore,
      'github': instance.github,
      'googleplay': instance.googleplay,
      'homepage': instance.homepage,
      'name': instance.name,
      'redirect_uri': instance.redirectUri,
      'scopes': instance.scopes,
      'verification_uri': instance.verificationUri,
    };
