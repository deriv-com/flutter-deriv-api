/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_list_receive.json.

import '../response.dart';

/// Copytrading list response class.
class CopytradingListResponse extends Response {
  /// Initialize CopytradingListResponse.
  const CopytradingListResponse({
    this.copytradingList,
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
  factory CopytradingListResponse.fromJson(Map<String, dynamic> json) =>
      CopytradingListResponse(
        copytradingList: json['copytrading_list'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The trading information of copiers or traders.
  final Map<String, dynamic>? copytradingList;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_list': copytradingList,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopytradingListResponse copyWith({
    Map<String, dynamic>? copytradingList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CopytradingListResponse(
        copytradingList: copytradingList ?? this.copytradingList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
