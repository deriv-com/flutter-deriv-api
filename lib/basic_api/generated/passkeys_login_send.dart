/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_login_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Passkeys login request class.
class PasskeysLoginRequest extends Request {
  /// Initialize PasskeysLoginRequest.
  const PasskeysLoginRequest({
    this.loginid,
    this.passkeysLogin = true,
    required this.publicKeyCredential,
    super.msgType = 'passkeys_login',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysLoginRequest.fromJson(Map<String, dynamic> json) =>
      PasskeysLoginRequest(
        loginid: json['loginid'] as String?,
        passkeysLogin:
            json['passkeys_login'] == null ? null : json['passkeys_login'] == 1,
        publicKeyCredential:
            json['publicKeyCredential'] as Map<String, dynamic>?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? passkeysLogin;

  /// The public key credential returned from the authenticator.
  final Map<String, dynamic>? publicKeyCredential;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'passkeys_login': passkeysLogin == null
            ? null
            : passkeysLogin!
                ? 1
                : 0,
        'publicKeyCredential': publicKeyCredential,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysLoginRequest copyWith({
    String? loginid,
    bool? passkeysLogin,
    Map<String, dynamic>? publicKeyCredential,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PasskeysLoginRequest(
        loginid: loginid ?? this.loginid,
        passkeysLogin: passkeysLogin ?? this.passkeysLogin,
        publicKeyCredential: publicKeyCredential ?? this.publicKeyCredential,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
