/// generated automatically from flutter_deriv_api|lib/api/statement_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'statement_receive.g.dart';

/// JSON conversion for 'statement_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class StatementResponse extends Response {
  /// Initialize StatementResponse
  const StatementResponse({
    this.statement,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory StatementResponse.fromJson(Map<String, dynamic> json) =>
      _$StatementResponseFromJson(json);

  // Properties
  /// Account statement.
  final Map<String, dynamic> statement;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$StatementResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  StatementResponse copyWith({
    Map<String, dynamic> statement,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      StatementResponse(
        statement: statement ?? this.statement,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
