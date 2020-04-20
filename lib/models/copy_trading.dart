import 'package:flutter_deriv_api/models/base_model.dart';

///
class CopyTradingModel extends BaseModel {
  /// Constructor
  CopyTradingModel({this.copiers, this.traders});

  /// List of users who are currently copy trading the authenticated user
  final List<CopierModel> copiers;

  /// List of traders being followed by the authenticated user
  final List<TraderModel> traders;
}

/// Copier
class CopierModel {
  /// Constructor
  CopierModel({this.loginid});

  /// Instance from JSON
  factory CopierModel.fromJson(Map<String, dynamic> json) => CopierModel(
    loginid: json['loginid'],
  );

  /// The loginid of the copier's account.
  final String loginid;

  /// ToJson
  CopierModel copyWith({
    String loginid,
  }) =>
      CopierModel(loginid: loginid ?? this.loginid);
}

/// Trader information
class TraderModel {
  /// Constructor
  TraderModel(
      {this.assets,
        this.loginid,
        this.maxTradeStake,
        this.minTradeStake,
        this.token,
        this.tradeTypes});

  /// Instance from JSON
  factory TraderModel.fromJson(Map<String, dynamic> json) => TraderModel(
    assets: json['assets'] != null
        ? json['assets'].map<String>((dynamic entry) => entry).toList()
        : null,
    loginid: json['loginid'],
    maxTradeStake: json['max_trade_stake'],
    minTradeStake: json['min_trade_stake'],
    token: json['token'],
    tradeTypes: json['trade_types'] != null
        ? json['trade_types'].map<String>((dynamic entry) => entry).toList()
        : null,
  );

  /// The list of assets to copy the trades of.
  final List<String> assets;

  /// The loginid of the trader's account.
  final String loginid;

  /// Maximum trading stake set for the trader.
  final String maxTradeStake;

  /// Minimum trading stake set for the trader.
  final String minTradeStake;

  /// The token provided for the trader.
  final String token;

  /// The type of trades set.
  final List<String> tradeTypes;

  /// ToJson
  TraderModel copyWith({
    List<String> assets,
    String loginid,
    String maxTradeStake,
    String minTradeStake,
    String token,
    List<String> tradeTypes,
  }) =>
      TraderModel(
          assets: assets ?? this.assets,
          loginid: loginid ?? this.loginid,
          maxTradeStake: maxTradeStake ?? this.maxTradeStake,
          minTradeStake: minTradeStake ?? this.minTradeStake,
          token: token ?? this.token,
          tradeTypes: tradeTypes ?? this.tradeTypes);
}
