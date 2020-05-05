import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Transaction model class
class AppTransactionModel extends APIBaseModel {
  /// Initializes
  AppTransactionModel({
    this.appId,
    this.appMarkup,
    this.appMarkupUsd,
    this.appMarkupValue,
    this.clientCurrencyCode,
    this.clientLoginId,
    this.devCurrencyCode,
    this.devLoginId,
    this.transactionId,
    this.transactionTime,
  });

  /// Creates an instance from json
  factory AppTransactionModel.fromJson(Map<String, dynamic> json) =>
      AppTransactionModel(
        appId: json['app_id'],
        appMarkup: json['app_markup'],
        appMarkupUsd: json['app_markup_usd'],
        appMarkupValue: json['app_markup_value'],
        clientCurrencyCode: json['client_currcode'],
        clientLoginId: json['client_loginid'],
        devCurrencyCode: json['dev_currcode'],
        devLoginId: json['dev_loginid'],
        transactionId: json['transaction_id'],
        transactionTime: getDateTime(json['transaction_time']),
      );

  /// ID of the application where this contract was purchased.
  final int appId;

  /// The markup the client paid in their currency
  final double appMarkup;

  /// The markup the client paid in USD
  final double appMarkupUsd;

  /// The markup the client paid in the app developer's currency
  final double appMarkupValue;

  /// Currency code of the client
  final String clientCurrencyCode;

  /// Login ID of the client
  final String clientLoginId;

  /// Currency code of the app developer
  final String devCurrencyCode;

  /// Login ID of the app developer
  final String devLoginId;

  /// The transaction ID. Every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// The epoch value of purchase time of transaction
  final DateTime transactionTime;
}
