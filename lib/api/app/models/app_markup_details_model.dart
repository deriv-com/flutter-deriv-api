import 'package:flutter_deriv_api/api/app/models/app_transaction_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// App markup details model class
abstract class AppMarkupDetailsModel extends APIBaseModel {
  /// Initializes
  AppMarkupDetailsModel({
    this.transactions,
  });

  /// Array of returned transactions
  final List<AppTransactionModel> transactions;
}
