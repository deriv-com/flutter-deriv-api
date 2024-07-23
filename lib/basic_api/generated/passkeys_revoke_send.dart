/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_revoke_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Passkeys revoke request class.
class PasskeysRevokeRequest extends Request {
  /// Initialize PasskeysRevokeRequest.
  const PasskeysRevokeRequest({
    required this.id,
    this.loginid,
    this.passkeysRevoke = true,
    required this.publicKeyCredential,
    super.msgType = 'passkeys_revoke',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysRevokeRequest.fromJson(Map<String, dynamic> json) =>
      PasskeysRevokeRequest(
        id: json['id'] as int?,
        loginid: json['loginid'] as String?,
        passkeysRevoke: json['passkeys_revoke'] == null
            ? null
            : json['passkeys_revoke'] == 1,
        publicKeyCredential:
            json['publicKeyCredential'] as Map<String, dynamic>?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The system id of the passkey.
  final int? id;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? passkeysRevoke;

  /// The public key credential returned from the authenticator.
  final Map<String, dynamic>? publicKeyCredential;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'loginid': loginid,
        'passkeys_revoke': passkeysRevoke == null
            ? null
            : passkeysRevoke!
                ? 1
                : 0,
        'publicKeyCredential': publicKeyCredential,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysRevokeRequest copyWith({
    int? id,
    String? loginid,
    bool? passkeysRevoke,
    Map<String, dynamic>? publicKeyCredential,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PasskeysRevokeRequest(
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        passkeysRevoke: passkeysRevoke ?? this.passkeysRevoke,
        publicKeyCredential: publicKeyCredential ?? this.publicKeyCredential,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
