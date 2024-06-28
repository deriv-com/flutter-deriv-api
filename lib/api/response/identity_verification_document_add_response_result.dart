// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

/// Identity verification document add response model class.
abstract class IdentityVerificationDocumentAddResponseModel {
  /// Initializes Identity verification document add response model class .
  const IdentityVerificationDocumentAddResponseModel({
    this.identityVerificationDocumentAdd,
  });

  /// 1 on success
  final int? identityVerificationDocumentAdd;
}

/// Identity verification document add response class.
class IdentityVerificationDocumentAddResponse
    extends IdentityVerificationDocumentAddResponseModel {
  /// Initializes Identity verification document add response class.
  const IdentityVerificationDocumentAddResponse({
    super.identityVerificationDocumentAdd,
  });

  /// Creates an instance from JSON.
  factory IdentityVerificationDocumentAddResponse.fromJson(
    dynamic identityVerificationDocumentAddJson,
  ) =>
      IdentityVerificationDocumentAddResponse(
        identityVerificationDocumentAdd: identityVerificationDocumentAddJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['identity_verification_document_add'] =
        identityVerificationDocumentAdd;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  IdentityVerificationDocumentAddResponse copyWith({
    int? identityVerificationDocumentAdd,
  }) =>
      IdentityVerificationDocumentAddResponse(
        identityVerificationDocumentAdd: identityVerificationDocumentAdd ??
            this.identityVerificationDocumentAdd,
      );
}
