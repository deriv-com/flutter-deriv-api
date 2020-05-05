import 'package:flutter_deriv_api/api/application/models/app_markup_details_model.dart';
import 'package:flutter_deriv_api/api/application/models/app_transaction_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App markup details class
class AppMarkupDetails extends AppMarkupDetailsModel {
  /// Initializes
  AppMarkupDetails({
    List<AppTransactionModel> transactions,
  }) : super(
          transactions: transactions,
        );

  /// Generates an instance from json
  factory AppMarkupDetails.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetails(
        transactions: getListFromMap(
          json['transactions'],
          itemToTypeCallback: (dynamic item) =>
              AppTransactionModel.fromJson(item),
        ),
      );

  /// Creates copy of instance with given parameters
  AppMarkupDetails copyWith({
    List<AppTransactionModel> transactions,
  }) =>
      AppMarkupDetails(
        transactions: transactions ?? this.transactions,
      );
}
