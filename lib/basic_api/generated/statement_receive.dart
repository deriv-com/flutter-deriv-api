/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/statement_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Statement response class
class StatementResponse extends Response {
  /// Initialize StatementResponse
  const StatementResponse({
    this.statement,
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
  factory StatementResponse.fromJson(Map<String, dynamic> json) =>
      StatementResponse(
        statement: json['statement'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Account statement.
  final Map<String, dynamic> statement;

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
  StatementResponse copyWith({
    Map<String, dynamic> statement,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      StatementResponse(
        statement: statement ?? this.statement,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
