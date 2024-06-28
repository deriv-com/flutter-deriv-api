/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Passkeys list request class.
class PasskeysListRequest extends Request {
  /// Initialize PasskeysListRequest.
  const PasskeysListRequest({
    this.loginid,
    this.passkeysList = true,
    super.msgType = 'passkeys_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysListRequest.fromJson(Map<String, dynamic> json) =>
      PasskeysListRequest(
        loginid: json['loginid'] as String?,
        passkeysList:
            json['passkeys_list'] == null ? null : json['passkeys_list'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? passkeysList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginid': loginid,
        'passkeys_list': passkeysList == null
            ? null
            : passkeysList!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysListRequest copyWith({
    String? loginid,
    bool? passkeysList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PasskeysListRequest(
        loginid: loginid ?? this.loginid,
        passkeysList: passkeysList ?? this.passkeysList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
