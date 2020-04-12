/// generated automatically from flutter_deriv_api|lib/api/statement_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'statement_receive.g.dart';

/// JSON conversion for 'statement_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class StatementResponse extends Response {
  /// Initialize StatementResponse
  StatementResponse({
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

  /// Creates instance from JSON
  factory StatementResponse.fromJson(Map<String, dynamic> json) =>
      _$StatementResponseFromJson(json);

  // Properties
  /// Account statement.
  final Map<String, dynamic> statement;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$StatementResponseToJson(this);
}
