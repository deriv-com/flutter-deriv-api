import 'package:flutter_deriv_api/api/models/statement_model.dart';
import 'package:flutter_deriv_api/api/models/statement_transaction.dart';

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

  /// Generate an instance from json
  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        count: json['count'],
        transactions: json['transactions'] == null
            ? null
            : json['transactions']
                .map<StatementTransactionModel>(
                    (dynamic item) => StatementTransactionModel.fromJson(item))
                .toList(),
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
