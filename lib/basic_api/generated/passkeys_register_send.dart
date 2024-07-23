/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_register_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Passkeys register request class.
class PasskeysRegisterRequest extends Request {
  /// Initialize PasskeysRegisterRequest.
  const PasskeysRegisterRequest({
    this.loginid,
    required this.name,
    this.passkeysRegister = true,
    required this.publicKeyCredential,
    super.msgType = 'passkeys_register',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegisterRequest.fromJson(Map<String, dynamic> json) =>
      PasskeysRegisterRequest(
        loginid: json['loginid'] as String?,
        name: json['name'] as String?,
        passkeysRegister: json['passkeys_register'] == null
            ? null
            : json['passkeys_register'] == 1,
        publicKeyCredential:
            json['publicKeyCredential'] as Map<String, dynamic>?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// The name of the passkey.
  final String? name;

  /// Must be `true`
  final bool? passkeysRegister;

  /// The public key credential returned from the authenticator.
  final Map<String, dynamic>? publicKeyCredential;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'name': name,
        'passkeys_register': passkeysRegister == null
            ? null
            : passkeysRegister!
                ? 1
                : 0,
        'publicKeyCredential': publicKeyCredential,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysRegisterRequest copyWith({
    String? loginid,
    String? name,
    bool? passkeysRegister,
    Map<String, dynamic>? publicKeyCredential,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PasskeysRegisterRequest(
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        passkeysRegister: passkeysRegister ?? this.passkeysRegister,
        publicKeyCredential: publicKeyCredential ?? this.publicKeyCredential,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
