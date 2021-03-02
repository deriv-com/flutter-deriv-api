import 'package:meta/meta.dart';

import '../../basic_api/generated/contracts_for_receive.dart';
import '../../basic_api/generated/contracts_for_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Contracts for response model class
abstract class ContractsForResponseModel {
  /// Initializes
  ContractsForResponseModel({
    @required this.contractsFor,
  });

  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  final ContractsFor contractsFor;
}

/// Contracts for response class
class ContractsForResponse extends ContractsForResponseModel {
  /// Initializes
  ContractsForResponse({
    @required ContractsFor contractsFor,
  }) : super(
          contractsFor: contractsFor,
        );

  /// Creates an instance from JSON
  factory ContractsForResponse.fromJson(
    dynamic contractsForJson,
  ) =>
      ContractsForResponse(
        contractsFor: contractsForJson == null
            ? null
            : ContractsFor.fromJson(contractsForJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (contractsFor != null) {
      resultMap['contracts_for'] = contractsFor.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets available contracts for given symbol in [ContractsForRequest]
  ///
  /// Throws a [ContractsForSymbolException] if API response contains an error
  static Future<ContractsForResponse> fetchContractsForSymbol(
    ContractsForSend request,
  ) async {
    final ContractsForReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ContractsForSymbolException(baseExceptionModel: baseExceptionModel),
    );

    return ContractsForResponse.fromJson(response.contractsFor);
  }

  /// Creates a copy of instance with given parameters
  ContractsForResponse copyWith({
    ContractsFor contractsFor,
  }) =>
      ContractsForResponse(
        contractsFor: contractsFor ?? this.contractsFor,
      );
}
/// Contracts for model class
abstract class ContractsForModel {
  /// Initializes
  ContractsForModel({
    @required this.hitCount,
    @required this.feedLicense,
    @required this.available,
    this.close,
    this.open,
    this.spot,
  });

  /// Count of contracts available
  final double hitCount;

  /// Indicates the feed license for symbol, for example whether its realtime or delayed
  final String feedLicense;

  /// Array of available contracts details
  final List<AvailableItem> available;

  /// Symbol's next market-close time as an epoch value
  final DateTime close;

  /// Symbol's next market-open time as an epoch value
  final DateTime open;

  /// Current spot price for this underlying
  final double spot;
}

/// Contracts for class
class ContractsFor extends ContractsForModel {
  /// Initializes
  ContractsFor({
    @required List<AvailableItem> available,
    @required String feedLicense,
    @required double hitCount,
    DateTime close,
    DateTime open,
    double spot,
  }) : super(
          available: available,
          feedLicense: feedLicense,
          hitCount: hitCount,
          close: close,
          open: open,
          spot: spot,
        );

  /// Creates an instance from JSON
  factory ContractsFor.fromJson(Map<String, dynamic> json) => ContractsFor(
        available: json['available'] == null
            ? null
            : List<AvailableItem>.from(json['available']
                .map((dynamic item) => AvailableItem.fromJson(item))),
        feedLicense: json['feed_license'],
        hitCount: getDouble(json['hit_count']),
        close: getDateTime(json['close']),
        open: getDateTime(json['open']),
        spot: getDouble(json['spot']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (available != null) {
      resultMap['available'] = available
          .map<dynamic>((AvailableItem item) => item.toJson())
          .toList();
    }
    resultMap['feed_license'] = feedLicense;
    resultMap['hit_count'] = hitCount;
    resultMap['close'] = getSecondsSinceEpochDateTime(close);
    resultMap['open'] = getSecondsSinceEpochDateTime(open);
    resultMap['spot'] = spot;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ContractsFor copyWith({
    List<AvailableItem> available,
    String feedLicense,
    double hitCount,
    DateTime close,
    DateTime open,
    double spot,
  }) =>
      ContractsFor(
        available: available ?? this.available,
        feedLicense: feedLicense ?? this.feedLicense,
        hitCount: hitCount ?? this.hitCount,
        close: close ?? this.close,
        open: open ?? this.open,
        spot: spot ?? this.spot,
      );
}
/// Available item model class
abstract class AvailableItemModel {
  /// Initializes
  AvailableItemModel({
    @required this.underlyingSymbol,
    @required this.tradingPeriod,
    @required this.submarket,
    @required this.startType,
    @required this.sentiment,
    @required this.payoutLimit,
    @required this.minContractDuration,
    @required this.maxContractDuration,
    @required this.market,
    @required this.forwardStartingOptions,
    @required this.expiryType,
    @required this.expiredBarriers,
    @required this.exchangeName,
    @required this.contractsDisplay,
    @required this.contractType,
    @required this.contractCategoryDisplay,
    @required this.contractCategory,
    @required this.barriers,
    @required this.barrierCategory,
    @required this.availableBarriers,
  });

  /// Symbol code
  final String underlyingSymbol;

  /// A hash of predefined trading period
  final Map<String, dynamic> tradingPeriod;

  /// Type of submarket.
  final String submarket;

  /// Start Type.
  final String startType;

  /// Type of sentiment.
  final String sentiment;

  /// Maximum payout.
  final double payoutLimit;

  /// Minimum contract duration.
  final String minContractDuration;

  /// Maximum contract duration
  final String maxContractDuration;

  /// Type of market.
  final String market;

  /// Array of returned forward starting options
  final List<ForwardStartingOptionsItem> forwardStartingOptions;

  /// Expiry Type.
  final String expiryType;

  /// Array of barriers already expired
  final List<dynamic> expiredBarriers;

  /// Name of exchange
  final String exchangeName;

  /// Type of contract.
  final String contractsDisplay;

  /// Type of contract.
  final String contractType;

  /// Category of the contract.
  final String contractCategoryDisplay;

  /// Category of contract.
  final String contractCategory;

  /// Number of barriers.
  final double barriers;

  /// Category of barrier.
  final String barrierCategory;

  /// Array of available barriers for a predefined trading period
  final List<dynamic> availableBarriers;
}

/// Available item class
class AvailableItem extends AvailableItemModel {
  /// Initializes
  AvailableItem({
    @required List<dynamic> availableBarriers,
    @required String barrierCategory,
    @required double barriers,
    @required String contractCategory,
    @required String contractCategoryDisplay,
    @required String contractType,
    @required String contractsDisplay,
    @required String exchangeName,
    @required List<dynamic> expiredBarriers,
    @required String expiryType,
    @required List<ForwardStartingOptionsItem> forwardStartingOptions,
    @required String market,
    @required String maxContractDuration,
    @required String minContractDuration,
    @required double payoutLimit,
    @required String sentiment,
    @required String startType,
    @required String submarket,
    @required Map<String, dynamic> tradingPeriod,
    @required String underlyingSymbol,
  }) : super(
          availableBarriers: availableBarriers,
          barrierCategory: barrierCategory,
          barriers: barriers,
          contractCategory: contractCategory,
          contractCategoryDisplay: contractCategoryDisplay,
          contractType: contractType,
          contractsDisplay: contractsDisplay,
          exchangeName: exchangeName,
          expiredBarriers: expiredBarriers,
          expiryType: expiryType,
          forwardStartingOptions: forwardStartingOptions,
          market: market,
          maxContractDuration: maxContractDuration,
          minContractDuration: minContractDuration,
          payoutLimit: payoutLimit,
          sentiment: sentiment,
          startType: startType,
          submarket: submarket,
          tradingPeriod: tradingPeriod,
          underlyingSymbol: underlyingSymbol,
        );

  /// Creates an instance from JSON
  factory AvailableItem.fromJson(Map<String, dynamic> json) => AvailableItem(
        availableBarriers: json['available_barriers'] == null
            ? null
            : List<dynamic>.from(
                json['available_barriers'].map((dynamic item) => item)),
        barrierCategory: json['barrier_category'],
        barriers: getDouble(json['barriers']),
        contractCategory: json['contract_category'],
        contractCategoryDisplay: json['contract_category_display'],
        contractType: json['contract_type'],
        contractsDisplay: json['contracts_display'],
        exchangeName: json['exchange_name'],
        expiredBarriers: json['expired_barriers'] == null
            ? null
            : List<dynamic>.from(
                json['expired_barriers'].map((dynamic item) => item)),
        expiryType: json['expiry_type'],
        forwardStartingOptions: json['forward_starting_options'] == null
            ? null
            : List<ForwardStartingOptionsItem>.from(
                json['forward_starting_options'].map((dynamic item) =>
                    ForwardStartingOptionsItem.fromJson(item))),
        market: json['market'],
        maxContractDuration: json['max_contract_duration'],
        minContractDuration: json['min_contract_duration'],
        payoutLimit: getDouble(json['payout_limit']),
        sentiment: json['sentiment'],
        startType: json['start_type'],
        submarket: json['submarket'],
        tradingPeriod: json['trading_period'],
        underlyingSymbol: json['underlying_symbol'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (availableBarriers != null) {
      resultMap['available_barriers'] =
          availableBarriers.map<dynamic>((dynamic item) => item).toList();
    }
    resultMap['barrier_category'] = barrierCategory;
    resultMap['barriers'] = barriers;
    resultMap['contract_category'] = contractCategory;
    resultMap['contract_category_display'] = contractCategoryDisplay;
    resultMap['contract_type'] = contractType;
    resultMap['contracts_display'] = contractsDisplay;
    resultMap['exchange_name'] = exchangeName;
    if (expiredBarriers != null) {
      resultMap['expired_barriers'] =
          expiredBarriers.map<dynamic>((dynamic item) => item).toList();
    }
    resultMap['expiry_type'] = expiryType;
    if (forwardStartingOptions != null) {
      resultMap['forward_starting_options'] = forwardStartingOptions
          .map<dynamic>((ForwardStartingOptionsItem item) => item.toJson())
          .toList();
    }
    resultMap['market'] = market;
    resultMap['max_contract_duration'] = maxContractDuration;
    resultMap['min_contract_duration'] = minContractDuration;
    resultMap['payout_limit'] = payoutLimit;
    resultMap['sentiment'] = sentiment;
    resultMap['start_type'] = startType;
    resultMap['submarket'] = submarket;
    resultMap['trading_period'] = tradingPeriod;
    resultMap['underlying_symbol'] = underlyingSymbol;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AvailableItem copyWith({
    List<dynamic> availableBarriers,
    String barrierCategory,
    double barriers,
    String contractCategory,
    String contractCategoryDisplay,
    String contractType,
    String contractsDisplay,
    String exchangeName,
    List<dynamic> expiredBarriers,
    String expiryType,
    List<ForwardStartingOptionsItem> forwardStartingOptions,
    String market,
    String maxContractDuration,
    String minContractDuration,
    double payoutLimit,
    String sentiment,
    String startType,
    String submarket,
    Map<String, dynamic> tradingPeriod,
    String underlyingSymbol,
  }) =>
      AvailableItem(
        availableBarriers: availableBarriers ?? this.availableBarriers,
        barrierCategory: barrierCategory ?? this.barrierCategory,
        barriers: barriers ?? this.barriers,
        contractCategory: contractCategory ?? this.contractCategory,
        contractCategoryDisplay:
            contractCategoryDisplay ?? this.contractCategoryDisplay,
        contractType: contractType ?? this.contractType,
        contractsDisplay: contractsDisplay ?? this.contractsDisplay,
        exchangeName: exchangeName ?? this.exchangeName,
        expiredBarriers: expiredBarriers ?? this.expiredBarriers,
        expiryType: expiryType ?? this.expiryType,
        forwardStartingOptions:
            forwardStartingOptions ?? this.forwardStartingOptions,
        market: market ?? this.market,
        maxContractDuration: maxContractDuration ?? this.maxContractDuration,
        minContractDuration: minContractDuration ?? this.minContractDuration,
        payoutLimit: payoutLimit ?? this.payoutLimit,
        sentiment: sentiment ?? this.sentiment,
        startType: startType ?? this.startType,
        submarket: submarket ?? this.submarket,
        tradingPeriod: tradingPeriod ?? this.tradingPeriod,
        underlyingSymbol: underlyingSymbol ?? this.underlyingSymbol,
      );
}
/// Forward starting options item model class
abstract class ForwardStartingOptionsItemModel {
  /// Initializes
  ForwardStartingOptionsItemModel({
    @required this.open,
    @required this.date,
    @required this.close,
  });

  /// The epoch value for the opening date of forward starting session.
  final String open;

  /// The epoch value for the date of forward starting session.
  final String date;

  /// The epoch value for the closing date of forward starting session.
  final String close;
}

/// Forward starting options item class
class ForwardStartingOptionsItem extends ForwardStartingOptionsItemModel {
  /// Initializes
  ForwardStartingOptionsItem({
    @required String close,
    @required String date,
    @required String open,
  }) : super(
          close: close,
          date: date,
          open: open,
        );

  /// Creates an instance from JSON
  factory ForwardStartingOptionsItem.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOptionsItem(
        close: json['close'],
        date: json['date'],
        open: json['open'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['close'] = close;
    resultMap['date'] = date;
    resultMap['open'] = open;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ForwardStartingOptionsItem copyWith({
    String close,
    String date,
    String open,
  }) =>
      ForwardStartingOptionsItem(
        close: close ?? this.close,
        date: date ?? this.date,
        open: open ?? this.open,
      );
}
