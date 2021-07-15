import '../../basic_api/generated/profit_table_receive.dart';
import '../../basic_api/generated/profit_table_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Profit table response model class.
abstract class ProfitTableResponseModel {
  /// Initializes Profit table response model class .
  ProfitTableResponseModel({
    this.profitTable,
  });

  /// Account Profit Table.
  final ProfitTable? profitTable;
}

/// Profit table response class.
class ProfitTableResponse extends ProfitTableResponseModel {
  /// Initializes Profit table response class.
  ProfitTableResponse({
    ProfitTable? profitTable,
  }) : super(
          profitTable: profitTable,
        );

  /// Creates an instance from JSON.
  factory ProfitTableResponse.fromJson(
    dynamic profitTableJson,
  ) =>
      ProfitTableResponse(
        profitTable: profitTableJson == null
            ? null
            : ProfitTable.fromJson(profitTableJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (profitTable != null) {
      resultMap['profit_table'] = profitTable!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves a summary of account Profit Table, according to given search criteria.
  ///
  /// For parameters information refer to [ProfitTableRequest].
  /// Throws a [ProfitTableException] if API response contains an error
  static Future<ProfitTableResponse> fetch(ProfitTableRequest request) async {
    final ProfitTableReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ProfitTableException(baseExceptionModel: baseExceptionModel),
    );

    return ProfitTableResponse.fromJson(response.profitTable);
  }

  /// Creates a copy of instance with given parameters.
  ProfitTableResponse copyWith({
    ProfitTable? profitTable,
  }) =>
      ProfitTableResponse(
        profitTable: profitTable ?? this.profitTable,
      );
}
/// Profit table model class.
abstract class ProfitTableModel {
  /// Initializes Profit table model class .
  ProfitTableModel({
    this.count,
    this.transactions,
  });

  /// Number of transactions returned in this call
  final double? count;

  /// Array of returned transactions
  final List<TransactionsItem>? transactions;
}

/// Profit table class.
class ProfitTable extends ProfitTableModel {
  /// Initializes Profit table class.
  ProfitTable({
    double? count,
    List<TransactionsItem>? transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Creates an instance from JSON.
  factory ProfitTable.fromJson(Map<String, dynamic> json) => ProfitTable(
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
  ProfitTable copyWith({
    double? count,
    List<TransactionsItem>? transactions,
  }) =>
      ProfitTable(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );
}
/// Transactions item model class.
abstract class TransactionsItemModel {
  /// Initializes Transactions item model class .
  TransactionsItemModel({
    this.appId,
    this.buyPrice,
    this.contractId,
    this.longcode,
    this.payout,
    this.purchaseTime,
    this.sellPrice,
    this.sellTime,
    this.shortcode,
    this.transactionId,
  });

  /// ID of the application where this contract was purchased.
  final int? appId;

  /// The buy price
  final double? buyPrice;

  /// The unique contract identifier.
  final int? contractId;

  /// The description of contract purchased if description is set to 1
  final String? longcode;

  /// Payout price
  final double? payout;

  /// Epoch purchase time of the transaction
  final DateTime? purchaseTime;

  /// The price the contract sold for.
  final double? sellPrice;

  /// Epoch sell time of the transaction
  final DateTime? sellTime;

  /// Compact description of the contract purchased if description is set to 1
  final String? shortcode;

  /// The transaction Identifier. Every contract (buy or sell) and every payment has a unique transaction identifier.
  final int? transactionId;
}

/// Transactions item class.
class TransactionsItem extends TransactionsItemModel {
  /// Initializes Transactions item class.
  TransactionsItem({
    int? appId,
    double? buyPrice,
    int? contractId,
    String? longcode,
    double? payout,
    DateTime? purchaseTime,
    double? sellPrice,
    DateTime? sellTime,
    String? shortcode,
    int? transactionId,
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

  /// Creates an instance from JSON.
  factory TransactionsItem.fromJson(Map<String, dynamic> json) =>
      TransactionsItem(
        appId: json['app_id'],
        buyPrice: getDouble(json['buy_price']),
        contractId: json['contract_id'],
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: getDateTime(json['purchase_time']),
        sellPrice: getDouble(json['sell_price']),
        sellTime: getDateTime(json['sell_time']),
        shortcode: json['shortcode'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['buy_price'] = buyPrice;
    resultMap['contract_id'] = contractId;
    resultMap['longcode'] = longcode;
    resultMap['payout'] = payout;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['sell_price'] = sellPrice;
    resultMap['sell_time'] = getSecondsSinceEpochDateTime(sellTime);
    resultMap['shortcode'] = shortcode;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TransactionsItem copyWith({
    int? appId,
    double? buyPrice,
    int? contractId,
    String? longcode,
    double? payout,
    DateTime? purchaseTime,
    double? sellPrice,
    DateTime? sellTime,
    String? shortcode,
    int? transactionId,
  }) =>
      TransactionsItem(
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
