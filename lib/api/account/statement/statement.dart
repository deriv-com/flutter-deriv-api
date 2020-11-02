import 'package:flutter_deriv_api/api/account/models/statement_model.dart';
import 'package:flutter_deriv_api/api/account/models/statement_transaction.dart';
import 'package:flutter_deriv_api/api/account/statement/exceptions/statement_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Statement class
class Statement extends StatementModel {
  /// Initializes
  Statement({
    int count,
    List<StatementTransactionModel> transactions,
  }) : super(
          count: count,
          transactions: transactions,
        );

  /// Generates an instance from JSON
  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        count: json['count'],
        transactions: getListFromMap(
          json['transactions'],
          itemToTypeCallback: (dynamic item) =>
              StatementTransactionModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  Statement copyWith({
    int count,
    List<StatementTransactionModel> transactions,
  }) =>
      Statement(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );

  /// Retrieves a summary of account transactions, according to given search criteria.
  ///
  /// For parameters information refer to [StatementRequest].
  /// Throws a [StatementException] if API response contains an error
  static Future<Statement> fetch(StatementRequest request) async {
    final StatementResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          StatementException(baseExceptionModel: baseExceptionModel),
    );

    return Statement.fromJson(response.statement);
  }
}
