import 'package:meta/meta.dart';

import '../../helpers/helpers.dart';

/// Document upload response model class
abstract class DocumentUploadResponseModel {
  /// Initializes
  DocumentUploadResponseModel({
    @required this.documentUpload,
  });

  /// Details of the uploaded documents.
  final DocumentUpload documentUpload;
}

/// Document upload response class
class DocumentUploadResponse extends DocumentUploadResponseModel {
  /// Initializes
  DocumentUploadResponse({
    @required DocumentUpload documentUpload,
  }) : super(
          documentUpload: documentUpload,
        );

  /// Creates an instance from JSON
  factory DocumentUploadResponse.fromJson(
    dynamic documentUploadJson,
  ) =>
      DocumentUploadResponse(
        documentUpload: documentUploadJson == null
            ? null
            : DocumentUpload.fromJson(documentUploadJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (documentUpload != null) {
      resultMap['document_upload'] = documentUpload.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  DocumentUploadResponse copyWith({
    DocumentUpload documentUpload,
  }) =>
      DocumentUploadResponse(
        documentUpload: documentUpload ?? this.documentUpload,
      );
}
/// Document upload model class
abstract class DocumentUploadModel {
  /// Initializes
  DocumentUploadModel({
    @required this.uploadId,
    @required this.status,
    @required this.size,
    @required this.checksum,
    @required this.callType,
  });

  /// Current upload ID, add this to your binary payload metadata
  final double uploadId;

  /// Upload status (`success` or `failure`)
  final String status;

  /// File size
  final double size;

  /// Hex encoded SHA-1 checksum of the file
  final String checksum;

  /// Current call type, add this to your binary payload metadata
  final double callType;
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['call_type'] = callType;
    resultMap['checksum'] = checksum;
    resultMap['size'] = size;
    resultMap['status'] = status;
    resultMap['upload_id'] = uploadId;

    return resultMap;
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
