/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_servers_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Trading servers send class
class TradingServersSend extends Request {
  /// Initialize TradingServersSend
  const TradingServersSend({
    this.environment,
    this.platform,
    this.tradingServers = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'trading_servers',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TradingServersSend.fromJson(Map<String, dynamic> json) =>
      TradingServersSend(
        environment: json['environment'] as String,
        platform: json['platform'] as String,
        tradingServers: json['trading_servers'] == null
            ? null
            : json['trading_servers'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] Pass the environment (installation) instance short code. Currently, there is only one environment instance. Defaults to 'env_01'.
  final String environment;

  /// [Optional] Pass the trading platform name, default to mt5
  final String platform;

  /// Must be `true`
  final bool tradingServers;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'environment': environment,
        'platform': platform,
        'trading_servers': tradingServers == null
            ? null
            : tradingServers
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingServersSend copyWith({
    String environment,
    String platform,
    bool tradingServers,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TradingServersSend(
        environment: environment ?? this.environment,
        platform: platform ?? this.platform,
        tradingServers: tradingServers ?? this.tradingServers,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}