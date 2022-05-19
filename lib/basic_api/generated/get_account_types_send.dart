/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_account_types_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get account types request class.
class GetAccountTypesRequest extends Request {
  /// Initialize GetAccountTypesRequest.
  const GetAccountTypesRequest({
    this.getAccountTypes = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'get_account_types',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory GetAccountTypesRequest.fromJson(Map<String, dynamic> json) =>
      GetAccountTypesRequest(
        getAccountTypes: json['get_account_types'] == null
            ? null
            : json['get_account_types'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? getAccountTypes;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_account_types': getAccountTypes == null
            ? null
            : getAccountTypes!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAccountTypesRequest copyWith({
    bool? getAccountTypes,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetAccountTypesRequest(
        getAccountTypes: getAccountTypes ?? this.getAccountTypes,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
