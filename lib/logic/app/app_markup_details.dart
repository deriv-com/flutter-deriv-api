import 'package:flutter_deriv_api/models/app/transaction.dart';
import 'package:flutter_deriv_api/models/app/app_markup_details.dart';

/// App markup details class
class AppMarkupDetails extends AppMarkupDetailsModel {
  /// Class constructor
  AppMarkupDetails({
    List<TransactionModel> transactions,
  }) : super(
          transactions: transactions,
        );

  /// Creates instance from json
  factory AppMarkupDetails.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetails(
        transactions: json['transactions'] == null
            ? null
            : json['transactions']
                .map<TransactionModel>((Map<String, dynamic> item) =>
                    TransactionModel.fromJson(item))
                .toList(),
      );

  /// Creates copy of instance with given parameters
  AppMarkupDetails copyWith({
    List<TransactionModel> transactions,
  }) =>
      AppMarkupDetails(
        transactions: transactions ?? this.transactions,
      );
}
