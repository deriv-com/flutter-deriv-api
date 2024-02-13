/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_register_options_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Passkeys register options request class.
class PasskeysRegisterOptionsRequest extends Request {
  /// Initialize PasskeysRegisterOptionsRequest.
  const PasskeysRegisterOptionsRequest({
    this.loginid,
    this.passkeysRegisterOptions = true,
    super.msgType = 'passkeys_register_options',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysRegisterOptionsRequest.fromJson(Map<String, dynamic> json) =>
      PasskeysRegisterOptionsRequest(
        loginid: json['loginid'] as String?,
        passkeysRegisterOptions: json['passkeys_register_options'] == null
            ? null
            : json['passkeys_register_options'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? passkeysRegisterOptions;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'passkeys_register_options': passkeysRegisterOptions == null
            ? null
            : passkeysRegisterOptions!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysRegisterOptionsRequest copyWith({
    String? loginid,
    bool? passkeysRegisterOptions,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PasskeysRegisterOptionsRequest(
        loginid: loginid ?? this.loginid,
        passkeysRegisterOptions:
            passkeysRegisterOptions ?? this.passkeysRegisterOptions,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
