/// generated automatically from flutter_deriv_api|lib/api/document_upload_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'document_upload_send.g.dart';

/// JSON conversion for 'document_upload_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class DocumentUploadRequest extends Request {
  /// Initialize DocumentUploadRequest
  DocumentUploadRequest({
    this.documentFormat,
    this.documentId,
    this.documentType,
    this.documentUpload = 1,
    this.expectedChecksum,
    this.expirationDate,
    this.fileSize,
    this.pageType,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory DocumentUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$DocumentUploadRequestFromJson(json);

  // Properties
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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$DocumentUploadRequestToJson(this);
}
