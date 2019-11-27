// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_upload_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentUploadResponse _$DocumentUploadResponseFromJson(
    Map<String, dynamic> json) {
  return DocumentUploadResponse()
    ..documentUpload = json['document_upload'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$DocumentUploadResponseToJson(
        DocumentUploadResponse instance) =>
    <String, dynamic>{
      'document_upload': instance.documentUpload,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
