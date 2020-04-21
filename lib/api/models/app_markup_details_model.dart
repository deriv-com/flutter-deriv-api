import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/transaction_model.dart';

/// App markup details model class
abstract class AppMarkupDetailsModel extends BaseModel {
  /// Class constructor
  AppMarkupDetailsModel({
    this.transactions,
  });

  /// Array of returned transactions
  final List<TransactionModel> transactions;
}
