/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/document_upload_send.json
// ignore_for_file: avoid_as
import 'package:meta/meta.dart';
import '../request.dart';

/// Document upload request class
class DocumentUploadRequest extends Request {
  /// Initialize DocumentUploadRequest
  const DocumentUploadRequest({
    @required this.documentFormat,
    this.documentId,
    @required this.documentType,
    this.documentUpload = true,
    @required this.expectedChecksum,
    this.expirationDate,
    @required this.fileSize,
    this.lifetimeValid,
    this.pageType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'document_upload',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory DocumentUploadRequest.fromJson(Map<String, dynamic> json) =>
      DocumentUploadRequest(
        documentFormat: json['document_format'] as String?,
        documentId: json['document_id'] as String?,
        documentType: json['document_type'] as String?,
        documentUpload: json['document_upload'] == null
            ? null
            : json['document_upload'] == 1,
        expectedChecksum: json['expected_checksum'] as String?,
        expirationDate: json['expiration_date'] as String?,
        fileSize: json['file_size'] as int?,
        lifetimeValid:
            json['lifetime_valid'] == null ? null : json['lifetime_valid'] == 1,
        pageType: json['page_type'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Document file format
  final String? documentFormat;

  /// [Optional] Document ID (required for Passport, Proof of ID and Driver's License)
  final String? documentId;

  /// Document type
  final String? documentType;

  /// Must be `true`
  final bool? documentUpload;

  /// The checksum of the file to be uploaded
  final String? expectedChecksum;

  /// [Optional] Document expiration date (required for Passport, Proof of ID and Driver's License)
  final String? expirationDate;

  /// Document size (should be less than 10MB)
  final int? fileSize;

  /// [Optional] Boolean value that indicates whether this document is lifetime valid (only applies to POI document types, cancels out the expiration_date given if any)
  final bool? lifetimeValid;

  /// [Optional] To determine document side
  final String? pageType;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'document_format': documentFormat,
        'document_id': documentId,
        'document_type': documentType,
        'document_upload': documentUpload == null
            ? null
            : documentUpload!
                ? 1
                : 0,
        'expected_checksum': expectedChecksum,
        'expiration_date': expirationDate,
        'file_size': fileSize,
        'lifetime_valid': lifetimeValid == null
            ? null
            : lifetimeValid!
                ? 1
                : 0,
        'page_type': pageType,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  DocumentUploadRequest copyWith({
    String? documentFormat,
    String? documentId,
    String? documentType,
    bool? documentUpload,
    String? expectedChecksum,
    String? expirationDate,
    int? fileSize,
    bool? lifetimeValid,
    String? pageType,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      DocumentUploadRequest(
        documentFormat: documentFormat ?? this.documentFormat,
        documentId: documentId ?? this.documentId,
        documentType: documentType ?? this.documentType,
        documentUpload: documentUpload ?? this.documentUpload,
        expectedChecksum: expectedChecksum ?? this.expectedChecksum,
        expirationDate: expirationDate ?? this.expirationDate,
        fileSize: fileSize ?? this.fileSize,
        lifetimeValid: lifetimeValid ?? this.lifetimeValid,
        pageType: pageType ?? this.pageType,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
