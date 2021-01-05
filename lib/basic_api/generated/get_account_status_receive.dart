/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_account_status_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Get account status receive class
class GetAccountStatusReceive extends Response {
  /// Initialize GetAccountStatusReceive
  const GetAccountStatusReceive({
    this.getAccountStatus,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetAccountStatusReceive.fromJson(Map<String, dynamic> json) =>
      GetAccountStatusReceive(
        getAccountStatus: json['get_account_status'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Account status details
  final Map<String, dynamic> getAccountStatus;

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
  GetAccountStatusReceive copyWith({
    Map<String, dynamic> getAccountStatus,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetAccountStatusReceive(
        getAccountStatus: getAccountStatus ?? this.getAccountStatus,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
