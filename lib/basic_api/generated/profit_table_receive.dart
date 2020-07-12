/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/profit_table_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// ProfitTableResponse class
class ProfitTableResponse extends Response {
  /// Initialize ProfitTableResponse
  const ProfitTableResponse({
    this.profitTable,
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
  factory ProfitTableResponse.fromJson(Map<String, dynamic> json) =>
      ProfitTableResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        profitTable: json['profit_table'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Account Profit Table.
  final Map<String, dynamic> profitTable;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'profit_table': profitTable,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProfitTableResponse copyWith({
    Map<String, dynamic> profitTable,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ProfitTableResponse(
        profitTable: profitTable ?? this.profitTable,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
