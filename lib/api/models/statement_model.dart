import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/statement_transaction.dart';

/// Statement model class
abstract class StatementModel extends BaseModel {
  /// Initializes
  StatementModel({
    this.count,
    this.transactions,
  });

  /// Number of transactions returned in this call
  final int count;

  /// Array of returned transactions
  final List<StatementTransactionModel> transactions;
}
