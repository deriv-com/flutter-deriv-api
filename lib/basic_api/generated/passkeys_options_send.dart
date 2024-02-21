/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_options_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Passkeys options request class.
class PasskeysOptionsRequest extends Request {
  /// Initialize PasskeysOptionsRequest.
  const PasskeysOptionsRequest({
    this.loginid,
    this.passkeyId,
    this.passkeysOptions = true,
    super.msgType = 'passkeys_options',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysOptionsRequest.fromJson(Map<String, dynamic> json) =>
      PasskeysOptionsRequest(
        loginid: json['loginid'] as String?,
        passkeyId: json['passkey_id'] as String?,
        passkeysOptions: json['passkeys_options'] == null
            ? null
            : json['passkeys_options'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] The id of the passkey. If left unspecified, User can use any passkey to authorize.
  final String? passkeyId;

  /// Must be `true`
  final bool? passkeysOptions;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'passkey_id': passkeyId,
        'passkeys_options': passkeysOptions == null
            ? null
            : passkeysOptions!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysOptionsRequest copyWith({
    String? loginid,
    String? passkeyId,
    bool? passkeysOptions,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PasskeysOptionsRequest(
        loginid: loginid ?? this.loginid,
        passkeyId: passkeyId ?? this.passkeyId,
        passkeysOptions: passkeysOptions ?? this.passkeysOptions,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
