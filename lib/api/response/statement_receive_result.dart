import 'package:meta/meta.dart';

import '../../basic_api/generated/statement_receive.dart';
import '../../basic_api/generated/statement_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Statement response model class
abstract class StatementResponseModel {
  /// Initializes
  StatementResponseModel({
    @required this.statement,
  });

  /// Account statement.
  final Statement statement;
}

/// Statement response class
class StatementResponse extends StatementResponseModel {
  /// Initializes
  StatementResponse({
    @required Statement statement,
  }) : super(
          statement: statement,
        );

  /// Creates an instance from JSON
  factory StatementResponse.fromJson(
    dynamic statementJson,
  ) =>
      StatementResponse(
        statement:
            statementJson == null ? null : Statement.fromJson(statementJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (statement != null) {
      resultMap['statement'] = statement.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Retrieves a summary of account transactions, according to given search criteria.
  ///
  /// For parameters information refer to [StatementRequest].
  /// Throws a [StatementException] if API response contains an error
  static Future<StatementResponse> fetch(StatementSend request) async {
    final StatementReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          StatementException(baseExceptionModel: baseExceptionModel),
    );

    return StatementResponse.fromJson(response.statement);
  }

  /// Creates a copy of instance with given parameters
  StatementResponse copyWith({
    Statement statement,
  }) =>
      StatementResponse(
        statement: statement ?? this.statement,
      );
}

final Map<String, ActionTypeEnum> actionTypeEnumMapper =
    <String, ActionTypeEnum>{
  "buy": ActionTypeEnum.buy,
  "sell": ActionTypeEnum.sell,
  "deposit": ActionTypeEnum.deposit,
  "withdrawal": ActionTypeEnum.withdrawal,
  "hold": ActionTypeEnum.hold,
  "release": ActionTypeEnum.release,
  "adjustment": ActionTypeEnum.adjustment,
  "virtual_credit": ActionTypeEnum.virtualCredit,
};

/// action_type Enum
enum ActionTypeEnum {
  buy,
  sell,
  deposit,
  withdrawal,
  hold,
  release,
  adjustment,
  virtualCredit,
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
  final List<TransactionsItem> transactions;
}

/// Statement class
class Statement extends StatementModel {
  /// Initializes
  Statement({
    @required double count,
    @required List<TransactionsItem> transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Creates an instance from JSON
  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        count: getDouble(json['count']),
        transactions: json['transactions'] == null
            ? null
            : List<TransactionsItem>.from(json['transactions']
                .map((dynamic item) => TransactionsItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['count'] = count;
    if (transactions != null) {
      resultMap['transactions'] = transactions
          .map<dynamic>((TransactionsItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Statement copyWith({
    double count,
    List<TransactionsItem> transactions,
  }) =>
      Statement(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );
}
/// Transactions item model class
abstract class TransactionsItemModel {
  /// Initializes
  TransactionsItemModel({
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
  final int appId;

  /// It is the remaining balance.
  final double balanceAfter;

  /// It is the contract ID.
  final int contractId;

  /// The description of contract purchased if description is set to `1`.
  final String longcode;

  /// Payout price
  final double payout;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime purchaseTime;

  /// Internal transaction identifier for the corresponding buy transaction ( set only for contract selling )
  final int referenceId;

  /// Compact description of the contract purchased if description is set to `1`.
  final String shortcode;

  /// It is the transaction ID. In statement every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// It is the time of transaction.
  final DateTime transactionTime;
}

/// Transactions item class
class TransactionsItem extends TransactionsItemModel {
  /// Initializes
  TransactionsItem({
    @required ActionTypeEnum actionType,
    @required double amount,
    int appId,
    @required double balanceAfter,
    int contractId,
    @required String longcode,
    double payout,
    @required DateTime purchaseTime,
    int referenceId,
    String shortcode,
    @required int transactionId,
    @required DateTime transactionTime,
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
  factory TransactionsItem.fromJson(Map<String, dynamic> json) =>
      TransactionsItem(
        actionType: actionTypeEnumMapper[json['action_type']],
        amount: getDouble(json['amount']),
        appId: json['app_id'],
        balanceAfter: getDouble(json['balance_after']),
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: getDateTime(json['purchase_time']),
        referenceId: json['reference_id'],
        shortcode: json['shortcode'],
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action_type'] = actionTypeEnumMapper.entries
        .firstWhere((entry) => entry.value == actionType, orElse: () => null)
        ?.key;
    resultMap['amount'] = amount;
    resultMap['app_id'] = appId;
    resultMap['balance_after'] = balanceAfter;
    resultMap['contract_id'] = contractId;
    resultMap['longcode'] = longcode;
    resultMap['payout'] = payout;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['reference_id'] = referenceId;
    resultMap['shortcode'] = shortcode;
    resultMap['transaction_id'] = transactionId;
    resultMap['transaction_time'] =
        getSecondsSinceEpochDateTime(transactionTime);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TransactionsItem copyWith({
    ActionTypeEnum actionType,
    double amount,
    int appId,
    double balanceAfter,
    int contractId,
    String longcode,
    double payout,
    DateTime purchaseTime,
    int referenceId,
    String shortcode,
    int transactionId,
    DateTime transactionTime,
  }) =>
      TransactionsItem(
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
}
