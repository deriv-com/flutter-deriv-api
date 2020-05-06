import 'package:flutter_deriv_api/api/account/models/statement_model.dart';
import 'package:flutter_deriv_api/api/account/models/statement_transaction.dart';
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

  /// Generate an instance from JSON
  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        count: json['count'],
        transactions: getListFromMap(
          json['transactions'],
          itemToTypeCallback: (dynamic item) =>
              StatementTransactionModel.fromJson(item),
        ),
      );

  /// Generate a copy of instance with given parameters
  Statement copyWith({
    int count,
    List<StatementTransactionModel> transactions,
  }) =>
      Statement(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );
}
