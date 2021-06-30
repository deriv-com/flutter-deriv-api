/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_servers_send.json

import '../request.dart';

/// Trading servers request class
class TradingServersRequest extends Request {
  /// Initialize TradingServersRequest
  const TradingServersRequest({
    this.accountType,
    this.environment,
    this.marketType,
    this.platform,
    this.tradingServers = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'trading_servers',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TradingServersRequest.fromJson(Map<String, dynamic> json) =>
      TradingServersRequest(
        accountType: json['account_type'] as String?,
        environment: json['environment'] as String?,
        marketType: json['market_type'] as String?,
        platform: json['platform'] as String?,
        tradingServers: json['trading_servers'] == null
            ? null
            : json['trading_servers'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Trading account type.
  final String? accountType;

  /// [Optional] Pass the environment (installation) instance. Currently, there are one demo and two real environments. Defaults to 'all'.
  final String? environment;

  /// [Optional] Market type.
  final String? marketType;

  /// [Optional] Pass the trading platform name, default to mt5
  final String? platform;

  /// Must be `true`
  final bool? tradingServers;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_type': accountType,
        'environment': environment,
        'market_type': marketType,
        'platform': platform,
        'trading_servers': tradingServers == null
            ? null
            : tradingServers!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingServersRequest copyWith({
    String? accountType,
    String? environment,
    String? marketType,
    String? platform,
    bool? tradingServers,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      TradingServersRequest(
        accountType: accountType ?? this.accountType,
        environment: environment ?? this.environment,
        marketType: marketType ?? this.marketType,
        platform: platform ?? this.platform,
        tradingServers: tradingServers ?? this.tradingServers,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
