/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/statement_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'statement_receive.g.dart';

/// JSON conversion for 'statement_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
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
      _$StatementResponseFromJson(json);

  /// Account statement.
  final Map<String, dynamic> statement;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$StatementResponseToJson(this);

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
