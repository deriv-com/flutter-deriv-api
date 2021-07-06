/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/statement_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Statement receive class.
class StatementReceive extends Response {
  /// Initialize StatementReceive.
  const StatementReceive({
    this.statement,
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
  factory StatementReceive.fromJson(Map<String, dynamic> json) =>
      StatementReceive(
        statement: json['statement'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Account statement.
  final Map<String, dynamic>? statement;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'statement': statement,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  StatementReceive copyWith({
    Map<String, dynamic>? statement,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      StatementReceive(
        statement: statement ?? this.statement,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
