/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/identity_verification_document_add_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Identity verification document add receive class.
class IdentityVerificationDocumentAddReceive extends Response {
  /// Initialize IdentityVerificationDocumentAddReceive.
  const IdentityVerificationDocumentAddReceive({
    this.identityVerificationDocumentAdd,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory IdentityVerificationDocumentAddReceive.fromJson(
          Map<String, dynamic> json) =>
      IdentityVerificationDocumentAddReceive(
        identityVerificationDocumentAdd:
            json['identity_verification_document_add'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// 1 on success
  final int? identityVerificationDocumentAdd;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'identity_verification_document_add': identityVerificationDocumentAdd,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  IdentityVerificationDocumentAddReceive copyWith({
    int? identityVerificationDocumentAdd,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      IdentityVerificationDocumentAddReceive(
        identityVerificationDocumentAdd: identityVerificationDocumentAdd ??
            this.identityVerificationDocumentAdd,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
