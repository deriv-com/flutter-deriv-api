/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_account_types_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get account types request class.
class GetAccountTypesRequest extends Request {
  /// Initialize GetAccountTypesRequest.
  const GetAccountTypesRequest({
    this.company,
    this.getAccountTypes = true,
    this.loginid,
    super.msgType = 'get_account_types',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory GetAccountTypesRequest.fromJson(Map<String, dynamic> json) =>
      GetAccountTypesRequest(
        company: json['company'] as String?,
        getAccountTypes: json['get_account_types'] == null
            ? null
            : json['get_account_types'] == 1,
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Set to landing company to get relevant account types. If not set, this defaults to current account landing company
  final String? company;

  /// Must be `true`
  final bool? getAccountTypes;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'company': company,
        'get_account_types': getAccountTypes == null
            ? null
            : getAccountTypes!
                ? 1
                : 0,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAccountTypesRequest copyWith({
    String? company,
    bool? getAccountTypes,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetAccountTypesRequest(
        company: company ?? this.company,
        getAccountTypes: getAccountTypes ?? this.getAccountTypes,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
