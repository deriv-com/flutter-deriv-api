/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/document_upload_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Document upload request class.
class DocumentUploadRequest extends Request {
  /// Initialize DocumentUploadRequest.
  const DocumentUploadRequest({
    required this.documentFormat,
    this.documentId,
    required this.documentIssuingCountry,
    required this.documentType,
    this.documentUpload = true,
    required this.expectedChecksum,
    this.expirationDate,
    required this.fileSize,
    this.lifetimeValid,
    this.loginid,
    this.pageType,
    this.proofOfOwnership,
    super.msgType = 'document_upload',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory DocumentUploadRequest.fromJson(Map<String, dynamic> json) =>
      DocumentUploadRequest(
        documentFormat: json['document_format'] as String?,
        documentId: json['document_id'] as String?,
        documentIssuingCountry: json['document_issuing_country'] as String?,
        documentType: json['document_type'] as String?,
        documentUpload: json['document_upload'] == null
            ? null
            : json['document_upload'] == 1,
        expectedChecksum: json['expected_checksum'] as String?,
        expirationDate: json['expiration_date'] as String?,
        fileSize: json['file_size'] as int?,
        lifetimeValid:
            json['lifetime_valid'] == null ? null : json['lifetime_valid'] == 1,
        loginid: json['loginid'] as String?,
        pageType: json['page_type'] as String?,
        proofOfOwnership: json['proof_of_ownership'] as Map<String, dynamic>?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Document file format
  final String? documentFormat;

  /// [Optional] Document ID (required for Passport, Proof of ID and Driver's License)
  final String? documentId;

  /// 2-letter country code, mandatory for POI only
  final String? documentIssuingCountry;

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

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] To determine document side
  final String? pageType;

  /// [Optional] It contains info about the proof of ownership being uploaded (mandatory for proof_of_ownership document type)
  final Map<String, dynamic>? proofOfOwnership;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'document_format': documentFormat,
        'document_id': documentId,
        'document_issuing_country': documentIssuingCountry,
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
        'loginid': loginid,
        'page_type': pageType,
        'proof_of_ownership': proofOfOwnership,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  DocumentUploadRequest copyWith({
    String? documentFormat,
    String? documentId,
    String? documentIssuingCountry,
    String? documentType,
    bool? documentUpload,
    String? expectedChecksum,
    String? expirationDate,
    int? fileSize,
    bool? lifetimeValid,
    String? loginid,
    String? pageType,
    Map<String, dynamic>? proofOfOwnership,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      DocumentUploadRequest(
        documentFormat: documentFormat ?? this.documentFormat,
        documentId: documentId ?? this.documentId,
        documentIssuingCountry:
            documentIssuingCountry ?? this.documentIssuingCountry,
        documentType: documentType ?? this.documentType,
        documentUpload: documentUpload ?? this.documentUpload,
        expectedChecksum: expectedChecksum ?? this.expectedChecksum,
        expirationDate: expirationDate ?? this.expirationDate,
        fileSize: fileSize ?? this.fileSize,
        lifetimeValid: lifetimeValid ?? this.lifetimeValid,
        loginid: loginid ?? this.loginid,
        pageType: pageType ?? this.pageType,
        proofOfOwnership: proofOfOwnership ?? this.proofOfOwnership,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
