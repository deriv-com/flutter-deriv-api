import 'package:flutter_deriv_api/api/contract/models/forward_starting_option_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Available contracts details
class AvailableContractModel extends APIBaseModel {
  /// Initializes
  AvailableContractModel({
    this.availableBarriers,
    this.barrier,
    this.barrierCategory,
    this.barriers,
    this.contractCategory,
    this.contractCategoryDisplay,
    this.contractDisplay,
    this.contractType,
    this.exchangeName,
    this.expiredBarriers,
    this.expiryType,
    this.forwardStartingOptions,
    this.market,
    this.maxContractDuration,
    this.minContractDuration,
    this.sentiment,
    this.startType,
    this.submarket,
    this.tradingPeriod,
    this.underlyingSymbol,
  });

  /// Generates an instance from JSON
  factory AvailableContractModel.fromJson(Map<String, dynamic> json) =>
      AvailableContractModel(
        availableBarriers: json['available_barriers'],
        barrier: json['barrier'].toString(),
        barrierCategory: json['barrier_category'],
        barriers: json['barriers'],
        contractCategory: json['contract_category'],
        contractCategoryDisplay: json['contract_category_display'],
        contractDisplay: json['contract_display'],
        contractType: json['contract_type'],
        exchangeName: json['exchange_name'],
        expiredBarriers: getListFromMap(json['expired_barriers']),
        expiryType: json['expiry_type'],
        forwardStartingOptions: getListFromMap(
          json['forward_starting_options'],
          itemToTypeCallback: (dynamic item) =>
              ForwardStartingOptionModel.fromJson(item),
        ),
        market: json['market'],
        maxContractDuration: json['max_contract_duration'],
        minContractDuration: json['min_contract_duration'],
        sentiment: json['sentiment'],
        startType: json['start_type'],
        submarket: json['submarket'],
        tradingPeriod: json['trading_period'],
        underlyingSymbol: json['underlying_symbol'],
      );

  /// Array of available barriers for a predefined trading period
  final List<int> availableBarriers;

  /// Barrier
  final String barrier;

  /// Category of barrier.
  final String barrierCategory;

  /// Number of barriers.
  final int barriers;

  /// Category of the contract.
  final String contractCategory;

  /// Category of the contract Display."
  final String contractCategoryDisplay;

  /// Type of contract.
  final String contractDisplay;

  /// Type of contract.
  final String contractType;

  /// Name of exchange
  final String exchangeName;

  /// Array of barriers already expired
  final List<String> expiredBarriers;

  /// Expiry Type.
  final String expiryType;

  /// Array of returned forward starting options
  final List<ForwardStartingOptionModel> forwardStartingOptions;

  /// Type of market.
  final String market;

  /// Maximum contract duration
  final String maxContractDuration;

  /// Minimum contract duration.
  final String minContractDuration;

  /// Type of sentiment.
  final String sentiment;

  /// Start Type.
  final String startType;

  /// Type of submarket.
  final String submarket;

  /// A hash of predefined trading period
  final Map<String, dynamic> tradingPeriod;

  /// Symbol code
  final String underlyingSymbol;

  /// Creates a copy of instance with given parameters
  AvailableContractModel copyWith({
    List<int> availableBarriers,
    String barrier,
    String barrierCategory,
    int barriers,
    String contractCategory,
    String contractCategoryDisplay,
    String contractDisplay,
    String contractType,
    String exchangeName,
    List<String> expiredBarriers,
    String expiryType,
    List<ForwardStartingOptionModel> forwardStartingOptions,
    String market,
    String maxContractDuration,
    String minContractDuration,
    String sentiment,
    String startType,
    String submarket,
    Map<String, dynamic> tradingPeriod,
    String underlyingSymbol,
  }) =>
      AvailableContractModel(
        availableBarriers: availableBarriers ?? this.availableBarriers,
        barrier: barrier ?? this.barrier,
        barrierCategory: barrierCategory ?? this.barrierCategory,
        barriers: barriers ?? this.barriers,
        contractCategory: contractCategory ?? this.contractCategory,
        contractCategoryDisplay:
            contractCategoryDisplay ?? this.contractCategoryDisplay,
        contractDisplay: contractDisplay ?? this.contractDisplay,
        contractType: contractType ?? this.contractType,
        exchangeName: exchangeName ?? this.exchangeName,
        expiredBarriers: expiredBarriers ?? this.expiredBarriers,
        expiryType: expiryType ?? this.expiryType,
        forwardStartingOptions:
            forwardStartingOptions ?? this.forwardStartingOptions,
        market: market ?? this.market,
        maxContractDuration: maxContractDuration ?? this.maxContractDuration,
        minContractDuration: minContractDuration ?? this.minContractDuration,
        sentiment: sentiment ?? this.sentiment,
        startType: startType ?? this.startType,
        submarket: submarket ?? this.submarket,
        tradingPeriod: tradingPeriod ?? this.tradingPeriod,
        underlyingSymbol: underlyingSymbol ?? this.underlyingSymbol,
      );
}
