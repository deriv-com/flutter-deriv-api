/// Portfolio receive model class
abstract class PortfolioReceiveModel {
  /// Initializes
  PortfolioReceiveModel({
    @required this.portfolio,
  });

  /// Current account's open positions.
  final Portfolio portfolio;
}

/// Portfolio receive class
class PortfolioReceive extends PortfolioReceiveModel {
  /// Initializes
  PortfolioReceive({
    @required Portfolio portfolio,
  }) : super(
          portfolio: portfolio,
        );

  /// Creates an instance from JSON
  factory PortfolioReceive.fromJson(Map<String, dynamic> json) =>
      PortfolioReceive(
        portfolio: json['portfolio'] == null
            ? null
            : Portfolio.fromJson(json['portfolio']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (portfolio != null) {
      result['portfolio'] = portfolio.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  PortfolioReceive copyWith({
    Portfolio portfolio,
  }) =>
      PortfolioReceive(
        portfolio: portfolio ?? this.portfolio,
      );
}
/// Portfolio model class
abstract class PortfolioModel {
  /// Initializes
  PortfolioModel({
    @required this.contracts,
  });

  /// List of open positions.
  final List<Contract> contracts;
}

/// Portfolio class
class Portfolio extends PortfolioModel {
  /// Initializes
  Portfolio({
    @required List<Contract> contracts,
  }) : super(
          contracts: contracts,
        );

  /// Creates an instance from JSON
  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        contracts: json['contracts'] == null
            ? null
            : json['contracts']
                .map<Contract>((dynamic item) => Contract.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (contracts != null) {
      result['contracts'] = contracts.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  Portfolio copyWith({
    List<Contract> contracts,
  }) =>
      Portfolio(
        contracts: contracts ?? this.contracts,
      );
}
/// Contract model class
abstract class ContractModel {
  /// Initializes
  ContractModel({
    this.appId,
    @required this.buyPrice,
    @required this.contractId,
    @required this.contractType,
    @required this.currency,
    @required this.dateStart,
    @required this.expiryTime,
    @required this.longcode,
    @required this.payout,
    @required this.purchaseTime,
    @required this.symbol,
    @required this.transactionId,
  });

  /// ID of the application where this contract was purchased.
  final double appId;

  /// Buy price
  final double buyPrice;

  /// Internal contract identifier number (to be used in a `proposal_open_contract` API call).
  final int contractId;

  /// Contract type
  final String contractType;

  /// Contract currency
  final String currency;

  /// Epoch of start date
  final int dateStart;

  /// Epoch of expiry time
  final int expiryTime;

  /// Contract description
  final String longcode;

  /// Payout price
  final double payout;

  /// Epoch of purchase time
  final int purchaseTime;

  /// Symbol code
  final String symbol;

  /// It is the transaction ID. Every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;
}

/// Contract class
class Contract extends ContractModel {
  /// Initializes
  Contract({
    double appId,
    @required double buyPrice,
    @required int contractId,
    @required String contractType,
    @required String currency,
    @required int dateStart,
    @required int expiryTime,
    @required String longcode,
    @required double payout,
    @required int purchaseTime,
    @required String symbol,
    @required int transactionId,
  }) : super(
          appId: appId,
          buyPrice: buyPrice,
          contractId: contractId,
          contractType: contractType,
          currency: currency,
          dateStart: dateStart,
          expiryTime: expiryTime,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          symbol: symbol,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        appId: getDouble(json['app_id']),
        buyPrice: getDouble(json['buy_price']),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        dateStart: json['date_start'],
        expiryTime: json['expiry_time'],
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: json['purchase_time'],
        symbol: json['symbol'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_id'] = appId;
    result['buy_price'] = buyPrice;
    result['contract_id'] = contractId;
    result['contract_type'] = contractType;
    result['currency'] = currency;
    result['date_start'] = dateStart;
    result['expiry_time'] = expiryTime;
    result['longcode'] = longcode;
    result['payout'] = payout;
    result['purchase_time'] = purchaseTime;
    result['symbol'] = symbol;
    result['transaction_id'] = transactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Contract copyWith({
    double appId,
    double buyPrice,
    int contractId,
    String contractType,
    String currency,
    int dateStart,
    int expiryTime,
    String longcode,
    double payout,
    int purchaseTime,
    String symbol,
    int transactionId,
  }) =>
      Contract(
        appId: appId ?? this.appId,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        dateStart: dateStart ?? this.dateStart,
        expiryTime: expiryTime ?? this.expiryTime,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        symbol: symbol ?? this.symbol,
        transactionId: transactionId ?? this.transactionId,
      );
}
