/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_account_status_receive.json.

import '../response.dart';

/// Get account status response class.
class GetAccountStatusResponse extends Response {
  /// Initialize GetAccountStatusResponse.
  const GetAccountStatusResponse({
    this.getAccountStatus,
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
  factory GetAccountStatusResponse.fromJson(Map<String, dynamic> json) =>
      GetAccountStatusResponse(
        getAccountStatus: json['get_account_status'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Account status details
  final Map<String, dynamic>? getAccountStatus;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_account_status': getAccountStatus,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetAccountStatusResponse copyWith({
    Map<String, dynamic>? getAccountStatus,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      GetAccountStatusResponse(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
