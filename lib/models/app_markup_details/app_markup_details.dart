import 'package:flutter_deriv_api/models/app_markup_details/transaction.dart';

/// App markup details model class
abstract class AppMarkupDetailsModel {
  /// Class constructor
  AppMarkupDetailsModel({
    this.transactions,
  });

  /// Array of returned transactions
  final List<TransactionModel> transactions;
}
