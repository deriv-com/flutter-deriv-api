// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_upload_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentUploadRequest _$DocumentUploadRequestFromJson(
    Map<String, dynamic> json) {
  return DocumentUploadRequest()
    ..documentFormat = json['document_format'] as String
    ..documentId = json['document_id'] as String
    ..documentType = json['document_type'] as String
    ..documentUpload = json['document_upload'] as int
    ..expectedChecksum = json['expected_checksum'] as String
    ..expirationDate = json['expiration_date'] as String
    ..fileSize = json['file_size'] as int
    ..pageType = json['page_type'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$DocumentUploadRequestToJson(
        DocumentUploadRequest instance) =>
    <String, dynamic>{
      'document_format': instance.documentFormat,
      'document_id': instance.documentId,
      'document_type': instance.documentType,
      'document_upload': instance.documentUpload,
      'expected_checksum': instance.expectedChecksum,
      'expiration_date': instance.expirationDate,
      'file_size': instance.fileSize,
      'page_type': instance.pageType,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
