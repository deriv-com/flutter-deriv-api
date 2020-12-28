/// App markup details receive model class
abstract class AppMarkupDetailsReceiveModel {
  /// Initializes
  AppMarkupDetailsReceiveModel({
    @required this.appMarkupDetails,
  });

  /// App Markup transaction details
  final AppMarkupDetails appMarkupDetails;
}

/// App markup details receive class
class AppMarkupDetailsReceive extends AppMarkupDetailsReceiveModel {
  /// Initializes
  AppMarkupDetailsReceive({
    @required AppMarkupDetails appMarkupDetails,
  }) : super(
          appMarkupDetails: appMarkupDetails,
        );

  /// Creates an instance from JSON
  factory AppMarkupDetailsReceive.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetailsReceive(
        appMarkupDetails: json['app_markup_details'] == null
            ? null
            : AppMarkupDetails.fromJson(json['app_markup_details']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (appMarkupDetails != null) {
      result['app_markup_details'] = appMarkupDetails.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppMarkupDetailsReceive copyWith({
    AppMarkupDetails appMarkupDetails,
  }) =>
      AppMarkupDetailsReceive(
        appMarkupDetails: appMarkupDetails ?? this.appMarkupDetails,
      );
}
/// App markup details model class
abstract class AppMarkupDetailsModel {
  /// Initializes
  AppMarkupDetailsModel({
    @required this.transactions,
  });

  /// Array of returned transactions
  final List<Transaction> transactions;
}

/// App markup details class
class AppMarkupDetails extends AppMarkupDetailsModel {
  /// Initializes
  AppMarkupDetails({
    @required List<Transaction> transactions,
  }) : super(
          transactions: transactions,
        );

  /// Creates an instance from JSON
  factory AppMarkupDetails.fromJson(Map<String, dynamic> json) =>
      AppMarkupDetails(
        transactions: json['transactions'] == null
            ? null
            : json['transactions']
                .map<Transaction>((dynamic item) => Transaction.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (transactions != null) {
      result['transactions'] =
          transactions.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  AppMarkupDetails copyWith({
    List<Transaction> transactions,
  }) =>
      AppMarkupDetails(
        transactions: transactions ?? this.transactions,
      );
}
/// Transaction model class
abstract class TransactionModel {
  /// Initializes
  TransactionModel({
    @required this.appId,
    @required this.appMarkup,
    @required this.appMarkupUsd,
    @required this.appMarkupValue,
    @required this.clientCurrcode,
    @required this.clientLoginid,
    @required this.devCurrcode,
    @required this.devLoginid,
    @required this.transactionId,
    @required this.transactionTime,
  });

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

/// Transaction class
class Transaction extends TransactionModel {
  /// Initializes
  Transaction({
    @required int appId,
    @required double appMarkup,
    @required double appMarkupUsd,
    @required double appMarkupValue,
    @required String clientCurrcode,
    @required String clientLoginid,
    @required String devCurrcode,
    @required String devLoginid,
    @required int transactionId,
    @required String transactionTime,
  }) : super(
          appId: appId,
          appMarkup: appMarkup,
          appMarkupUsd: appMarkupUsd,
          appMarkupValue: appMarkupValue,
          clientCurrcode: clientCurrcode,
          clientLoginid: clientLoginid,
          devCurrcode: devCurrcode,
          devLoginid: devLoginid,
          transactionId: transactionId,
          transactionTime: transactionTime,
        );

  /// Creates an instance from JSON
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
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

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['app_id'] = appId;
    result['app_markup'] = appMarkup;
    result['app_markup_usd'] = appMarkupUsd;
    result['app_markup_value'] = appMarkupValue;
    result['client_currcode'] = clientCurrcode;
    result['client_loginid'] = clientLoginid;
    result['dev_currcode'] = devCurrcode;
    result['dev_loginid'] = devLoginid;
    result['transaction_id'] = transactionId;
    result['transaction_time'] = transactionTime;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Transaction copyWith({
    int appId,
    double appMarkup,
    double appMarkupUsd,
    double appMarkupValue,
    String clientCurrcode,
    String clientLoginid,
    String devCurrcode,
    String devLoginid,
    int transactionId,
    String transactionTime,
  }) =>
      Transaction(
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
