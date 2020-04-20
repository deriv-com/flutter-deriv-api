import 'package:flutter_deriv_api/models/base_model.dart';
import 'package:flutter_deriv_api/models/app/transaction.dart';

/// App markup details model class
abstract class AppMarkupDetailsModel extends BaseModel {
  /// Class constructor
  AppMarkupDetailsModel({
    this.transactions,
  });

  /// Array of returned transactions
  final List<TransactionModel> transactions;
}
