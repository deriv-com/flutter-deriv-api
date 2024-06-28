/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_list_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Copytrading list receive class.
class CopytradingListReceive extends Response {
  /// Initialize CopytradingListReceive.
  const CopytradingListReceive({
    this.copytradingList,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CopytradingListReceive.fromJson(Map<String, dynamic> json) =>
      CopytradingListReceive(
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
  CopytradingListReceive copyWith({
    Map<String, dynamic>? copytradingList,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CopytradingListReceive(
        copytradingList: copytradingList ?? this.copytradingList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
