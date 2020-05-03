import 'package:flutter_deriv_api/utils/helpers.dart';

import 'account_authentication_document_model.dart';
import 'account_identity_model.dart';
import 'base_model.dart';

/// This represents the authentication status of the user and it
/// includes what authentication is needed.
class AccountAuthenticationStatusModel extends BaseModel {
  /// Constructor
  AccountAuthenticationStatusModel({
    this.document,
    this.identity,
    this.needsVerification,
  });

  /// Instance from JSON
  factory AccountAuthenticationStatusModel.fromJson(
          Map<String, dynamic> json) =>
      AccountAuthenticationStatusModel(
        document: getItemFromMap(
          json['document'],
          itemToTypeCallback: (dynamic map) =>
              AccountAuthenticationDocumentModel.fromJson(map),
        ),
        identity: getItemFromMap(
          json['identity'],
          itemToTypeCallback: (dynamic map) =>
              AccountIdentityModel.fromJson(map),
        ),
        needsVerification: getListFromMap(json['needs_verification']),
      );

  /// The authentication status for document.
  final AccountAuthenticationDocumentModel document;

  /// The authentication status for identity.
  final AccountIdentityModel identity;

  /// An array containing the list of required authentication.
  final List<String> needsVerification;

  /// Clones a new instance
  AccountAuthenticationStatusModel copyWith({
    AccountAuthenticationDocumentModel document,
    AccountIdentityModel identity,
    List<String> needsVerification,
  }) =>
      AccountAuthenticationStatusModel(
        document: document ?? this.document,
        identity: identity ?? this.identity,
        needsVerification: needsVerification ?? this.needsVerification,
      );
}
