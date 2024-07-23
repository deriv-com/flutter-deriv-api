/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/available_accounts_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Available accounts request class.
class AvailableAccountsRequest extends Request {
  /// Initialize AvailableAccountsRequest.
  const AvailableAccountsRequest({
    this.availableAccounts = true,
    required this.categories,
    this.loginid,
    super.msgType = 'available_accounts',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AvailableAccountsRequest.fromJson(Map<String, dynamic> json) =>
      AvailableAccountsRequest(
        availableAccounts: json['available_accounts'] == null
            ? null
            : json['available_accounts'] == 1,
        categories: (json['categories'] as List<dynamic>?)
            ?.map<String>((dynamic item) => item as String)
            .toList(),
        loginid: json['loginid'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? availableAccounts;

  /// List of account categories that needs to received.
  final List<String>? categories;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'available_accounts': availableAccounts == null
            ? null
            : availableAccounts!
                ? 1
                : 0,
        'categories': categories,
        'loginid': loginid,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AvailableAccountsRequest copyWith({
    bool? availableAccounts,
    List<String>? categories,
    String? loginid,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AvailableAccountsRequest(
        availableAccounts: availableAccounts ?? this.availableAccounts,
        categories: categories ?? this.categories,
        loginid: loginid ?? this.loginid,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
