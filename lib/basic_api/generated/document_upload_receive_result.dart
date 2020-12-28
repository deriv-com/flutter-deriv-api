/// Document upload receive model class
abstract class DocumentUploadReceiveModel {
  /// Initializes
  DocumentUploadReceiveModel({
    @required this.documentUpload,
  });

  /// Details of the uploaded documents.
  final DocumentUpload documentUpload;
}

/// Document upload receive class
class DocumentUploadReceive extends DocumentUploadReceiveModel {
  /// Initializes
  DocumentUploadReceive({
    @required DocumentUpload documentUpload,
  }) : super(
          documentUpload: documentUpload,
        );

  /// Creates an instance from JSON
  factory DocumentUploadReceive.fromJson(Map<String, dynamic> json) =>
      DocumentUploadReceive(
        documentUpload: json['document_upload'] == null
            ? null
            : DocumentUpload.fromJson(json['document_upload']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (documentUpload != null) {
      result['document_upload'] = documentUpload.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  DocumentUploadReceive copyWith({
    DocumentUpload documentUpload,
  }) =>
      DocumentUploadReceive(
        documentUpload: documentUpload ?? this.documentUpload,
      );
}
/// Document upload model class
abstract class DocumentUploadModel {
  /// Initializes
  DocumentUploadModel({
    @required this.callType,
    @required this.checksum,
    @required this.size,
    @required this.status,
    @required this.uploadId,
  });

  /// Current call type, add this to your binary payload metadata
  final double callType;

  /// Hex encoded SHA-1 checksum of the file
  final String checksum;

  /// File size
  final double size;

  /// Upload status (`success` or `failure`)
  final String status;

  /// Current upload ID, add this to your binary payload metadata
  final double uploadId;
}

/// Document upload class
class DocumentUpload extends DocumentUploadModel {
  /// Initializes
  DocumentUpload({
    @required double callType,
    @required String checksum,
    @required double size,
    @required String status,
    @required double uploadId,
  }) : super(
          callType: callType,
          checksum: checksum,
          size: size,
          status: status,
          uploadId: uploadId,
        );

  /// Creates an instance from JSON
  factory DocumentUpload.fromJson(Map<String, dynamic> json) => DocumentUpload(
        callType: getDouble(json['call_type']),
        checksum: json['checksum'],
        size: getDouble(json['size']),
        status: json['status'],
        uploadId: getDouble(json['upload_id']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['call_type'] = callType;
    result['checksum'] = checksum;
    result['size'] = size;
    result['status'] = status;
    result['upload_id'] = uploadId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  DocumentUpload copyWith({
    double callType,
    String checksum,
    double size,
    String status,
    double uploadId,
  }) =>
      DocumentUpload(
        callType: callType ?? this.callType,
        checksum: checksum ?? this.checksum,
        size: size ?? this.size,
        status: status ?? this.status,
        uploadId: uploadId ?? this.uploadId,
      );
}
