import 'package:flutter_deriv_api/api/account/models/statement_transaction.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Statement model class
abstract class StatementModel extends APIBaseModel {
  /// Initializes
  StatementModel({
    this.count,
    this.transactions,
  });

  /// Number of transactions returned in this call
  final int? count;

  /// Array of returned transactions
  final List<StatementTransactionModel?>? transactions;
}
