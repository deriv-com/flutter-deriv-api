/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_account_status_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get account status request class.
class GetAccountStatusRequest extends Request {
  /// Initialize GetAccountStatusRequest.
  const GetAccountStatusRequest({
    this.getAccountStatus = true,
    this.loginid,
    super.msgType = 'get_account_status',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory GetAccountStatusRequest.fromJson(Map<String, dynamic> json) =>
      GetAccountStatusRequest(
        getAccountStatus: json['get_account_status'] == null
            ? null
            : json['get_account_status'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? getAccountStatus;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_account_status': getAccountStatus == null
            ? null
            : getAccountStatus!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAccountStatusRequest copyWith({
    bool? getAccountStatus,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetAccountStatusRequest(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
