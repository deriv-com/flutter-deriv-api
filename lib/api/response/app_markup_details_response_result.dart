// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_markup_details_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_markup_details_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// App markup details response model class.
abstract class AppMarkupDetailsResponseModel {
  /// Initializes App markup details response model class .
  const AppMarkupDetailsResponseModel({
    this.appMarkupDetails,
  });

  /// App Markup transaction details
  final AppMarkupDetails? appMarkupDetails;
}

/// App markup details response class.
class AppMarkupDetailsResponse extends AppMarkupDetailsResponseModel {
  /// Initializes App markup details response class.
  const AppMarkupDetailsResponse({
    super.appMarkupDetails,
  });

  /// Creates an instance from JSON.
  factory AppMarkupDetailsResponse.fromJson(
    dynamic appMarkupDetailsJson,
  ) =>
      AppMarkupDetailsResponse(
        appMarkupDetails: appMarkupDetailsJson == null
            ? null
            : AppMarkupDetails.fromJson(appMarkupDetailsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (appMarkupDetails != null) {
      resultMap['app_markup_details'] = appMarkupDetails!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Retrieve details of app markup according to criteria specified.
  ///
  /// For parameters information refer to [AppMarkupDetailsRequest].
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<AppMarkupDetailsResponse> fetchApplicationMarkupDetails(
    AppMarkupDetailsRequest request,
  ) async {
    final AppMarkupDetailsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return AppMarkupDetailsResponse.fromJson(response.appMarkupDetails);
  }

  /// Creates a copy of instance with given parameters.
  AppMarkupDetailsResponse copyWith({
    AppMarkupDetails? appMarkupDetails,
  }) =>
      AppMarkupDetailsResponse(
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
      );
}

/// App markup details model class.
abstract class AppMarkupDetailsModel {
  /// Initializes App markup details model class .
  const AppMarkupDetailsModel({
    this.transactions,
  });

  /// Array of returned transactions
  final List<TransactionsItem>? transactions;
}

/// App markup details class.
class AppMarkupDetails extends AppMarkupDetailsModel {
  /// Initializes App markup details class.
  const AppMarkupDetails({
    super.transactions,
  });

  /// Creates an instance from JSON.
  factory AppMarkupDetails.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetails(
        transactions: json['transactions'] == null
            ? null
            : List<TransactionsItem>.from(
                json['transactions']?.map(
                  (dynamic item) => TransactionsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (transactions != null) {
      resultMap['transactions'] = transactions!
          .map<dynamic>(
            (TransactionsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AppMarkupDetails copyWith({
    List<TransactionsItem>? transactions,
  }) =>
      AppMarkupDetails(
        transactions: transactions ?? this.transactions,
      );
}

/// Transactions item model class.
abstract class TransactionsItemModel {
  /// Initializes Transactions item model class .
  const TransactionsItemModel({
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

  /// ID of the application where this contract was purchased.
  final int? appId;

  /// The markup the client paid in their currency
  final double? appMarkup;

  /// The markup the client paid in USD
  final double? appMarkupUsd;

  /// The markup the client paid in the app developer's currency
  final double? appMarkupValue;

  /// Currency code of the client
  final String? clientCurrcode;

  /// Login ID of the client
  final String? clientLoginid;

  /// Currency code of the app developer
  final String? devCurrcode;

  /// Login ID of the app developer
  final String? devLoginid;

  /// The transaction ID. Every contract (buy or sell) and every payment has a unique ID.
  final int? transactionId;

  /// The epoch value of purchase time of transaction
  final String? transactionTime;
}

/// Transactions item class.
class TransactionsItem extends TransactionsItemModel {
  /// Initializes Transactions item class.
  const TransactionsItem({
    super.appId,
    super.appMarkup,
    super.appMarkupUsd,
    super.appMarkupValue,
    super.clientCurrcode,
    super.clientLoginid,
    super.devCurrcode,
    super.devLoginid,
    super.transactionId,
    super.transactionTime,
  });

  /// Creates an instance from JSON.
  factory TransactionsItem.fromJson(Map<String, dynamic> json) =>
      TransactionsItem(
        appId: json['app_id'],
        appMarkup: getDouble(json['app_markup']),
        appMarkupUsd: getDouble(json['app_markup_usd']),
        appMarkupValue: getDouble(json['app_markup_value']),
        clientCurrcode: json['client_currcode'],
        clientLoginid: json['client_loginid'],
        devCurrcode: json['dev_currcode'],
        devLoginid: json['dev_loginid'],
        transactionId: json['transaction_id'],
        transactionTime: json['transaction_time'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['app_markup'] = appMarkup;
    resultMap['app_markup_usd'] = appMarkupUsd;
    resultMap['app_markup_value'] = appMarkupValue;
    resultMap['client_currcode'] = clientCurrcode;
    resultMap['client_loginid'] = clientLoginid;
    resultMap['dev_currcode'] = devCurrcode;
    resultMap['dev_loginid'] = devLoginid;
    resultMap['transaction_id'] = transactionId;
    resultMap['transaction_time'] = transactionTime;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TransactionsItem copyWith({
    int? appId,
    double? appMarkup,
    double? appMarkupUsd,
    double? appMarkupValue,
    String? clientCurrcode,
    String? clientLoginid,
    String? devCurrcode,
    String? devLoginid,
    int? transactionId,
    String? transactionTime,
  }) =>
      TransactionsItem(
        appId: appId ?? this.appId,
        appMarkup: appMarkup ?? this.appMarkup,
        appMarkupUsd: appMarkupUsd ?? this.appMarkupUsd,
        appMarkupValue: appMarkupValue ?? this.appMarkupValue,
        clientCurrcode: clientCurrcode ?? this.clientCurrcode,
        clientLoginid: clientLoginid ?? this.clientLoginid,
        devCurrcode: devCurrcode ?? this.devCurrcode,
        devLoginid: devLoginid ?? this.devLoginid,
        transactionId: transactionId ?? this.transactionId,
        transactionTime: transactionTime ?? this.transactionTime,
      );
}
