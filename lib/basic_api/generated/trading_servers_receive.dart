/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_servers_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Trading servers receive class.
class TradingServersReceive extends Response {
  /// Initialize TradingServersReceive.
  const TradingServersReceive({
    this.tradingServers,
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
  factory TradingServersReceive.fromJson(Map<String, dynamic> json) =>
      TradingServersReceive(
        tradingServers: (json['trading_servers'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Array containing platform server objects.
  final List<Map<String, dynamic>>? tradingServers;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_servers': tradingServers,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingServersReceive copyWith({
    List<Map<String, dynamic>>? tradingServers,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TradingServersReceive(
        tradingServers: tradingServers ?? this.tradingServers,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
