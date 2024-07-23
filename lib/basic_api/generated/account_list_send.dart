/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/account_list_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Account list request class.
class AccountListRequest extends Request {
  /// Initialize AccountListRequest.
  const AccountListRequest({
    this.accountList = true,
    super.msgType = 'account_list',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AccountListRequest.fromJson(Map<String, dynamic> json) =>
      AccountListRequest(
        accountList:
            json['account_list'] == null ? null : json['account_list'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? accountList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_list': accountList == null
            ? null
            : accountList!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AccountListRequest copyWith({
    bool? accountList,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AccountListRequest(
        accountList: accountList ?? this.accountList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
