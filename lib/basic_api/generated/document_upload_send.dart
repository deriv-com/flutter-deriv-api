/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/document_upload_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// DocumentUploadRequest class
class DocumentUploadRequest extends Request {
  /// Initialize DocumentUploadRequest
  const DocumentUploadRequest({
    @required this.documentFormat,
    this.documentId,
    @required this.documentType,
    this.documentUpload = 1,
    @required this.expectedChecksum,
    this.expirationDate,
    @required this.fileSize,
    this.pageType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'document_upload',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory DocumentUploadRequest.fromJson(Map<String, dynamic> json) =>
      DocumentUploadRequest(
        // ignore: avoid_as
        documentFormat: json['document_format'] as String,
        // ignore: avoid_as
        documentId: json['document_id'] as String,
        // ignore: avoid_as
        documentType: json['document_type'] as String,
        // ignore: avoid_as
        documentUpload: json['document_upload'] as int,
        // ignore: avoid_as
        expectedChecksum: json['expected_checksum'] as String,
        // ignore: avoid_as
        expirationDate: json['expiration_date'] as String,
        // ignore: avoid_as
        fileSize: json['file_size'] as int,
        // ignore: avoid_as
        pageType: json['page_type'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Document file format
  final String documentFormat;

  /// [Optional] Document ID (required for Passport, Proof of ID and Driver's License)
  final String documentId;

  /// Document type
  final String documentType;

  /// Must be `1`
  final int documentUpload;

  /// The checksum of the file to be uploaded
  final String expectedChecksum;

  /// [Optional] Document expiration date (required for Passport, Proof of ID and Driver's License)
  final String expirationDate;

  /// Document size (should be less than 3MB)
  final int fileSize;

  /// [Optional] To determine document side
  final String pageType;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'document_format': documentFormat,
        'document_id': documentId,
        'document_type': documentType,
        'document_upload': documentUpload,
        'expected_checksum': expectedChecksum,
        'expiration_date': expirationDate,
        'file_size': fileSize,
        'page_type': pageType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  DocumentUploadRequest copyWith({
    String documentFormat,
    String documentId,
    String documentType,
    int documentUpload,
    String expectedChecksum,
    String expirationDate,
    int fileSize,
    String pageType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      DocumentUploadRequest(
        documentFormat: documentFormat ?? this.documentFormat,
        documentId: documentId ?? this.documentId,
        documentType: documentType ?? this.documentType,
        documentUpload: documentUpload ?? this.documentUpload,
        expectedChecksum: expectedChecksum ?? this.expectedChecksum,
        expirationDate: expirationDate ?? this.expirationDate,
        fileSize: fileSize ?? this.fileSize,
        pageType: pageType ?? this.pageType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
