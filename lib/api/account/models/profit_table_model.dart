import 'package:flutter_deriv_api/api/account/models/profit_transaction_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Profit table model class
abstract class ProfitTableModel extends APIBaseModel {
  /// Initializes
  ProfitTableModel({
    this.count,
    this.transactions,
  });

  /// Number of transactions returned in this call
  final int? count;

  /// Array of returned transactions
  final List<ProfitTransactionModel?>? transactions;
}
