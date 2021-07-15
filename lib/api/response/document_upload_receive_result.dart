import '../../helpers/helpers.dart';

/// Document upload response model class.
abstract class DocumentUploadResponseModel {
  /// Initializes Document upload response model class .
  DocumentUploadResponseModel({
    this.documentUpload,
  });

  /// Details of the uploaded documents.
  final DocumentUpload? documentUpload;
}

/// Document upload response class.
class DocumentUploadResponse extends DocumentUploadResponseModel {
  /// Initializes Document upload response class.
  DocumentUploadResponse({
    DocumentUpload? documentUpload,
  }) : super(
          documentUpload: documentUpload,
        );

  /// Creates an instance from JSON.
  factory DocumentUploadResponse.fromJson(
    dynamic documentUploadJson,
  ) =>
      DocumentUploadResponse(
        documentUpload: documentUploadJson == null
            ? null
            : DocumentUpload.fromJson(documentUploadJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (documentUpload != null) {
      resultMap['document_upload'] = documentUpload!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DocumentUploadResponse copyWith({
    DocumentUpload? documentUpload,
  }) =>
      DocumentUploadResponse(
        documentUpload: documentUpload ?? this.documentUpload,
      );
}
/// Document upload model class.
abstract class DocumentUploadModel {
  /// Initializes Document upload model class .
  DocumentUploadModel({
    required this.uploadId,
    required this.callType,
    this.checksum,
    this.size,
    this.status,
  });

  /// Current upload ID, add this to your binary payload metadata
  final double uploadId;

  /// Current call type, add this to your binary payload metadata
  final double callType;

  /// Hex encoded SHA-1 checksum of the file
  final String? checksum;

  /// File size
  final double? size;

  /// Upload status (`success` or `failure`)
  final String? status;
}

/// Document upload class.
class DocumentUpload extends DocumentUploadModel {
  /// Initializes Document upload class.
  DocumentUpload({
    required double callType,
    required double uploadId,
    String? checksum,
    double? size,
    String? status,
  }) : super(
          callType: callType,
          uploadId: uploadId,
          checksum: checksum,
          size: size,
          status: status,
        );

  /// Creates an instance from JSON.
  factory DocumentUpload.fromJson(Map<String, dynamic> json) => DocumentUpload(
        callType: getDouble(json['call_type'])!,
        uploadId: getDouble(json['upload_id'])!,
        checksum: json['checksum'],
        size: getDouble(json['size']),
        status: json['status'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['call_type'] = callType;
    resultMap['upload_id'] = uploadId;
    resultMap['checksum'] = checksum;
    resultMap['size'] = size;
    resultMap['status'] = status;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DocumentUpload copyWith({
    required double callType,
    required double uploadId,
    String? checksum,
    double? size,
    String? status,
  }) =>
      DocumentUpload(
        callType: callType,
        uploadId: uploadId,
        checksum: checksum ?? this.checksum,
        size: size ?? this.size,
        status: status ?? this.status,
      );
}
