import 'package:meta/meta.dart';

import '../../basic_api/generated/forget_all_receive.dart';
import '../../basic_api/generated/forget_receive.dart';
import '../../basic_api/generated/transaction_receive.dart';
import '../../basic_api/generated/transaction_send.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import '../models/enums.dart';
import 'forget_all_receive_result.dart';
import 'forget_receive_result.dart';

/// Transaction response model class
abstract class TransactionResponseModel {
  /// Initializes
  TransactionResponseModel({
    @required this.subscription,
    @required this.transaction,
  });

  /// For subscription requests only.
  final Subscription subscription;

  /// Realtime stream of user transaction updates.
  final Transaction transaction;
}

/// Transaction response class
class TransactionResponse extends TransactionResponseModel {
  /// Initializes
  TransactionResponse({
    @required Transaction transaction,
    @required Subscription subscription,
  }) : super(
          transaction: transaction,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory TransactionResponse.fromJson(
    dynamic transactionJson,
    dynamic subscriptionJson,
  ) =>
      TransactionResponse(
        transaction: transactionJson == null
            ? null
            : Transaction.fromJson(transactionJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (transaction != null) {
      resultMap['transaction'] = transaction.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Subscribes to account's transactions
  ///
  /// Throws a [TransactionsException] if API response contains an error
  static Stream<TransactionResponse> subscribeTransactions({
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(
        request: const TransactionSend(),
        comparePredicate: comparePredicate,
      )
          .map<TransactionResponse>((Response response) {
        checkException(
          response: response,
          exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
              TransactionsException(baseExceptionModel: baseExceptionModel),
        );

        return response is TransactionReceive
            ? TransactionResponse.fromJson(
                response.transaction,
                response.subscription,
              )
            : null;
      });

  /// Unsubscribes from transaction subscription.
  ///
  /// Throws a [TransactionsException] if API response contains an error
  Future<ForgetResponse> unsubscribeTransaction() async {
    if (subscription?.id == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          TransactionsException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all transaction subscriptions.
  ///
  /// Throws a [TransactionsException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllTransaction() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.transaction);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          TransactionsException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters
  TransactionResponse copyWith({
    Transaction transaction,
    Subscription subscription,
  }) =>
      TransactionResponse(
        transaction: transaction ?? this.transaction,
        subscription: subscription ?? this.subscription,
      );
}

final Map<String, ActionEnum> actionEnumMapper = <String, ActionEnum>{
  "buy": ActionEnum.buy,
  "sell": ActionEnum.sell,
  "deposit": ActionEnum.deposit,
  "withdrawal": ActionEnum.withdrawal,
  "escrow": ActionEnum.escrow,
  "adjustment": ActionEnum.adjustment,
  "virtual_credit": ActionEnum.virtualCredit,
};

/// action Enum
enum ActionEnum {
  buy,
  sell,
  deposit,
  withdrawal,
  escrow,
  adjustment,
  virtualCredit,
}
/// Transaction model class
abstract class TransactionModel {
  /// Initializes
  TransactionModel({
    @required this.transactionTime,
    @required this.transactionId,
    @required this.symbol,
    @required this.purchaseTime,
    @required this.lowBarrier,
    @required this.longcode,
    @required this.id,
    @required this.displayName,
    @required this.dateExpiry,
    @required this.currency,
    @required this.barrier,
    @required this.balance,
    @required this.amount,
    @required this.action,
    this.contractId,
    this.highBarrier,
    this.stopLoss,
    this.stopOut,
    this.takeProfit,
  });

  /// Time at which transaction was performed: for buy it is purchase time, for sell it is sell time.
  final DateTime transactionTime;

  /// It is the transaction ID. Every contract (buy or sell) or payment has a unique ID.
  final int transactionId;

  /// Symbol code
  final String symbol;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime purchaseTime;

  /// The low barrier of a contract. Only applicable to double barrier contracts.
  final String lowBarrier;

  /// Description of contract purchased
  final String longcode;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Display name of symbol
  final String displayName;

  /// Epoch value of the expiry time of the contract. Please note that in case of buy transaction this is approximate value not exact one.
  final DateTime dateExpiry;

  /// Transaction currency
  final String currency;

  /// Barrier of the contract. Only applicable to single barrier contracts. Could be undefined if a contract does not have a barrier.
  final dynamic barrier;

  /// Balance amount
  final double balance;

  /// It is the amount of transaction performed.
  final double amount;

  /// The transaction type.
  final ActionEnum action;

  /// It is the contract ID.
  final int contractId;

  /// The high barrier of a contract. Only applicable to double barrier contracts.
  final dynamic highBarrier;

  /// The pip-sized target spot price where the contract will be closed automatically at the loss specified by the user.
  final String stopLoss;

  /// The pip-sized target spot price where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final String stopOut;

  /// The pip-sized target spot price where the contract will be closed automatically at the profit specified by the user.
  final String takeProfit;
}

/// Transaction class
class Transaction extends TransactionModel {
  /// Initializes
  Transaction({
    @required ActionEnum action,
    @required double amount,
    @required double balance,
    @required dynamic barrier,
    @required String currency,
    @required DateTime dateExpiry,
    @required String displayName,
    @required String id,
    @required String longcode,
    @required String lowBarrier,
    @required DateTime purchaseTime,
    @required String symbol,
    @required int transactionId,
    @required DateTime transactionTime,
    int contractId,
    dynamic highBarrier,
    String stopLoss,
    String stopOut,
    String takeProfit,
  }) : super(
          action: action,
          amount: amount,
          balance: balance,
          barrier: barrier,
          currency: currency,
          dateExpiry: dateExpiry,
          displayName: displayName,
          id: id,
          longcode: longcode,
          lowBarrier: lowBarrier,
          purchaseTime: purchaseTime,
          symbol: symbol,
          transactionId: transactionId,
          transactionTime: transactionTime,
          contractId: contractId,
          highBarrier: highBarrier,
          stopLoss: stopLoss,
          stopOut: stopOut,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        action: actionEnumMapper[json['action']],
        amount: getDouble(json['amount']),
        balance: getDouble(json['balance']),
        barrier: json['barrier'],
        currency: json['currency'],
        dateExpiry: getDateTime(json['date_expiry']),
        displayName: json['display_name'],
        id: json['id'],
        longcode: json['longcode'],
        lowBarrier: json['low_barrier'],
        purchaseTime: getDateTime(json['purchase_time']),
        symbol: json['symbol'],
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
        contractId: json['contract_id'],
        highBarrier: json['high_barrier'],
        stopLoss: json['stop_loss'],
        stopOut: json['stop_out'],
        takeProfit: json['take_profit'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action'] = actionEnumMapper.entries
        .firstWhere((entry) => entry.value == action, orElse: () => null)
        ?.key;
    resultMap['amount'] = amount;
    resultMap['balance'] = balance;
    resultMap['barrier'] = barrier;
    resultMap['currency'] = currency;
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);
    resultMap['display_name'] = displayName;
    resultMap['id'] = id;
    resultMap['longcode'] = longcode;
    resultMap['low_barrier'] = lowBarrier;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['symbol'] = symbol;
    resultMap['transaction_id'] = transactionId;
    resultMap['transaction_time'] =
        getSecondsSinceEpochDateTime(transactionTime);
    resultMap['contract_id'] = contractId;
    resultMap['high_barrier'] = highBarrier;
    resultMap['stop_loss'] = stopLoss;
    resultMap['stop_out'] = stopOut;
    resultMap['take_profit'] = takeProfit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Transaction copyWith({
    ActionEnum action,
    double amount,
    double balance,
    dynamic barrier,
    String currency,
    DateTime dateExpiry,
    String displayName,
    String id,
    String longcode,
    String lowBarrier,
    DateTime purchaseTime,
    String symbol,
    int transactionId,
    DateTime transactionTime,
    int contractId,
    dynamic highBarrier,
    String stopLoss,
    String stopOut,
    String takeProfit,
  }) =>
      Transaction(
        action: action ?? this.action,
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        barrier: barrier ?? this.barrier,
        currency: currency ?? this.currency,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        displayName: displayName ?? this.displayName,
        id: id ?? this.id,
        longcode: longcode ?? this.longcode,
        lowBarrier: lowBarrier ?? this.lowBarrier,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        symbol: symbol ?? this.symbol,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
        contractId: contractId ?? this.contractId,
        highBarrier: highBarrier ?? this.highBarrier,
        stopLoss: stopLoss ?? this.stopLoss,
        stopOut: stopOut ?? this.stopOut,
        takeProfit: takeProfit ?? this.takeProfit,
      );
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
