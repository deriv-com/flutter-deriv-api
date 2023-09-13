/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/document_upload_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Document upload receive class.
class DocumentUploadReceive extends Response {
  /// Initialize DocumentUploadReceive.
  const DocumentUploadReceive({
    this.documentUpload,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory DocumentUploadReceive.fromJson(Map<String, dynamic> json) =>
      DocumentUploadReceive(
        documentUpload: json['document_upload'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Details of the uploaded documents.
  final Map<String, dynamic>? documentUpload;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'document_upload': documentUpload,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  DocumentUploadReceive copyWith({
    Map<String, dynamic>? documentUpload,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      DocumentUploadReceive(
        documentUpload: documentUpload ?? this.documentUpload,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
