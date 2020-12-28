/// Profit table receive model class
abstract class ProfitTableReceiveModel {
  /// Initializes
  ProfitTableReceiveModel({
    @required this.profitTable,
  });

  /// Account Profit Table.
  final ProfitTable profitTable;
}

/// Profit table receive class
class ProfitTableReceive extends ProfitTableReceiveModel {
  /// Initializes
  ProfitTableReceive({
    @required ProfitTable profitTable,
  }) : super(
          profitTable: profitTable,
        );

  /// Creates an instance from JSON
  factory ProfitTableReceive.fromJson(Map<String, dynamic> json) =>
      ProfitTableReceive(
        profitTable: json['profit_table'] == null
            ? null
            : ProfitTable.fromJson(json['profit_table']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (profitTable != null) {
      result['profit_table'] = profitTable.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ProfitTableReceive copyWith({
    ProfitTable profitTable,
  }) =>
      ProfitTableReceive(
        profitTable: profitTable ?? this.profitTable,
      );
}
/// Profit table model class
abstract class ProfitTableModel {
  /// Initializes
  ProfitTableModel({
    @required this.count,
    @required this.transactions,
  });

  /// Number of transactions returned in this call
  final double count;

  /// Array of returned transactions
  final List<Transaction> transactions;
}

/// Profit table class
class ProfitTable extends ProfitTableModel {
  /// Initializes
  ProfitTable({
    @required double count,
    @required List<Transaction> transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Creates an instance from JSON
  factory ProfitTable.fromJson(Map<String, dynamic> json) => ProfitTable(
        count: getDouble(json['count']),
        transactions: json['transactions'] == null
            ? null
            : json['transactions']
                .map<Transaction>((dynamic item) => Transaction.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['count'] = count;
    if (transactions != null) {
      result['transactions'] =
          transactions.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ProfitTable copyWith({
    double count,
    List<Transaction> transactions,
  }) =>
      ProfitTable(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );
}
/// Transaction model class
abstract class TransactionModel {
  /// Initializes
  TransactionModel({
    this.appId,
    @required this.buyPrice,
    this.contractId,
    @required this.longcode,
    @required this.payout,
    @required this.purchaseTime,
    @required this.sellPrice,
    this.sellTime,
    @required this.shortcode,
    @required this.transactionId,
  });

  /// ID of the application where this contract was purchased.
  final double appId;

  /// The buy price
  final double buyPrice;

  /// The unique contract identifier.
  final double contractId;

  /// The description of contract purchased if description is set to 1
  final String longcode;

  /// Payout price
  final double payout;

  /// Epoch purchase time of the transaction
  final int purchaseTime;

  /// The price the contract sold for.
  final double sellPrice;

  /// Epoch sell time of the transaction
  final double sellTime;

  /// Compact description of the contract purchased if description is set to 1
  final String shortcode;

  /// The transaction Identifier. Every contract (buy or sell) and every payment has a unique transaction identifier.
  final int transactionId;
}

/// Transaction class
class Transaction extends TransactionModel {
  /// Initializes
  Transaction({
    double appId,
    @required double buyPrice,
    double contractId,
    @required String longcode,
    @required double payout,
    @required int purchaseTime,
    @required double sellPrice,
    double sellTime,
    @required String shortcode,
    @required int transactionId,
  }) : super(
          appId: appId,
          buyPrice: buyPrice,
          contractId: contractId,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          sellPrice: sellPrice,
          sellTime: sellTime,
          shortcode: shortcode,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        appId: getDouble(json['app_id']),
        buyPrice: getDouble(json['buy_price']),
        contractId: getDouble(json['contract_id']),
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: json['purchase_time'],
        sellPrice: getDouble(json['sell_price']),
        sellTime: getDouble(json['sell_time']),
        shortcode: json['shortcode'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_id'] = appId;
    result['buy_price'] = buyPrice;
    result['contract_id'] = contractId;
    result['longcode'] = longcode;
    result['payout'] = payout;
    result['purchase_time'] = purchaseTime;
    result['sell_price'] = sellPrice;
    result['sell_time'] = sellTime;
    result['shortcode'] = shortcode;
    result['transaction_id'] = transactionId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Transaction copyWith({
    double appId,
    double buyPrice,
    double contractId,
    String longcode,
    double payout,
    int purchaseTime,
    double sellPrice,
    double sellTime,
    String shortcode,
    int transactionId,
  }) =>
      Transaction(
        appId: appId ?? this.appId,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        sellPrice: sellPrice ?? this.sellPrice,
        sellTime: sellTime ?? this.sellTime,
        shortcode: shortcode ?? this.shortcode,
        transactionId: transactionId ?? this.transactionId,
      );
}
