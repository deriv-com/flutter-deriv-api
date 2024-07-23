/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/account_closure_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Account closure request class.
class AccountClosureRequest extends Request {
  /// Initialize AccountClosureRequest.
  const AccountClosureRequest({
    this.accountClosure = true,
    this.loginid,
    required this.reason,
    super.msgType = 'account_closure',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AccountClosureRequest.fromJson(Map<String, dynamic> json) =>
      AccountClosureRequest(
        accountClosure: json['account_closure'] == null
            ? null
            : json['account_closure'] == 1,
        loginid: json['loginid'] as String?,
        reason: json['reason'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? accountClosure;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Reason for closing off accounts.
  final String? reason;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_closure': accountClosure == null
            ? null
            : accountClosure!
                ? 1
                : 0,
        'loginid': loginid,
        'reason': reason,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AccountClosureRequest copyWith({
    bool? accountClosure,
    String? loginid,
    String? reason,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AccountClosureRequest(
        accountClosure: accountClosure ?? this.accountClosure,
        loginid: loginid ?? this.loginid,
        reason: reason ?? this.reason,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
