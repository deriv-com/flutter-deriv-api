import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Trader information
class TraderModel extends APIBaseModel {
  /// Initializes
  TraderModel({
    this.assets,
    this.loginId,
    this.maxTradeStake,
    this.minTradeStake,
    this.token,
    this.tradeTypes,
  });

  /// Creates instance from JSON
  factory TraderModel.fromJson(Map<String, dynamic> json) => TraderModel(
        assets: getListFromMap(json['assets']),
        loginId: json['loginid'],
        maxTradeStake: json['max_trade_stake']?.toDouble(),
        minTradeStake: json['min_trade_stake']?.toDouble(),
        token: json['token'],
        tradeTypes: getListFromMap(json['trade_types']),
      );

  /// The list of assets to copy the trades of.
  final List<String> assets;

  /// The loginId of the trader's account.
  final String loginId;

  /// Maximum trading stake set for the trader.
  final double maxTradeStake;

  /// Minimum trading stake set for the trader.
  final double minTradeStake;

  /// The token provided for the trader.
  final String token;

  /// The type of trades set.
  final List<String> tradeTypes;

  /// Clones a new instance
  TraderModel copyWith({
    List<String> assets,
    String loginId,
    String maxTradeStake,
    String minTradeStake,
    String token,
    List<String> tradeTypes,
  }) =>
      TraderModel(
        assets: assets ?? this.assets,
        loginId: loginId ?? this.loginId,
        maxTradeStake: maxTradeStake ?? this.maxTradeStake,
        minTradeStake: minTradeStake ?? this.minTradeStake,
        token: token ?? this.token,
        tradeTypes: tradeTypes ?? this.tradeTypes,
      );
}
