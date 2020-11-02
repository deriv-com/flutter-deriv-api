import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/contract/models/transaction_model.dart';
import 'package:flutter_deriv_api/api/contract/transaction/exceptions/transactions_exception.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Transaction of user
class Transaction extends TransactionModel {
  /// Initializes
  Transaction({
    TransactionActionType action,
    double amount,
    double balance,
    String barrier,
    String contractId,
    String currency,
    DateTime dateExpiry,
    String displayName,
    String highBarrier,
    String id,
    String longCode,
    String lowBarrier,
    DateTime purchaseTime,
    String stopLoss,
    String stopOut,
    String symbol,
    String takeProfit,
    int transactionId,
    DateTime transactionTime,
    this.subscriptionInformation,
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
          longCode: longCode,
          lowBarrier: lowBarrier,
          purchaseTime: purchaseTime,
          stopLoss: stopLoss,
          stopOut: stopOut,
          symbol: symbol,
          takeProfit: takeProfit,
          transactionId: transactionId,
          transactionTime: transactionTime,
        );

  /// Generates an instance from JSON
  factory Transaction.fromJson(
    Map<String, dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      Transaction(
        action: getEnumFromString(
          values: TransactionActionType.values,
          name: json['action'],
        ),
        amount: json['amount']?.toDouble(),
        balance: json['balance'],
        barrier: json['barrier'],
        contractId: json['contract_id']?.toString(),
        currency: json['currency'],
        dateExpiry: getDateTime(json['date_expiry']),
        displayName: json['display_name'],
        highBarrier: json['high_barrier'],
        id: json['id'],
        longCode: json['longcode'],
        lowBarrier: json['low_barrier'],
        purchaseTime: getDateTime(json['purchase_time']),
        stopLoss: json['stop_loss'],
        stopOut: json['stop_out'],
        symbol: json['symbol'],
        takeProfit: json['take_profit'],
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// Subscription information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Subscribes to account's transactions
  ///
  /// Throws a [TransactionsException] if API response contains an error
  static Stream<Transaction> subscribeTransactions() => _api
          .subscribe(request: const TransactionRequest())
          .map<Transaction>((Response response) {
        checkException(
          response: response,
          exceptionCreator: ({BaseException baseException}) =>
              TransactionsException(
                  code: baseException.code, message: baseException.message),
        );

        return response is TransactionResponse
            ? Transaction.fromJson(
                response.transaction,
                subscriptionJson: response.subscription,
              )
            : null;
      });

  /// Unsubscribes from transaction subscription.
  ///
  /// Throws a [TransactionsException] if API response contains an error
  Future<Forget> unsubscribeTransaction() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseException baseException}) =>
          TransactionsException(
              code: baseException.code, message: baseException.message),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes all transaction subscriptions.
  ///
  /// Throws a [TransactionsException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllTransaction() async {
    final ForgetAllResponse response =
        await _api.unsubscribeAll(method: ForgetStreamType.transaction);

    checkException(
      response: response,
      exceptionCreator: ({BaseException baseException}) =>
          TransactionsException(
              code: baseException.code, message: baseException.message),
    );

    return ForgetAll.fromResponse(response);
  }

  /// Generates a copy of instance with given parameters
  TransactionModel copyWith({
    TransactionActionType action,
    double amount,
    double balance,
    String barrier,
    String contractId,
    String currency,
    DateTime dateExpiry,
    String displayName,
    String highBarrier,
    String id,
    String longCode,
    String lowBarrier,
    DateTime purchaseTime,
    String stopLoss,
    String stopOut,
    String symbol,
    String takeProfit,
    int transactionId,
    DateTime transactionTime,
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
          longCode: longCode ?? this.longCode,
          lowBarrier: lowBarrier ?? this.lowBarrier,
          purchaseTime: purchaseTime ?? this.purchaseTime,
          stopLoss: stopLoss ?? this.stopLoss,
          stopOut: stopOut ?? this.stopOut,
          symbol: symbol ?? this.symbol,
          takeProfit: takeProfit ?? this.takeProfit,
          transactionId: transactionId ?? this.transactionId,
          transactionTime: transactionTime ?? this.transactionTime);
}
