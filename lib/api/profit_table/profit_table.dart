import 'package:flutter_deriv_api/api/models/profit_table_model.dart';
import 'package:flutter_deriv_api/api/models/profit_transaction_model.dart';

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

  /// Generate an instance from json
  factory ProfitTable.fromJson(Map<String, dynamic> json) => ProfitTable(
        count: int.parse(json['count']),
        transactions: json['transactions'] == null
            ? null
            : json['transactions']
                .map<ProfitTransactionModel>(
                    (dynamic item) => ProfitTransactionModel.fromJson(item))
                .toList(),
      );

  /// Generate a copy of instance with given parameters
  ProfitTable copyWith({
    int count,
    List<ProfitTransactionModel> transactions,
  }) =>
      ProfitTable(
        count: count ?? this.count,
        transactions: transactions ?? this.transactions,
      );
}
