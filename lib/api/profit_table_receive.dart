/// generated automatically from flutter_deriv_api|lib/api/profit_table_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'profit_table_receive.g.dart';

/// JSON conversion for 'profit_table_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ProfitTableResponse extends Response {
  /// Initialize ProfitTableResponse
  const ProfitTableResponse({
    this.profitTable,
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
  factory ProfitTableResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfitTableResponseFromJson(json);

  // Properties
  /// Account Profit Table.
  final Map<String, dynamic> profitTable;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ProfitTableResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ProfitTableResponse copyWith({
    Map<String, dynamic> profitTable,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ProfitTableResponse(
        profitTable: profitTable ?? this.profitTable,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
