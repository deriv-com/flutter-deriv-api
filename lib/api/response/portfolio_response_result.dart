// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/portfolio_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/portfolio_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Portfolio response model class.
abstract class PortfolioResponseModel extends Equatable {
  /// Initializes Portfolio response model class .
  const PortfolioResponseModel({
    this.portfolio,
  });

  /// Current account's open positions.
  final Portfolio? portfolio;
}

/// Portfolio response class.
class PortfolioResponse extends PortfolioResponseModel {
  /// Initializes Portfolio response class.
  const PortfolioResponse({
    Portfolio? portfolio,
  }) : super(
          portfolio: portfolio,
        );

  /// Creates an instance from JSON.
  factory PortfolioResponse.fromJson(
    dynamic portfolioJson,
  ) =>
      PortfolioResponse(
        portfolio:
            portfolioJson == null ? null : Portfolio.fromJson(portfolioJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (portfolio != null) {
      resultMap['portfolio'] = portfolio!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the portfolio fo logged-in account
  ///
  /// Throws a [PortfolioException] if API response contains an error
  static Future<PortfolioResponse> fetchPortfolio(
      PortfolioRequest request) async {
    final PortfolioReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          PortfolioException(baseExceptionModel: baseExceptionModel),
    );

    return PortfolioResponse.fromJson(response.portfolio);
  }

  /// Creates a copy of instance with given parameters.
  PortfolioResponse copyWith({
    Portfolio? portfolio,
  }) =>
      PortfolioResponse(
        portfolio: portfolio ?? this.portfolio,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Portfolio model class.
abstract class PortfolioModel extends Equatable {
  /// Initializes Portfolio model class .
  const PortfolioModel({
    required this.contracts,
  });

  /// List of open positions.
  final List<ContractsItem> contracts;
}

/// Portfolio class.
class Portfolio extends PortfolioModel {
  /// Initializes Portfolio class.
  const Portfolio({
    required List<ContractsItem> contracts,
  }) : super(
          contracts: contracts,
        );

  /// Creates an instance from JSON.
  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        contracts: List<ContractsItem>.from(
          json['contracts'].map(
            (dynamic item) => ContractsItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['contracts'] = contracts
        .map<dynamic>(
          (ContractsItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Portfolio copyWith({
    required List<ContractsItem> contracts,
  }) =>
      Portfolio(
        contracts: contracts,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Contracts item model class.
abstract class ContractsItemModel extends Equatable {
  /// Initializes Contracts item model class .
  const ContractsItemModel({
    this.appId,
    this.buyPrice,
    this.contractId,
    this.contractType,
    this.currency,
    this.dateStart,
    this.expiryTime,
    this.longcode,
    this.payout,
    this.purchaseTime,
    this.shortcode,
    this.symbol,
    this.transactionId,
  });

  /// ID of the application where this contract was purchased.
  final int? appId;

  /// Buy price
  final double? buyPrice;

  /// Internal contract identifier number (to be used in a `proposal_open_contract` API call).
  final int? contractId;

  /// Contract type
  final String? contractType;

  /// Contract currency
  final String? currency;

  /// Epoch of start date
  final DateTime? dateStart;

  /// Epoch of expiry time
  final DateTime? expiryTime;

  /// Contract description
  final String? longcode;

  /// Payout price
  final double? payout;

  /// Epoch of purchase time
  final DateTime? purchaseTime;

  /// Contract short code description
  final String? shortcode;

  /// Symbol code
  final String? symbol;

  /// It is the transaction ID. Every contract (buy or sell) and every payment has a unique ID.
  final int? transactionId;
}

/// Contracts item class.
class ContractsItem extends ContractsItemModel {
  /// Initializes Contracts item class.
  const ContractsItem({
    int? appId,
    double? buyPrice,
    int? contractId,
    String? contractType,
    String? currency,
    DateTime? dateStart,
    DateTime? expiryTime,
    String? longcode,
    double? payout,
    DateTime? purchaseTime,
    String? shortcode,
    String? symbol,
    int? transactionId,
  }) : super(
          appId: appId,
          buyPrice: buyPrice,
          contractId: contractId,
          contractType: contractType,
          currency: currency,
          dateStart: dateStart,
          expiryTime: expiryTime,
          longcode: longcode,
          payout: payout,
          purchaseTime: purchaseTime,
          shortcode: shortcode,
          symbol: symbol,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON.
  factory ContractsItem.fromJson(Map<String, dynamic> json) => ContractsItem(
        appId: json['app_id'],
        buyPrice: getDouble(json['buy_price']),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        dateStart: getDateTime(json['date_start']),
        expiryTime: getDateTime(json['expiry_time']),
        longcode: json['longcode'],
        payout: getDouble(json['payout']),
        purchaseTime: getDateTime(json['purchase_time']),
        shortcode: json['shortcode'],
        symbol: json['symbol'],
        transactionId: json['transaction_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['buy_price'] = buyPrice;
    resultMap['contract_id'] = contractId;
    resultMap['contract_type'] = contractType;
    resultMap['currency'] = currency;
    resultMap['date_start'] = getSecondsSinceEpochDateTime(dateStart);
    resultMap['expiry_time'] = getSecondsSinceEpochDateTime(expiryTime);
    resultMap['longcode'] = longcode;
    resultMap['payout'] = payout;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['shortcode'] = shortcode;
    resultMap['symbol'] = symbol;
    resultMap['transaction_id'] = transactionId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ContractsItem copyWith({
    int? appId,
    double? buyPrice,
    int? contractId,
    String? contractType,
    String? currency,
    DateTime? dateStart,
    DateTime? expiryTime,
    String? longcode,
    double? payout,
    DateTime? purchaseTime,
    String? shortcode,
    String? symbol,
    int? transactionId,
  }) =>
      ContractsItem(
        appId: appId ?? this.appId,
        buyPrice: buyPrice ?? this.buyPrice,
        contractId: contractId ?? this.contractId,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        dateStart: dateStart ?? this.dateStart,
        expiryTime: expiryTime ?? this.expiryTime,
        longcode: longcode ?? this.longcode,
        payout: payout ?? this.payout,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        shortcode: shortcode ?? this.shortcode,
        symbol: symbol ?? this.symbol,
        transactionId: transactionId ?? this.transactionId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
