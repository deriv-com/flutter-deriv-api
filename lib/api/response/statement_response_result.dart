// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/statement_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/statement_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Statement response model class.
abstract class StatementResponseModel extends Equatable {
  /// Initializes Statement response model class .
  const StatementResponseModel({
    this.statement,
  });

  /// Account statement.
  final Statement? statement;
}

/// Statement response class.
class StatementResponse extends StatementResponseModel {
  /// Initializes Statement response class.
  const StatementResponse({
    Statement? statement,
  }) : super(
          statement: statement,
        );

  /// Creates an instance from JSON.
  factory StatementResponse.fromJson(
    dynamic statementJson,
  ) =>
      StatementResponse(
        statement:
            statementJson == null ? null : Statement.fromJson(statementJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (statement != null) {
      resultMap['statement'] = statement!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves a summary of account transactions, according to given search criteria.
  ///
  /// For parameters information refer to [StatementRequest].
  /// Throws a [StatementException] if API response contains an error
  static Future<StatementResponse> fetch(StatementRequest request) async {
    final StatementReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          StatementException(baseExceptionModel: baseExceptionModel),
    );

    return StatementResponse.fromJson(response.statement);
  }

  /// Creates a copy of instance with given parameters.
  StatementResponse copyWith({
    Statement? statement,
  }) =>
      StatementResponse(
        statement: statement ?? this.statement,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// ActionTypeEnum mapper.
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
  "transfer": ActionTypeEnum.transfer,
};

/// ActionType Enum.
enum ActionTypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,

  /// deposit.
  deposit,

  /// withdrawal.
  withdrawal,

  /// hold.
  hold,

  /// release.
  release,

  /// adjustment.
  adjustment,

  /// virtual_credit.
  virtualCredit,

  /// transfer.
  transfer,
}
/// Statement model class.
abstract class StatementModel extends Equatable {
  /// Initializes Statement model class .
  const StatementModel({
    this.count,
    this.transactions,
  });

  /// Number of transactions returned in this call
  final double? count;

  /// Array of returned transactions
  final List<TransactionsItem>? transactions;
}

/// Statement class.
class Statement extends StatementModel {
  /// Initializes Statement class.
  const Statement({
    double? count,
    List<TransactionsItem>? transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Creates an instance from JSON.
  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        count: getDouble(json['count']),
        transactions: json['transactions'] == null
            ? null
            : List<TransactionsItem>.from(
                json['transactions']?.map(
                  (dynamic item) => TransactionsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['count'] = count;
    if (transactions != null) {
      resultMap['transactions'] = transactions!
          .map<dynamic>(
            (TransactionsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Statement copyWith({
    double? count,
    List<TransactionsItem>? transactions,
  }) =>
      Statement(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Transactions item model class.
abstract class TransactionsItemModel extends Equatable {
  /// Initializes Transactions item model class .
  const TransactionsItemModel({
    this.actionType,
    this.amount,
    this.appId,
    this.balanceAfter,
    this.contractId,
    this.fees,
    this.from,
    this.longcode,
    this.payout,
    this.purchaseTime,
    this.referenceId,
    this.shortcode,
    this.to,
    this.transactionId,
    this.transactionTime,
    this.withdrawalDetails,
  });

  /// It is the type of action.
  final ActionTypeEnum? actionType;

  /// It is the amount of transaction.
  final double? amount;

  /// ID of the application where this contract was purchased.
  final int? appId;

  /// It is the remaining balance.
  final double? balanceAfter;

  /// It is the contract ID.
  final int? contractId;

  /// Contains details about fees used for transfer. It is present only when action type is transfer.
  final Fees? fees;

  /// Contains details of account from which amount was transferred. It is present only when action type is transfer.
  final From? from;

  /// The description of contract purchased if description is set to `1`.
  final String? longcode;

  /// Payout price
  final double? payout;

  /// Time at which contract was purchased, present only for sell transaction
  final DateTime? purchaseTime;

  /// Internal transaction identifier for the corresponding buy transaction ( set only for contract selling )
  final int? referenceId;

  /// Compact description of the contract purchased if description is set to `1`.
  final String? shortcode;

  /// Contains details of account to which amount was transferred. It is present only when action type is transfer.
  final To? to;

  /// It is the transaction ID. In statement every contract (buy or sell) and every payment has a unique ID.
  final int? transactionId;

  /// It is the time of transaction.
  final DateTime? transactionTime;

  /// Additional withdrawal details such as typical processing times, if description is set to `1`.
  final String? withdrawalDetails;
}

/// Transactions item class.
class TransactionsItem extends TransactionsItemModel {
  /// Initializes Transactions item class.
  const TransactionsItem({
    ActionTypeEnum? actionType,
    double? amount,
    int? appId,
    double? balanceAfter,
    int? contractId,
    Fees? fees,
    From? from,
    String? longcode,
    double? payout,
    DateTime? purchaseTime,
    int? referenceId,
    String? shortcode,
    To? to,
    int? transactionId,
    DateTime? transactionTime,
    String? withdrawalDetails,
  }) : super(
          actionType: actionType,
          amount: amount,
          appId: appId,
          balanceAfter: balanceAfter,
          contractId: contractId,
          fees: fees,
          from: from,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          referenceId: referenceId,
          shortcode: shortcode,
          to: to,
          transactionId: transactionId,
          transactionTime: transactionTime,
          withdrawalDetails: withdrawalDetails,
        );

  /// Creates an instance from JSON.
  factory TransactionsItem.fromJson(Map<String, dynamic> json) =>
      TransactionsItem(
        actionType: json['action_type'] == null
            ? null
            : actionTypeEnumMapper[json['action_type']],
        amount: getDouble(json['amount']),
        appId: json['app_id'],
        balanceAfter: getDouble(json['balance_after']),
        contractId: json['contract_id'],
        fees: json['fees'] == null ? null : Fees.fromJson(json['fees']),
        from: json['from'] == null ? null : From.fromJson(json['from']),
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: getDateTime(json['purchase_time']),
        referenceId: json['reference_id'],
        shortcode: json['shortcode'],
        to: json['to'] == null ? null : To.fromJson(json['to']),
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
        withdrawalDetails: json['withdrawal_details'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['action_type'] = actionTypeEnumMapper.entries
        .firstWhere((MapEntry<String, ActionTypeEnum> entry) =>
            entry.value == actionType)
        .key;
    resultMap['amount'] = amount;
    resultMap['app_id'] = appId;
    resultMap['balance_after'] = balanceAfter;
    resultMap['contract_id'] = contractId;
    if (fees != null) {
      resultMap['fees'] = fees!.toJson();
    }
    if (from != null) {
      resultMap['from'] = from!.toJson();
    }
    resultMap['longcode'] = longcode;
    resultMap['payout'] = payout;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['reference_id'] = referenceId;
    resultMap['shortcode'] = shortcode;
    if (to != null) {
      resultMap['to'] = to!.toJson();
    }
    resultMap['transaction_id'] = transactionId;
    resultMap['transaction_time'] =
        getSecondsSinceEpochDateTime(transactionTime);
    resultMap['withdrawal_details'] = withdrawalDetails;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TransactionsItem copyWith({
    ActionTypeEnum? actionType,
    double? amount,
    int? appId,
    double? balanceAfter,
    int? contractId,
    Fees? fees,
    From? from,
    String? longcode,
    double? payout,
    DateTime? purchaseTime,
    int? referenceId,
    String? shortcode,
    To? to,
    int? transactionId,
    DateTime? transactionTime,
    String? withdrawalDetails,
  }) =>
      TransactionsItem(
        actionType: actionType ?? this.actionType,
        amount: amount ?? this.amount,
        appId: appId ?? this.appId,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        fees: fees ?? this.fees,
        from: from ?? this.from,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        referenceId: referenceId ?? this.referenceId,
        shortcode: shortcode ?? this.shortcode,
        to: to ?? this.to,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
        withdrawalDetails: withdrawalDetails ?? this.withdrawalDetails,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Fees model class.
abstract class FeesModel extends Equatable {
  /// Initializes Fees model class .
  const FeesModel({
    this.amount,
    this.currency,
    this.minimum,
    this.percentage,
  });

  /// Fees amount
  final double? amount;

  /// Fees currency
  final String? currency;

  /// Minimum amount of fees
  final double? minimum;

  /// Fees percentage
  final double? percentage;
}

/// Fees class.
class Fees extends FeesModel {
  /// Initializes Fees class.
  const Fees({
    double? amount,
    String? currency,
    double? minimum,
    double? percentage,
  }) : super(
          amount: amount,
          currency: currency,
          minimum: minimum,
          percentage: percentage,
        );

  /// Creates an instance from JSON.
  factory Fees.fromJson(Map<String, dynamic> json) => Fees(
        amount: getDouble(json['amount']),
        currency: json['currency'],
        minimum: getDouble(json['minimum']),
        percentage: getDouble(json['percentage']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['amount'] = amount;
    resultMap['currency'] = currency;
    resultMap['minimum'] = minimum;
    resultMap['percentage'] = percentage;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Fees copyWith({
    double? amount,
    String? currency,
    double? minimum,
    double? percentage,
  }) =>
      Fees(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        minimum: minimum ?? this.minimum,
        percentage: percentage ?? this.percentage,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// From model class.
abstract class FromModel extends Equatable {
  /// Initializes From model class .
  const FromModel({
    this.loginid,
  });

  /// Login id of the account from which money was transferred.
  final String? loginid;
}

/// From class.
class From extends FromModel {
  /// Initializes From class.
  const From({
    String? loginid,
  }) : super(
          loginid: loginid,
        );

  /// Creates an instance from JSON.
  factory From.fromJson(Map<String, dynamic> json) => From(
        loginid: json['loginid'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['loginid'] = loginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  From copyWith({
    String? loginid,
  }) =>
      From(
        loginid: loginid ?? this.loginid,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// To model class.
abstract class ToModel extends Equatable {
  /// Initializes To model class .
  const ToModel({
    this.loginid,
  });

  /// Login id of the account to which money was transferred.
  final String? loginid;
}

/// To class.
class To extends ToModel {
  /// Initializes To class.
  const To({
    String? loginid,
  }) : super(
          loginid: loginid,
        );

  /// Creates an instance from JSON.
  factory To.fromJson(Map<String, dynamic> json) => To(
        loginid: json['loginid'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['loginid'] = loginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  To copyWith({
    String? loginid,
  }) =>
      To(
        loginid: loginid ?? this.loginid,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
