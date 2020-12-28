/// Statement receive model class
abstract class StatementReceiveModel {
  /// Initializes
  StatementReceiveModel({
    @required this.statement,
  });

  /// Account statement.
  final Statement statement;
}

/// Statement receive class
class StatementReceive extends StatementReceiveModel {
  /// Initializes
  StatementReceive({
    @required Statement statement,
  }) : super(
          statement: statement,
        );

  /// Creates an instance from JSON
  factory StatementReceive.fromJson(Map<String, dynamic> json) =>
      StatementReceive(
        statement: json['statement'] == null
            ? null
            : Statement.fromJson(json['statement']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (statement != null) {
      result['statement'] = statement.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  StatementReceive copyWith({
    Statement statement,
  }) =>
      StatementReceive(
        statement: statement ?? this.statement,
      );
}
/// Statement model class
abstract class StatementModel {
  /// Initializes
  StatementModel({
    @required this.count,
    @required this.transactions,
  });

  /// Number of transactions returned in this call
  final double count;

  /// Array of returned transactions
  final List<Transaction> transactions;
}

/// Statement class
class Statement extends StatementModel {
  /// Initializes
  Statement({
    @required double count,
    @required List<Transaction> transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Creates an instance from JSON
  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
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
  Statement copyWith({
    double count,
    List<Transaction> transactions,
  }) =>
      Statement(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );
}
/// Transaction model class
abstract class TransactionModel {
  /// Initializes
  TransactionModel({
    @required this.actionType,
    @required this.amount,
    this.appId,
    @required this.balanceAfter,
    this.contractId,
    @required this.longcode,
    this.payout,
    @required this.purchaseTime,
    this.referenceId,
    this.shortcode,
    @required this.transactionId,
    @required this.transactionTime,
  });

  /// It is the type of action.
  final ActionTypeEnum actionType;

  /// It is the amount of transaction.
  final double amount;

  /// ID of the application where this contract was purchased.
  final double appId;

  /// It is the remaining balance.
  final double balanceAfter;

  /// It is the contract ID.
  final double contractId;

  /// The description of contract purchased if description is set to `1`.
  final String longcode;

  /// Payout price
  final double payout;

  /// Time at which contract was purchased, present only for sell transaction
  final int purchaseTime;

  /// Internal transaction identifier for the corresponding buy transaction ( set only for contract selling )
  final double referenceId;

  /// Compact description of the contract purchased if description is set to `1`.
  final UNKNOWN_TYPE shortcode;

  /// It is the transaction ID. In statement every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// It is the time of transaction.
  final int transactionTime;
}

/// Transaction class
class Transaction extends TransactionModel {
  /// Initializes
  Transaction({
    @required String actionType,
    @required double amount,
    double appId,
    @required double balanceAfter,
    double contractId,
    @required String longcode,
    double payout,
    @required int purchaseTime,
    double referenceId,
    UNKNOWN_TYPE shortcode,
    @required int transactionId,
    @required int transactionTime,
  }) : super(
          actionType: actionType,
          amount: amount,
          appId: appId,
          balanceAfter: balanceAfter,
          contractId: contractId,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          referenceId: referenceId,
          shortcode: shortcode,
          transactionId: transactionId,
          transactionTime: transactionTime,
        );

  /// Creates an instance from JSON
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        actionType: json['action_type'] == null
            ? null
            : actionTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['action_type'],
                    orElse: () => null)
                ?.key,
        amount: getDouble(json['amount']),
        appId: getDouble(json['app_id']),
        balanceAfter: getDouble(json['balance_after']),
        contractId: getDouble(json['contract_id']),
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: json['purchase_time'],
        referenceId: getDouble(json['reference_id']),
        shortcode: json['shortcode'],
        transactionId: json['transaction_id'],
        transactionTime: json['transaction_time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['action_type'] = actionTypeEnumMapper[actionType];
    result['amount'] = amount;
    result['app_id'] = appId;
    result['balance_after'] = balanceAfter;
    result['contract_id'] = contractId;
    result['longcode'] = longcode;
    result['payout'] = payout;
    result['purchase_time'] = purchaseTime;
    result['reference_id'] = referenceId;
    result['shortcode'] = shortcode;
    result['transaction_id'] = transactionId;
    result['transaction_time'] = transactionTime;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Transaction copyWith({
    String actionType,
    double amount,
    double appId,
    double balanceAfter,
    double contractId,
    String longcode,
    double payout,
    int purchaseTime,
    double referenceId,
    UNKNOWN_TYPE shortcode,
    int transactionId,
    int transactionTime,
  }) =>
      Transaction(
        actionType: actionType ?? this.actionType,
        amount: amount ?? this.amount,
        appId: appId ?? this.appId,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        referenceId: referenceId ?? this.referenceId,
        shortcode: shortcode ?? this.shortcode,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
      );
  // Creating Enum Mappers
  static final Map<ActionTypeEnum, String> actionTypeEnumMapper = {
    ActionTypeEnum.buy: 'buy',
    ActionTypeEnum.sell: 'sell',
    ActionTypeEnum.deposit: 'deposit',
    ActionTypeEnum.withdrawal: 'withdrawal',
    ActionTypeEnum.hold: 'hold',
    ActionTypeEnum.release: 'release',
    ActionTypeEnum.adjustment: 'adjustment',
    ActionTypeEnum.virtual_credit: 'virtual_credit',
  };
}

// Creating Enums
enum ActionTypeEnum {
  buy,
  sell,
  deposit,
  withdrawal,
  hold,
  release,
  adjustment,
  virtual_credit,
}
