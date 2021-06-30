/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/new_account_maltainvest_receive.json

import '../response.dart';

/// New account maltainvest response class
class NewAccountMaltainvestResponse extends Response {
  /// Initialize NewAccountMaltainvestResponse
  const NewAccountMaltainvestResponse({
    this.newAccountMaltainvest,
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

  /// Creates an instance from JSON
  factory NewAccountMaltainvestResponse.fromJson(Map<String, dynamic> json) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest:
            json['new_account_maltainvest'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// New `maltainvest` account details
  final Map<String, dynamic>? newAccountMaltainvest;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'new_account_maltainvest': newAccountMaltainvest,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  NewAccountMaltainvestResponse copyWith({
    Map<String, dynamic>? newAccountMaltainvest,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      NewAccountMaltainvestResponse(
        newAccountMaltainvest:
            newAccountMaltainvest ?? this.newAccountMaltainvest,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
