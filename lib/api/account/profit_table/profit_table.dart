import 'package:flutter_deriv_api/api/account/models/profit_table_model.dart';
import 'package:flutter_deriv_api/api/account/models/profit_transaction_model.dart';
import 'package:flutter_deriv_api/api/account/profit_table/exceptions/profit_table_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Profit table class
class ProfitTable extends ProfitTableModel {
  /// Initializes
  ProfitTable({
    int count,
    List<ProfitTransactionModel> transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Generates an instance from JSON
  factory ProfitTable.fromJson(Map<String, dynamic> json) => ProfitTable(
        count: int.parse(json['count']),
        transactions: getListFromMap(
          json['transactions'],
          itemToTypeCallback: (dynamic item) =>
              ProfitTransactionModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  ProfitTable copyWith({
    int count,
    List<ProfitTransactionModel> transactions,
  }) =>
      ProfitTable(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );

  /// Retrieves a summary of account Profit Table, according to given search criteria.
  ///
  /// For parameters information refer to [ProfitTableRequest].
  /// Throws a [ProfitTableException] if API response contains an error
  static Future<ProfitTable> fetch(ProfitTableRequest request) async {
    final ProfitTableResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ProfitTableException(baseExceptionModel: baseExceptionModel),
    );

    return ProfitTable.fromJson(response.profitTable);
  }
}
