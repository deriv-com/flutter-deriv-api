/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_account_types_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Get account types response class.
class GetAccountTypesResponse extends Response {
  /// Initialize GetAccountTypesResponse.
  const GetAccountTypesResponse({
    this.getAccountTypes,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory GetAccountTypesResponse.fromJson(Map<String, dynamic> json) =>
      GetAccountTypesResponse(
        getAccountTypes: json['get_account_types'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Returns accounts that are available to create or link to
  final Map<String, dynamic>? getAccountTypes;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_account_types': getAccountTypes,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAccountTypesResponse copyWith({
    Map<String, dynamic>? getAccountTypes,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      GetAccountTypesResponse(
        getAccountTypes: getAccountTypes ?? this.getAccountTypes,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
