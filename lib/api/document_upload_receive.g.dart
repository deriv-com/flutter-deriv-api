// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_upload_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentUploadResponse _$DocumentUploadResponseFromJson(
    Map<String, dynamic> json) {
  return DocumentUploadResponse(
    documentUpload: json['document_upload'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$DocumentUploadResponseToJson(
        DocumentUploadResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'document_upload': instance.documentUpload,
    };
