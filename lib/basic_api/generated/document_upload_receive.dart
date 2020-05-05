/// generated automatically from flutter_deriv_api|lib/basic_api/generated/document_upload_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'document_upload_receive.g.dart';

/// JSON conversion for 'document_upload_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class DocumentUploadResponse extends Response {
  /// Initialize DocumentUploadResponse
  const DocumentUploadResponse({
    this.documentUpload,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from json
  factory DocumentUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$DocumentUploadResponseFromJson(json);

  // Properties
  /// Details of the uploaded documents.
  final Map<String, dynamic> documentUpload;

  /// Converts an instance to json
  @override
  Map<String, dynamic> toJson() => _$DocumentUploadResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  DocumentUploadResponse copyWith({
    Map<String, dynamic> documentUpload,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      DocumentUploadResponse(
        documentUpload: documentUpload ?? this.documentUpload,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
