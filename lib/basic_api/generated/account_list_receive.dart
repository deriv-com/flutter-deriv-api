/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/account_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Account list receive class.
class AccountListReceive extends Response {
  /// Initialize AccountListReceive.
  const AccountListReceive({
    this.accountList,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AccountListReceive.fromJson(Map<String, dynamic> json) =>
      AccountListReceive(
        accountList: (json['account_list'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// List of accounts for current user. This is also available from the `authroize` call.
  final List<Map<String, dynamic>>? accountList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_list': accountList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AccountListReceive copyWith({
    List<Map<String, dynamic>>? accountList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AccountListReceive(
        accountList: accountList ?? this.accountList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
