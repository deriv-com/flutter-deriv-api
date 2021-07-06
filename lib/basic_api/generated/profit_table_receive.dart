/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/profit_table_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Profit table receive class.
class ProfitTableReceive extends Response {
  /// Initialize ProfitTableReceive.
  const ProfitTableReceive({
    this.profitTable,
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
  factory ProfitTableReceive.fromJson(Map<String, dynamic> json) =>
      ProfitTableReceive(
        profitTable: json['profit_table'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Account Profit Table.
  final Map<String, dynamic>? profitTable;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'profit_table': profitTable,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ProfitTableReceive copyWith({
    Map<String, dynamic>? profitTable,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ProfitTableReceive(
        profitTable: profitTable ?? this.profitTable,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
