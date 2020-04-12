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
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$DocumentUploadResponseToJson(
        DocumentUploadResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'document_upload': instance.documentUpload,
    };
