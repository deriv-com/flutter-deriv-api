import 'package:meta/meta.dart';

import '../../basic_api/generated/profit_table_receive.dart';
import '../../basic_api/generated/profit_table_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Profit table response model class
abstract class ProfitTableResponseModel {
  /// Initializes
  ProfitTableResponseModel({
    @required this.profitTable,
  });

  /// Account Profit Table.
  final ProfitTable profitTable;
}

/// Profit table response class
class ProfitTableResponse extends ProfitTableResponseModel {
  /// Initializes
  ProfitTableResponse({
    @required ProfitTable profitTable,
  }) : super(
          profitTable: profitTable,
        );

  /// Creates an instance from JSON
  factory ProfitTableResponse.fromJson(
    dynamic profitTableJson,
  ) =>
      ProfitTableResponse(
        profitTable: profitTableJson == null
            ? null
            : ProfitTable.fromJson(profitTableJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (profitTable != null) {
      resultMap['profit_table'] = profitTable.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Retrieves a summary of account Profit Table, according to given search criteria.
  ///
  /// For parameters information refer to [ProfitTableRequest].
  /// Throws a [ProfitTableException] if API response contains an error
  static Future<ProfitTableResponse> fetch(ProfitTableSend request) async {
    final ProfitTableReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ProfitTableException(baseExceptionModel: baseExceptionModel),
    );

    return ProfitTableResponse.fromJson(response.profitTable);
  }

  /// Creates a copy of instance with given parameters
  ProfitTableResponse copyWith({
    ProfitTable profitTable,
  }) =>
      ProfitTableResponse(
        profitTable: profitTable ?? this.profitTable,
      );
}
/// Profit table model class
abstract class ProfitTableModel {
  /// Initializes
  ProfitTableModel({
    @required this.transactions,
    @required this.count,
  });

  /// Array of returned transactions
  final List<TransactionsItem> transactions;

  /// Number of transactions returned in this call
  final double count;
}

/// Profit table class
class ProfitTable extends ProfitTableModel {
  /// Initializes
  ProfitTable({
    @required double count,
    @required List<TransactionsItem> transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Creates an instance from JSON
  factory ProfitTable.fromJson(Map<String, dynamic> json) => ProfitTable(
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
  ProfitTable copyWith({
    double count,
    List<TransactionsItem> transactions,
  }) =>
      ProfitTable(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );
}
/// Transactions item model class
abstract class TransactionsItemModel {
  /// Initializes
  TransactionsItemModel({
    @required this.transactionId,
    @required this.shortcode,
    @required this.sellPrice,
    @required this.purchaseTime,
    @required this.payout,
    @required this.longcode,
    @required this.buyPrice,
    this.appId,
    this.contractId,
    this.sellTime,
  });

  /// The transaction Identifier. Every contract (buy or sell) and every payment has a unique transaction identifier.
  final int transactionId;

  /// Compact description of the contract purchased if description is set to 1
  final String shortcode;

  /// The price the contract sold for.
  final double sellPrice;

  /// Epoch purchase time of the transaction
  final DateTime purchaseTime;

  /// Payout price
  final double payout;

  /// The description of contract purchased if description is set to 1
  final String longcode;

  /// The buy price
  final double buyPrice;

  /// ID of the application where this contract was purchased.
  final int appId;

  /// The unique contract identifier.
  final int contractId;

  /// Epoch sell time of the transaction
  final DateTime sellTime;
}

/// Transactions item class
class TransactionsItem extends TransactionsItemModel {
  /// Initializes
  TransactionsItem({
    @required double buyPrice,
    @required String longcode,
    @required double payout,
    @required DateTime purchaseTime,
    @required double sellPrice,
    @required String shortcode,
    @required int transactionId,
    int appId,
    int contractId,
    DateTime sellTime,
  }) : super(
          buyPrice: buyPrice,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          sellPrice: sellPrice,
          shortcode: shortcode,
          transactionId: transactionId,
          appId: appId,
          contractId: contractId,
          sellTime: sellTime,
        );

  /// Creates an instance from JSON
  factory TransactionsItem.fromJson(Map<String, dynamic> json) =>
      TransactionsItem(
        buyPrice: getDouble(json['buy_price']),
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: getDateTime(json['purchase_time']),
        sellPrice: getDouble(json['sell_price']),
        shortcode: json['shortcode'],
        transactionId: json['transaction_id'],
        appId: json['app_id'],
        contractId: json['contract_id'],
        sellTime: getDateTime(json['sell_time']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['buy_price'] = buyPrice;
    resultMap['longcode'] = longcode;
    resultMap['payout'] = payout;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['sell_price'] = sellPrice;
    resultMap['shortcode'] = shortcode;
    resultMap['transaction_id'] = transactionId;
    resultMap['app_id'] = appId;
    resultMap['contract_id'] = contractId;
    resultMap['sell_time'] = getSecondsSinceEpochDateTime(sellTime);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TransactionsItem copyWith({
    double buyPrice,
    String longcode,
    double payout,
    DateTime purchaseTime,
    double sellPrice,
    String shortcode,
    int transactionId,
    int appId,
    int contractId,
    DateTime sellTime,
  }) =>
      TransactionsItem(
        buyPrice: buyPrice ?? this.buyPrice,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        sellPrice: sellPrice ?? this.sellPrice,
        shortcode: shortcode ?? this.shortcode,
        transactionId: transactionId ?? this.transactionId,
        appId: appId ?? this.appId,
        contractId: contractId ?? this.contractId,
        sellTime: sellTime ?? this.sellTime,
      );
}
