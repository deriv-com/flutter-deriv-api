// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/transaction_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/transaction_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Transaction response model class.
abstract class TransactionResponseModel extends Equatable {
  /// Initializes Transaction response model class .
  const TransactionResponseModel({
    this.transaction,
    this.subscription,
  });

  /// Realtime stream of user transaction updates.
  final Transaction? transaction;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// Transaction response class.
class TransactionResponse extends TransactionResponseModel {
  /// Initializes Transaction response class.
  const TransactionResponse({
    Transaction? transaction,
    Subscription? subscription,
  }) : super(
          transaction: transaction,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
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

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (transaction != null) {
      resultMap['transaction'] = transaction!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Subscribes to account's transactions
  ///
  /// Throws a [TransactionsException] if API response contains an error
  static Stream<TransactionResponse?> subscribeTransactions({
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(
        request: const TransactionRequest(),
        comparePredicate: comparePredicate,
      )!
          .map<TransactionResponse?>((Response response) {
        checkException(
          response: response,
          exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
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
  Future<ForgetResponse?> unsubscribeTransaction() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
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
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TransactionsException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters.
  TransactionResponse copyWith({
    Transaction? transaction,
    Subscription? subscription,
  }) =>
      TransactionResponse(
        transaction: transaction ?? this.transaction,
        subscription: subscription ?? this.subscription,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}

/// ActionEnum mapper.
final Map<String, ActionEnum> actionEnumMapper = <String, ActionEnum>{
  "buy": ActionEnum.buy,
  "sell": ActionEnum.sell,
  "deposit": ActionEnum.deposit,
  "withdrawal": ActionEnum.withdrawal,
  "escrow": ActionEnum.escrow,
  "adjustment": ActionEnum.adjustment,
  "virtual_credit": ActionEnum.virtualCredit,
  "transfer": ActionEnum.transfer,
};

/// Action Enum.
enum ActionEnum {
  /// buy.
  buy,

  /// sell.
  sell,

  /// deposit.
  deposit,

  /// withdrawal.
  withdrawal,

  /// escrow.
  escrow,

  /// adjustment.
  adjustment,

  /// virtual_credit.
  virtualCredit,

  /// transfer.
  transfer,
}
/// Transaction model class.
abstract class TransactionModel extends Equatable {
  /// Initializes Transaction model class .
  const TransactionModel({
    this.action,
    this.amount,
    this.balance,
    this.barrier,
    this.contractId,
    this.currency,
    this.dateExpiry,
    this.displayName,
    this.highBarrier,
    this.id,
    this.longcode,
    this.lowBarrier,
    this.purchaseTime,
    this.stopLoss,
    this.stopOut,
    this.symbol,
    this.takeProfit,
    this.transactionId,
    this.transactionTime,
  });

  /// The transaction type.
  final ActionEnum? action;

  /// It is the amount of transaction performed.
  final double? amount;

  /// Balance amount
  final double? balance;

  /// Barrier of the contract. Only applicable to single barrier contracts. Could be undefined if a contract does not have a barrier.
  final dynamic barrier;

  /// It is the contract ID.
  final int? contractId;

  /// Transaction currency
  final String? currency;

  /// Epoch value of the expiry time of the contract. Please note that in case of buy transaction this is approximate value not exact one.
  final DateTime? dateExpiry;

  /// Display name of symbol
  final String? displayName;

  /// The high barrier of a contract. Only applicable to double barrier contracts.
  final dynamic highBarrier;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String? id;

  /// Description of contract purchased
  final String? longcode;

  /// The low barrier of a contract. Only applicable to double barrier contracts.
  final String? lowBarrier;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime? purchaseTime;

  /// The pip-sized target spot price where the contract will be closed automatically at the loss specified by the user.
  final String? stopLoss;

  /// The pip-sized target spot price where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final String? stopOut;

  /// Symbol code
  final String? symbol;

  /// The pip-sized target spot price where the contract will be closed automatically at the profit specified by the user.
  final String? takeProfit;

  /// It is the transaction ID. Every contract (buy or sell) or payment has a unique ID.
  final int? transactionId;

  /// Time at which transaction was performed: for buy it is purchase time, for sell it is sell time.
  final DateTime? transactionTime;
}

/// Transaction class.
class Transaction extends TransactionModel {
  /// Initializes Transaction class.
  const Transaction({
    ActionEnum? action,
    double? amount,
    double? balance,
    dynamic barrier,
    int? contractId,
    String? currency,
    DateTime? dateExpiry,
    String? displayName,
    dynamic highBarrier,
    String? id,
    String? longcode,
    String? lowBarrier,
    DateTime? purchaseTime,
    String? stopLoss,
    String? stopOut,
    String? symbol,
    String? takeProfit,
    int? transactionId,
    DateTime? transactionTime,
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

  /// Creates an instance from JSON.
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        action:
            json['action'] == null ? null : actionEnumMapper[json['action']],
        amount: getDouble(json['amount']),
        balance: getDouble(json['balance']),
        barrier: json['barrier'],
        contractId: json['contract_id'],
        currency: json['currency'],
        dateExpiry: getDateTime(json['date_expiry']),
        displayName: json['display_name'],
        highBarrier: json['high_barrier'],
        id: json['id'],
        longcode: json['longcode'],
        lowBarrier: json['low_barrier'],
        purchaseTime: getDateTime(json['purchase_time']),
        stopLoss: json['stop_loss'],
        stopOut: json['stop_out'],
        symbol: json['symbol'],
        takeProfit: json['take_profit'],
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action'] = actionEnumMapper.entries
        .firstWhere(
            (MapEntry<String, ActionEnum> entry) => entry.value == action)
        .key;
    resultMap['amount'] = amount;
    resultMap['balance'] = balance;
    resultMap['barrier'] = barrier;
    resultMap['contract_id'] = contractId;
    resultMap['currency'] = currency;
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);
    resultMap['display_name'] = displayName;
    resultMap['high_barrier'] = highBarrier;
    resultMap['id'] = id;
    resultMap['longcode'] = longcode;
    resultMap['low_barrier'] = lowBarrier;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['stop_loss'] = stopLoss;
    resultMap['stop_out'] = stopOut;
    resultMap['symbol'] = symbol;
    resultMap['take_profit'] = takeProfit;
    resultMap['transaction_id'] = transactionId;
    resultMap['transaction_time'] =
        getSecondsSinceEpochDateTime(transactionTime);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Transaction copyWith({
    ActionEnum? action,
    double? amount,
    double? balance,
    dynamic barrier,
    int? contractId,
    String? currency,
    DateTime? dateExpiry,
    String? displayName,
    dynamic highBarrier,
    String? id,
    String? longcode,
    String? lowBarrier,
    DateTime? purchaseTime,
    String? stopLoss,
    String? stopOut,
    String? symbol,
    String? takeProfit,
    int? transactionId,
    DateTime? transactionTime,
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

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
/// Subscription model class.
abstract class SubscriptionModel extends Equatable {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    required String id,
  }) =>
      Subscription(
        id: id,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
