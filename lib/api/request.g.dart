// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) {
  return Request(
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
    };
