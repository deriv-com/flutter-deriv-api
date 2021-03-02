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
    @required this.transactions,
    @required this.count,
  });

  /// Array of returned transactions
  final List<TransactionsItem> transactions;

  /// Number of transactions returned in this call
  final double count;
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
    @required this.withdrawalDetails,
    @required this.transactionTime,
    @required this.transactionId,
    @required this.purchaseTime,
    @required this.longcode,
    @required this.balanceAfter,
    @required this.amount,
    @required this.actionType,
    this.appId,
    this.contractId,
    this.payout,
    this.referenceId,
    this.shortcode,
  });

  /// Additional withdrawal details such as typical processing times, if description is set to `1`.
  final String withdrawalDetails;

  /// It is the time of transaction.
  final DateTime transactionTime;

  /// It is the transaction ID. In statement every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime purchaseTime;

  /// The description of contract purchased if description is set to `1`.
  final String longcode;

  /// It is the remaining balance.
  final double balanceAfter;

  /// It is the amount of transaction.
  final double amount;

  /// It is the type of action.
  final ActionTypeEnum actionType;

  /// ID of the application where this contract was purchased.
  final int appId;

  /// It is the contract ID.
  final int contractId;

  /// Payout price
  final double payout;

  /// Internal transaction identifier for the corresponding buy transaction ( set only for contract selling )
  final int referenceId;

  /// Compact description of the contract purchased if description is set to `1`.
  final String shortcode;
}

/// Transactions item class
class TransactionsItem extends TransactionsItemModel {
  /// Initializes
  TransactionsItem({
    @required ActionTypeEnum actionType,
    @required double amount,
    @required double balanceAfter,
    @required String longcode,
    @required DateTime purchaseTime,
    @required int transactionId,
    @required DateTime transactionTime,
    @required String withdrawalDetails,
    int appId,
    int contractId,
    double payout,
    int referenceId,
    String shortcode,
  }) : super(
          actionType: actionType,
          amount: amount,
          balanceAfter: balanceAfter,
          longcode: longcode,
          purchaseTime: purchaseTime,
          transactionId: transactionId,
          transactionTime: transactionTime,
          withdrawalDetails: withdrawalDetails,
          appId: appId,
          contractId: contractId,
          payout: payout,
          referenceId: referenceId,
          shortcode: shortcode,
        );

  /// Creates an instance from JSON
  factory TransactionsItem.fromJson(Map<String, dynamic> json) =>
      TransactionsItem(
        actionType: actionTypeEnumMapper[json['action_type']],
        amount: getDouble(json['amount']),
        balanceAfter: getDouble(json['balance_after']),
        longcode: json['longcode'],
        purchaseTime: getDateTime(json['purchase_time']),
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
        withdrawalDetails: json['withdrawal_details'],
        appId: json['app_id'],
        contractId: json['contract_id'],
        payout: getDouble(json['payout']),
        referenceId: json['reference_id'],
        shortcode: json['shortcode'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action_type'] = actionTypeEnumMapper.entries
        .firstWhere((entry) => entry.value == actionType, orElse: () => null)
        ?.key;
    resultMap['amount'] = amount;
    resultMap['balance_after'] = balanceAfter;
    resultMap['longcode'] = longcode;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['transaction_id'] = transactionId;
    resultMap['transaction_time'] =
        getSecondsSinceEpochDateTime(transactionTime);
    resultMap['withdrawal_details'] = withdrawalDetails;
    resultMap['app_id'] = appId;
    resultMap['contract_id'] = contractId;
    resultMap['payout'] = payout;
    resultMap['reference_id'] = referenceId;
    resultMap['shortcode'] = shortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TransactionsItem copyWith({
    ActionTypeEnum actionType,
    double amount,
    double balanceAfter,
    String longcode,
    DateTime purchaseTime,
    int transactionId,
    DateTime transactionTime,
    String withdrawalDetails,
    int appId,
    int contractId,
    double payout,
    int referenceId,
    String shortcode,
  }) =>
      TransactionsItem(
        actionType: actionType ?? this.actionType,
        amount: amount ?? this.amount,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        longcode: longcode ?? this.longcode,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
        withdrawalDetails: withdrawalDetails ?? this.withdrawalDetails,
        appId: appId ?? this.appId,
        contractId: contractId ?? this.contractId,
        payout: payout ?? this.payout,
        referenceId: referenceId ?? this.referenceId,
        shortcode: shortcode ?? this.shortcode,
      );
}
