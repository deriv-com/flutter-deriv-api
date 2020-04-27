import 'package:flutter_deriv_api/api/models/app_markup_details_model.dart';
import 'package:flutter_deriv_api/api/models/app_transaction_model.dart';

/// App markup details class
class AppMarkupDetails extends AppMarkupDetailsModel {
  /// Class constructor
  AppMarkupDetails({
    List<AppTransactionModel> transactions,
  }) : super(
          transactions: transactions,
        );

  /// Creates instance from json
  factory AppMarkupDetails.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetails(
        transactions: json['transactions'] == null
            ? null
            : json['transactions']
                .map<AppTransactionModel>((Map<String, dynamic> item) =>
                    AppTransactionModel.fromJson(item))
                .toList(),
      );

  /// Creates copy of instance with given parameters
  AppMarkupDetails copyWith({
    List<AppTransactionModel> transactions,
  }) =>
      AppMarkupDetails(
        transactions: transactions ?? this.transactions,
      );
}
