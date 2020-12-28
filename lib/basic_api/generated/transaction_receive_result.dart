/// Transaction receive model class
abstract class TransactionReceiveModel {
  /// Initializes
  TransactionReceiveModel({
    @required this.transaction,
    @required this.subscription,
  });

  /// Realtime stream of user transaction updates.
  final Transaction transaction;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Transaction receive class
class TransactionReceive extends TransactionReceiveModel {
  /// Initializes
  TransactionReceive({
    @required Transaction transaction,
    @required Subscription subscription,
  }) : super(
          transaction: transaction,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory TransactionReceive.fromJson(Map<String, dynamic> json) =>
      TransactionReceive(
        transaction: json['transaction'] == null
            ? null
            : Transaction.fromJson(json['transaction']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (transaction != null) {
      result['transaction'] = transaction.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TransactionReceive copyWith({
    Transaction transaction,
    Subscription subscription,
  }) =>
      TransactionReceive(
        transaction: transaction ?? this.transaction,
        subscription: subscription ?? this.subscription,
      );
}
/// Transaction model class
abstract class TransactionModel {
  /// Initializes
  TransactionModel({
    @required this.action,
    @required this.amount,
    @required this.balance,
    @required this.barrier,
    this.contractId,
    @required this.currency,
    @required this.dateExpiry,
    @required this.displayName,
    this.highBarrier,
    @required this.id,
    @required this.longcode,
    @required this.lowBarrier,
    @required this.purchaseTime,
    this.stopLoss,
    this.stopOut,
    @required this.symbol,
    this.takeProfit,
    @required this.transactionId,
    @required this.transactionTime,
  });

  /// The transaction type.
  final ActionEnum action;

  /// It is the amount of transaction performed.
  final double amount;

  /// Balance amount
  final double balance;

  /// Barrier of the contract. Only applicable to single barrier contracts. Could be undefined if a contract does not have a barrier.
  final double barrier;

  /// It is the contract ID.
  final double contractId;

  /// Transaction currency
  final String currency;

  /// Epoch value of the expiry time of the contract. Please note that in case of buy transaction this is approximate value not exact one.
  final int dateExpiry;

  /// Display name of symbol
  final String displayName;

  /// The high barrier of a contract. Only applicable to double barrier contracts.
  final double highBarrier;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Description of contract purchased
  final String longcode;

  /// The low barrier of a contract. Only applicable to double barrier contracts.
  final String lowBarrier;

  /// Time at which contract was purchased, present only for sell transaction
  final int purchaseTime;

  /// The pip-sized target spot price where the contract will be closed automatically at the loss specified by the user.
  final UNKNOWN_TYPE stopLoss;

  /// The pip-sized target spot price where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final UNKNOWN_TYPE stopOut;

  /// Symbol code
  final String symbol;

  /// The pip-sized target spot price where the contract will be closed automatically at the profit specified by the user.
  final UNKNOWN_TYPE takeProfit;

  /// It is the transaction ID. Every contract (buy or sell) or payment has a unique ID.
  final int transactionId;

  /// Time at which transaction was performed: for buy it is purchase time, for sell it is sell time.
  final int transactionTime;
}

/// Transaction class
class Transaction extends TransactionModel {
  /// Initializes
  Transaction({
    @required String action,
    @required double amount,
    @required double balance,
    @required double barrier,
    double contractId,
    @required String currency,
    @required int dateExpiry,
    @required String displayName,
    double highBarrier,
    @required String id,
    @required String longcode,
    @required String lowBarrier,
    @required int purchaseTime,
    UNKNOWN_TYPE stopLoss,
    UNKNOWN_TYPE stopOut,
    @required String symbol,
    UNKNOWN_TYPE takeProfit,
    @required int transactionId,
    @required int transactionTime,
  }) : super(
          action: action,
          amount: amount,
          balance: balance,
          barrier: barrier,
          contractId: contractId,
          currency: currency,
          dateExpiry: dateExpiry,
          displayName: displayName,
          highBarrier: highBarrier,
          id: id,
          longcode: longcode,
          lowBarrier: lowBarrier,
          purchaseTime: purchaseTime,
          stopLoss: stopLoss,
          stopOut: stopOut,
          symbol: symbol,
          takeProfit: takeProfit,
          transactionId: transactionId,
          transactionTime: transactionTime,
        );

  /// Creates an instance from JSON
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        action: json['action'] == null
            ? null
            : actionEnumMapper.entries
                .firstWhere((entry) => entry.value == json['action'],
                    orElse: () => null)
                ?.key,
        amount: getDouble(json['amount']),
        balance: getDouble(json['balance']),
        barrier: getDouble(json['barrier']),
        contractId: getDouble(json['contract_id']),
        currency: json['currency'],
        dateExpiry: json['date_expiry'],
        displayName: json['display_name'],
        highBarrier: getDouble(json['high_barrier']),
        id: json['id'],
        longcode: json['longcode'],
        lowBarrier: json['low_barrier'],
        purchaseTime: json['purchase_time'],
        stopLoss: json['stop_loss'],
        stopOut: json['stop_out'],
        symbol: json['symbol'],
        takeProfit: json['take_profit'],
        transactionId: json['transaction_id'],
        transactionTime: json['transaction_time'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['action'] = actionEnumMapper[action];
    result['amount'] = amount;
    result['balance'] = balance;
    result['barrier'] = barrier;
    result['contract_id'] = contractId;
    result['currency'] = currency;
    result['date_expiry'] = dateExpiry;
    result['display_name'] = displayName;
    result['high_barrier'] = highBarrier;
    result['id'] = id;
    result['longcode'] = longcode;
    result['low_barrier'] = lowBarrier;
    result['purchase_time'] = purchaseTime;
    result['stop_loss'] = stopLoss;
    result['stop_out'] = stopOut;
    result['symbol'] = symbol;
    result['take_profit'] = takeProfit;
    result['transaction_id'] = transactionId;
    result['transaction_time'] = transactionTime;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Transaction copyWith({
    String action,
    double amount,
    double balance,
    double barrier,
    double contractId,
    String currency,
    int dateExpiry,
    String displayName,
    double highBarrier,
    String id,
    String longcode,
    String lowBarrier,
    int purchaseTime,
    UNKNOWN_TYPE stopLoss,
    UNKNOWN_TYPE stopOut,
    String symbol,
    UNKNOWN_TYPE takeProfit,
    int transactionId,
    int transactionTime,
  }) =>
      Transaction(
        action: action ?? this.action,
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        barrier: barrier ?? this.barrier,
        contractId: contractId ?? this.contractId,
        currency: currency ?? this.currency,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        displayName: displayName ?? this.displayName,
        highBarrier: highBarrier ?? this.highBarrier,
        id: id ?? this.id,
        longcode: longcode ?? this.longcode,
        lowBarrier: lowBarrier ?? this.lowBarrier,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        stopLoss: stopLoss ?? this.stopLoss,
        stopOut: stopOut ?? this.stopOut,
        symbol: symbol ?? this.symbol,
        takeProfit: takeProfit ?? this.takeProfit,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
      );
  // Creating Enum Mappers
  static final Map<ActionEnum, String> actionEnumMapper = {
    ActionEnum.buy: 'buy',
    ActionEnum.sell: 'sell',
    ActionEnum.deposit: 'deposit',
    ActionEnum.withdrawal: 'withdrawal',
    ActionEnum.escrow: 'escrow',
    ActionEnum.adjustment: 'adjustment',
    ActionEnum.virtual_credit: 'virtual_credit',
  };
}

// Creating Enums
enum ActionEnum {
  buy,
  sell,
  deposit,
  withdrawal,
  escrow,
  adjustment,
  virtual_credit,
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
