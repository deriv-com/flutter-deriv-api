// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_upload_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentUploadResponse _$DocumentUploadResponseFromJson(
    Map<String, dynamic> json) {
  return DocumentUploadResponse(
    documentUpload: json['document_upload'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$DocumentUploadResponseToJson(
        DocumentUploadResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'document_upload': instance.documentUpload,
    };
