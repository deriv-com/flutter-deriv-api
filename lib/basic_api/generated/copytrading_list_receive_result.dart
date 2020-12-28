/// Copytrading list receive model class
abstract class CopytradingListReceiveModel {
  /// Initializes
  CopytradingListReceiveModel({
    @required this.copytradingList,
  });

  /// The trading information of copiers or traders.
  final CopytradingList copytradingList;
}

/// Copytrading list receive class
class CopytradingListReceive extends CopytradingListReceiveModel {
  /// Initializes
  CopytradingListReceive({
    @required CopytradingList copytradingList,
  }) : super(
          copytradingList: copytradingList,
        );

  /// Creates an instance from JSON
  factory CopytradingListReceive.fromJson(Map<String, dynamic> json) =>
      CopytradingListReceive(
        copytradingList: json['copytrading_list'] == null
            ? null
            : CopytradingList.fromJson(json['copytrading_list']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (copytradingList != null) {
      result['copytrading_list'] = copytradingList.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopytradingListReceive copyWith({
    CopytradingList copytradingList,
  }) =>
      CopytradingListReceive(
        copytradingList: copytradingList ?? this.copytradingList,
      );
}
/// Copytrading list model class
abstract class CopytradingListModel {
  /// Initializes
  CopytradingListModel({
    @required this.copiers,
    @required this.traders,
  });

  /// List of users who are currently copy trading the authenticated user
  final List<Copier> copiers;

  /// List of traders being followed by the authenticated user
  final List<Trader> traders;
}

/// Copytrading list class
class CopytradingList extends CopytradingListModel {
  /// Initializes
  CopytradingList({
    @required List<Copier> copiers,
    @required List<Trader> traders,
  }) : super(
          copiers: copiers,
          traders: traders,
        );

  /// Creates an instance from JSON
  factory CopytradingList.fromJson(Map<String, dynamic> json) =>
      CopytradingList(
        copiers: json['copiers'] == null
            ? null
            : json['copiers']
                .map<Copier>((dynamic item) => Copier.fromJson(item))
                .toList(),
        traders: json['traders'] == null
            ? null
            : json['traders']
                .map<Trader>((dynamic item) => Trader.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (copiers != null) {
      result['copiers'] = copiers.map((item) => item.toJson()).toList();
    }
    if (traders != null) {
      result['traders'] = traders.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopytradingList copyWith({
    List<Copier> copiers,
    List<Trader> traders,
  }) =>
      CopytradingList(
        copiers: copiers ?? this.copiers,
        traders: traders ?? this.traders,
      );
}
/// Copier model class
abstract class CopierModel {
  /// Initializes
  CopierModel({
    @required this.loginid,
  });

  /// The loginid of the copier's account.
  final String loginid;
}

/// Copier class
class Copier extends CopierModel {
  /// Initializes
  Copier({
    @required String loginid,
  }) : super(
          loginid: loginid,
        );

  /// Creates an instance from JSON
  factory Copier.fromJson(Map<String, dynamic> json) => Copier(
        loginid: json['loginid'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['loginid'] = loginid;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Copier copyWith({
    String loginid,
  }) =>
      Copier(
        loginid: loginid ?? this.loginid,
      );
}
/// Trader model class
abstract class TraderModel {
  /// Initializes
  TraderModel({
    @required this.assets,
    @required this.loginid,
    this.maxTradeStake,
    this.minTradeStake,
    @required this.token,
    @required this.tradeTypes,
  });

  /// The list of assets to copy the trades of.
  final List<String> assets;

  /// The loginid of the trader's account.
  final String loginid;

  /// Maximum trading stake set for the trader.
  final double maxTradeStake;

  /// Minimum trading stake set for the trader.
  final double minTradeStake;

  /// The token provided for the trader.
  final String token;

  /// The type of trades set.
  final List<String> tradeTypes;
}

/// Trader class
class Trader extends TraderModel {
  /// Initializes
  Trader({
    @required List<String> assets,
    @required String loginid,
    double maxTradeStake,
    double minTradeStake,
    @required String token,
    @required List<String> tradeTypes,
  }) : super(
          assets: assets,
          loginid: loginid,
          maxTradeStake: maxTradeStake,
          minTradeStake: minTradeStake,
          token: token,
          tradeTypes: tradeTypes,
        );

  /// Creates an instance from JSON
  factory Trader.fromJson(Map<String, dynamic> json) => Trader(
        assets: List<String>.from(json['assets'].map((x) => x)),
        loginid: json['loginid'],
        maxTradeStake: getDouble(json['max_trade_stake']),
        minTradeStake: getDouble(json['min_trade_stake']),
        token: json['token'],
        tradeTypes: List<String>.from(json['trade_types'].map((x) => x)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['assets'] = assets;
    result['loginid'] = loginid;
    result['max_trade_stake'] = maxTradeStake;
    result['min_trade_stake'] = minTradeStake;
    result['token'] = token;
    result['trade_types'] = tradeTypes;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Trader copyWith({
    List<String> assets,
    String loginid,
    double maxTradeStake,
    double minTradeStake,
    String token,
    List<String> tradeTypes,
  }) =>
      Trader(
        assets: assets ?? this.assets,
        loginid: loginid ?? this.loginid,
        maxTradeStake: maxTradeStake ?? this.maxTradeStake,
        minTradeStake: minTradeStake ?? this.minTradeStake,
        token: token ?? this.token,
        tradeTypes: tradeTypes ?? this.tradeTypes,
      );
}
