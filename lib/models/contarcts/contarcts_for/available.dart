/// available contracts details
class Available {
  /// Initializes
  Available({
    this.availableBarriers,
    this.barrier,
    this.barrierCategory,
    this.barriers,
    this.contractCategory,
    this.contractCategoryDisplay,
    this.contractDisplay,
    this.contractType,
    this.exchangeName,
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

  /// From Json
  factory Available.fromJson(Map<String, dynamic> json) => Available(
      availableBarriers: json['available_barriers'],
      barrier: json['barrier'],
      barrierCategory: json['barrier_category'],
      barriers: json['barriers'],
      contractCategory: json['contract_category'],
      contractCategoryDisplay: json['contract_category_display'],
      contractDisplay: json['contract_display'],
      contractType: json['contract_type'],
      exchangeName: json['exchange_name'],
      expiryType: json['expiry_type'],
      forwardStartingOptions: json['forward_starting_options']
          ?.map<ForwardStartingOption>((dynamic entry) =>
              entry == null ? null : ForwardStartingOption.fromJson(entry))
          ?.toList(),
      market: json['market'],
      maxContractDuration: json['max_contract_duration'],
      minContractDuration: json['min_contract_duration'],
      sentiment: json['sentiment'],
      startType: json['start_type'],
      submarket: json['submarket'],
      tradingPeriod: json['trading_period'],
      underlyingSymbol: json['underlying_symbol']);

  /// Array of available barriers for a predefined trading period
  List<int> availableBarriers;

  /// barrier
  String barrier;

  /// Category of barrier.
  String barrierCategory;

  /// Number of barriers.
  int barriers;

  /// Category of the contract.
  String contractCategory;

  /// Category of the contract Display."
  String contractCategoryDisplay;

  /// Type of contract.
  String contractDisplay;

  /// Type of contract.
  String contractType;

  /// Name of exchange
  String exchangeName;

  /// Expiry Type.
  String expiryType;

  /// Array of returned forward starting options
  List<ForwardStartingOption> forwardStartingOptions;

  /// Type of market.
  String market;

  /// Maximum contract duration
  String maxContractDuration;

  /// Minimum contract duration.
  String minContractDuration;

  /// Type of sentiment.
  String sentiment;

  /// Start Type.
  String startType;

  /// Type of submarket.
  String submarket;

  /// A hash of predefined trading period
  Map<String, dynamic> tradingPeriod;

  /// Symbol code
  String underlyingSymbol;
}

/// Forward starting option
class ForwardStartingOption {
  /// Initializes
  ForwardStartingOption(this.close, this.date, this.open);

  /// From Json
  factory ForwardStartingOption.fromJson(Map<String, dynamic> json) =>
      ForwardStartingOption(
        int.parse(json['close']),
        int.parse(json['date']),
        int.parse(json['open']),
      );

  /// The epoch value for the closing date of forward starting session.
  int close;

  /// The epoch value for the date of forward starting session.
  int date;

  /// The epoch value for the opening date of forward starting session.
  int open;
}
