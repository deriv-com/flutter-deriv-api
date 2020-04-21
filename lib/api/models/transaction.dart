import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Transaction model class
class TransactionModel extends BaseModel {
  /// Class constructor
  TransactionModel({
    this.appId,
    this.appMarkup,
    this.appMarkupUsd,
    this.appMarkupValue,
    this.clientCurrcode,
    this.clientLoginid,
    this.devCurrcode,
    this.devLoginid,
    this.transactionId,
    this.transactionTime,
  });

  /// Creates instance from json
  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        appId: json['app_id'],
        appMarkup: json['app_markup'],
        appMarkupUsd: json['app_markup_usd'],
        appMarkupValue: json['app_markup_value'],
        clientCurrcode: json['client_currcode'],
        clientLoginid: json['client_loginid'],
        devCurrcode: json['dev_currcode'],
        devLoginid: json['dev_loginid'],
        transactionId: json['transaction_id'],
        transactionTime: json['transaction_time'],
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
  final String clientCurrcode;

  /// Login ID of the client
  final String clientLoginid;

  /// Currency code of the app developer
  final String devCurrcode;

  /// Login ID of the app developer
  final String devLoginid;

  /// The transaction ID. Every contract (buy or sell) and every payment has a unique ID.
  final int transactionId;

  /// The epoch value of purchase time of transaction
  final String transactionTime;
}
