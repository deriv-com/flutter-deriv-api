/// Contracts for receive model class
abstract class ContractsForReceiveModel {
  /// Initializes
  ContractsForReceiveModel({
    @required this.contractsFor,
  });

  /// List of available contracts. Note: if the user is authenticated, then only contracts allowed under his account will be returned.
  final ContractsFor contractsFor;
}

/// Contracts for receive class
class ContractsForReceive extends ContractsForReceiveModel {
  /// Initializes
  ContractsForReceive({
    @required ContractsFor contractsFor,
  }) : super(
          contractsFor: contractsFor,
        );

  /// Creates an instance from JSON
  factory ContractsForReceive.fromJson(Map<String, dynamic> json) =>
      ContractsForReceive(
        contractsFor: json['contracts_for'] == null
            ? null
            : ContractsFor.fromJson(json['contracts_for']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (contractsFor != null) {
      result['contracts_for'] = contractsFor.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractsForReceive copyWith({
    ContractsFor contractsFor,
  }) =>
      ContractsForReceive(
        contractsFor: contractsFor ?? this.contractsFor,
      );
}
/// Contracts for model class
abstract class ContractsForModel {
  /// Initializes
  ContractsForModel({
    @required this.available,
    this.close,
    @required this.feedLicense,
    @required this.hitCount,
    this.open,
    this.spot,
  });

  /// Array of available contracts details
  final List<Available> available;

  /// Symbol's next market-close time as an epoch value
  final double close;

  /// Indicates the feed license for symbol, for example whether its realtime or delayed
  final String feedLicense;

  /// Count of contracts available
  final double hitCount;

  /// Symbol's next market-open time as an epoch value
  final double open;

  /// Current spot price for this underlying
  final double spot;
}

/// Contracts for class
class ContractsFor extends ContractsForModel {
  /// Initializes
  ContractsFor({
    @required List<Available> available,
    double close,
    @required String feedLicense,
    @required double hitCount,
    double open,
    double spot,
  }) : super(
          available: available,
          close: close,
          feedLicense: feedLicense,
          hitCount: hitCount,
          open: open,
          spot: spot,
        );

  /// Creates an instance from JSON
  factory ContractsFor.fromJson(Map<String, dynamic> json) => ContractsFor(
        available: json['available'] == null
            ? null
            : json['available']
                .map<Available>((dynamic item) => Available.fromJson(item))
                .toList(),
        close: getDouble(json['close']),
        feedLicense: json['feed_license'],
        hitCount: getDouble(json['hit_count']),
        open: getDouble(json['open']),
        spot: getDouble(json['spot']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (available != null) {
      result['available'] = available.map((item) => item.toJson()).toList();
    }
    result['close'] = close;
    result['feed_license'] = feedLicense;
    result['hit_count'] = hitCount;
    result['open'] = open;
    result['spot'] = spot;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ContractsFor copyWith({
    List<Available> available,
    double close,
    String feedLicense,
    double hitCount,
    double open,
    double spot,
  }) =>
      ContractsFor(
        available: available ?? this.available,
        close: close ?? this.close,
        feedLicense: feedLicense ?? this.feedLicense,
        hitCount: hitCount ?? this.hitCount,
        open: open ?? this.open,
        spot: spot ?? this.spot,
      );
}
/// Available model class
abstract class AvailableModel {
  /// Initializes
  AvailableModel({
    @required this.availableBarriers,
    @required this.barrierCategory,
    @required this.barriers,
    @required this.contractCategory,
    @required this.contractCategoryDisplay,
    @required this.contractType,
    @required this.contractsDisplay,
    @required this.exchangeName,
    @required this.expiredBarriers,
    @required this.expiryType,
    @required this.forwardStartingOptions,
    @required this.market,
    @required this.maxContractDuration,
    @required this.minContractDuration,
    @required this.payoutLimit,
    @required this.sentiment,
    @required this.startType,
    @required this.submarket,
    @required this.tradingPeriod,
    @required this.underlyingSymbol,
  });

  /// Array of available barriers for a predefined trading period
  final List<dynamic> availableBarriers;

  /// Category of barrier.
  final String barrierCategory;

  /// Number of barriers.
  final double barriers;

  /// Category of contract.
  final String contractCategory;

  /// Category of the contract.
  final String contractCategoryDisplay;

  /// Type of contract.
  final String contractType;

  /// Type of contract.
  final String contractsDisplay;

  /// Name of exchange
  final String exchangeName;

  /// Array of barriers already expired
  final List<dynamic> expiredBarriers;

  /// Expiry Type.
  final String expiryType;

  /// Array of returned forward starting options
  final List<ForwardStartingOption> forwardStartingOptions;

  /// Type of market.
  final String market;

  /// Maximum contract duration
  final String maxContractDuration;

  /// Minimum contract duration.
  final String minContractDuration;

  /// Maximum payout.
  final double payoutLimit;

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
}

/// Available class
class Available extends AvailableModel {
  /// Initializes
  Available({
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
    @required List<ForwardStartingOption> forwardStartingOptions,
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
  factory Available.fromJson(Map<String, dynamic> json) => Available(
        barrierCategory: json['barrier_category'],
        barriers: getDouble(json['barriers']),
        contractCategory: json['contract_category'],
        contractCategoryDisplay: json['contract_category_display'],
        contractType: json['contract_type'],
        contractsDisplay: json['contracts_display'],
        exchangeName: json['exchange_name'],
        expiryType: json['expiry_type'],
        forwardStartingOptions: json['forward_starting_options'] == null
            ? null
            : json['forward_starting_options']
                .map<ForwardStartingOption>(
                    (dynamic item) => ForwardStartingOption.fromJson(item))
                .toList(),
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
    final Map<String, dynamic> result = <String, dynamic>{};

    result['available_barriers'] = availableBarriers;
    result['barrier_category'] = barrierCategory;
    result['barriers'] = barriers;
    result['contract_category'] = contractCategory;
    result['contract_category_display'] = contractCategoryDisplay;
    result['contract_type'] = contractType;
    result['contracts_display'] = contractsDisplay;
    result['exchange_name'] = exchangeName;
    result['expired_barriers'] = expiredBarriers;
    result['expiry_type'] = expiryType;
    if (forwardStartingOptions != null) {
      result['forward_starting_options'] =
          forwardStartingOptions.map((item) => item.toJson()).toList();
    }
    result['market'] = market;
    result['max_contract_duration'] = maxContractDuration;
    result['min_contract_duration'] = minContractDuration;
    result['payout_limit'] = payoutLimit;
    result['sentiment'] = sentiment;
    result['start_type'] = startType;
    result['submarket'] = submarket;
    result['trading_period'] = tradingPeriod;
    result['underlying_symbol'] = underlyingSymbol;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Available copyWith({
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
    List<ForwardStartingOption> forwardStartingOptions,
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
      Available(
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
/// Forward starting option model class
abstract class ForwardStartingOptionModel {
  /// Initializes
  ForwardStartingOptionModel({
    @required this.close,
    @required this.date,
    @required this.open,
  });

  /// The epoch value for the closing date of forward starting session.
  final String close;

  /// The epoch value for the date of forward starting session.
  final String date;

  /// The epoch value for the opening date of forward starting session.
  final String open;
}

/// Forward starting option class
class ForwardStartingOption extends ForwardStartingOptionModel {
  /// Initializes
  ForwardStartingOption({
    @required String close,
    @required String date,
    @required String open,
  }) : super(
          close: close,
          date: date,
          open: open,
        );

  /// Creates an instance from JSON
  factory ForwardStartingOption.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOption(
        close: json['close'],
        date: json['date'],
        open: json['open'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['close'] = close;
    result['date'] = date;
    result['open'] = open;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ForwardStartingOption copyWith({
    String close,
    String date,
    String open,
  }) =>
      ForwardStartingOption(
        close: close ?? this.close,
        date: date ?? this.date,
        open: open ?? this.open,
      );
}
