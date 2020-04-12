/// generated automatically from flutter_deriv_api|lib/api/document_upload_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'document_upload_receive.g.dart';

/// JSON conversion for 'document_upload_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class DocumentUploadResponse extends Response {
  /// Initialize DocumentUploadResponse
  const DocumentUploadResponse({
    this.documentUpload,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory DocumentUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$DocumentUploadResponseFromJson(json);

  // Properties
  /// Details of the uploaded documents.
  final Map<String, dynamic> documentUpload;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$DocumentUploadResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  DocumentUploadResponse copyWith({
    Map<String, dynamic> documentUpload,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      DocumentUploadResponse(
        documentUpload: documentUpload ?? this.documentUpload,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
