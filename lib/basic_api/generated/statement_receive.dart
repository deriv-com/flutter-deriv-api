/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/statement_receive.json
// ignore_for_file: avoid_as, always_specify_types

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
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        statement: json['statement'] as Map<String, dynamic>,
      );

  /// Account statement.
  final Map<String, dynamic> statement;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'statement': statement,
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
