/// Reality check receive model class
abstract class RealityCheckReceiveModel {
  /// Initializes
  RealityCheckReceiveModel({
    @required this.realityCheck,
  });

  /// Reality check summary of trades.
  final RealityCheck realityCheck;
}

/// Reality check receive class
class RealityCheckReceive extends RealityCheckReceiveModel {
  /// Initializes
  RealityCheckReceive({
    @required RealityCheck realityCheck,
  }) : super(
          realityCheck: realityCheck,
        );

  /// Creates an instance from JSON
  factory RealityCheckReceive.fromJson(Map<String, dynamic> json) =>
      RealityCheckReceive(
        realityCheck: json['reality_check'] == null
            ? null
            : RealityCheck.fromJson(json['reality_check']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (realityCheck != null) {
      result['reality_check'] = realityCheck.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  RealityCheckReceive copyWith({
    RealityCheck realityCheck,
  }) =>
      RealityCheckReceive(
        realityCheck: realityCheck ?? this.realityCheck,
      );
}
/// Reality check model class
abstract class RealityCheckModel {
  /// Initializes
  RealityCheckModel({
    @required this.buyAmount,
    @required this.buyCount,
    @required this.currency,
    @required this.loginid,
    @required this.openContractCount,
    @required this.potentialProfit,
    @required this.sellAmount,
    @required this.sellCount,
    @required this.startTime,
  });

  /// Total amount of contract purchased.
  final double buyAmount;

  /// Total count of contract purchased.
  final int buyCount;

  /// Currency of client account i.e currency for trading
  final String currency;

  /// Client loginid.
  final String loginid;

  /// Total count of contracts that are not yet expired.
  final int openContractCount;

  /// Indicative profit of contract as per current market price.
  final double potentialProfit;

  /// Total amount of contracts sold.
  final double sellAmount;

  /// Total count of contract sold.
  final int sellCount;

  /// Reality check summary start time epoch
  final int startTime;
}

/// Reality check class
class RealityCheck extends RealityCheckModel {
  /// Initializes
  RealityCheck({
    @required double buyAmount,
    @required int buyCount,
    @required String currency,
    @required String loginid,
    @required int openContractCount,
    @required double potentialProfit,
    @required double sellAmount,
    @required int sellCount,
    @required int startTime,
  }) : super(
          buyAmount: buyAmount,
          buyCount: buyCount,
          currency: currency,
          loginid: loginid,
          openContractCount: openContractCount,
          potentialProfit: potentialProfit,
          sellAmount: sellAmount,
          sellCount: sellCount,
          startTime: startTime,
        );

  /// Creates an instance from JSON
  factory RealityCheck.fromJson(Map<String, dynamic> json) => RealityCheck(
        buyAmount: getDouble(json['buy_amount']),
        buyCount: json['buy_count'],
        currency: json['currency'],
        loginid: json['loginid'],
        openContractCount: json['open_contract_count'],
        potentialProfit: getDouble(json['potential_profit']),
        sellAmount: getDouble(json['sell_amount']),
        sellCount: json['sell_count'],
        startTime: json['start_time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['buy_amount'] = buyAmount;
    result['buy_count'] = buyCount;
    result['currency'] = currency;
    result['loginid'] = loginid;
    result['open_contract_count'] = openContractCount;
    result['potential_profit'] = potentialProfit;
    result['sell_amount'] = sellAmount;
    result['sell_count'] = sellCount;
    result['start_time'] = startTime;

    return result;
  }

  /// Creates a copy of instance with given parameters
  RealityCheck copyWith({
    double buyAmount,
    int buyCount,
    String currency,
    String loginid,
    int openContractCount,
    double potentialProfit,
    double sellAmount,
    int sellCount,
    int startTime,
  }) =>
      RealityCheck(
        buyAmount: buyAmount ?? this.buyAmount,
        buyCount: buyCount ?? this.buyCount,
        currency: currency ?? this.currency,
        loginid: loginid ?? this.loginid,
        openContractCount: openContractCount ?? this.openContractCount,
        potentialProfit: potentialProfit ?? this.potentialProfit,
        sellAmount: sellAmount ?? this.sellAmount,
        sellCount: sellCount ?? this.sellCount,
        startTime: startTime ?? this.startTime,
      );
}
