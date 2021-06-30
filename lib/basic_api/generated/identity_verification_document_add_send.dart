/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/identity_verification_document_add_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Identity verification document add request class.
class IdentityVerificationDocumentAddRequest extends Request {
  /// Initialize IdentityVerificationDocumentAddRequest.
  const IdentityVerificationDocumentAddRequest({
    required this.documentNumber,
    required this.documentType,
    this.identityVerificationDocumentAdd = true,
    required this.issuingCountry,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'identity_verification_document_add',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory IdentityVerificationDocumentAddRequest.fromJson(
          Map<String, dynamic> json) =>
      IdentityVerificationDocumentAddRequest(
        documentNumber: json['document_number'] as String?,
        documentType: json['document_type'] as String?,
        identityVerificationDocumentAdd:
            json['identity_verification_document_add'] == null
                ? null
                : json['identity_verification_document_add'] == 1,
        issuingCountry: json['issuing_country'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The unique identification number on the provided document.
  final String? documentNumber;

  /// Type of the document provided by the user, e.g. national_id, passport, etc (obtained from `residence_list` call).
  final String? documentType;

  /// Must be `true`
  final bool? identityVerificationDocumentAdd;

  /// 2-letter country code (obtained from `residence_list` call).
  final String? issuingCountry;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'document_number': documentNumber,
        'document_type': documentType,
        'identity_verification_document_add':
            identityVerificationDocumentAdd == null
                ? null
                : identityVerificationDocumentAdd!
                    ? 1
                    : 0,
        'issuing_country': issuingCountry,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  IdentityVerificationDocumentAddRequest copyWith({
    String? documentNumber,
    String? documentType,
    bool? identityVerificationDocumentAdd,
    String? issuingCountry,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      IdentityVerificationDocumentAddRequest(
        documentNumber: documentNumber ?? this.documentNumber,
        documentType: documentType ?? this.documentType,
        identityVerificationDocumentAdd: identityVerificationDocumentAdd ??
            this.identityVerificationDocumentAdd,
        issuingCountry: issuingCountry ?? this.issuingCountry,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
