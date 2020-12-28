/// Active symbols receive model class
abstract class ActiveSymbolsReceiveModel {
  /// Initializes
  ActiveSymbolsReceiveModel({
    @required this.activeSymbols,
  });

  /// List of active symbols.
  final List<ActiveSymbol> activeSymbols;
}

/// Active symbols receive class
class ActiveSymbolsReceive extends ActiveSymbolsReceiveModel {
  /// Initializes
  ActiveSymbolsReceive({
    @required List<ActiveSymbol> activeSymbols,
  }) : super(
          activeSymbols: activeSymbols,
        );

  /// Creates an instance from JSON
  factory ActiveSymbolsReceive.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsReceive(
        activeSymbols: json['active_symbols'] == null
            ? null
            : json['active_symbols']
                .map<ActiveSymbol>(
                    (dynamic item) => ActiveSymbol.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (activeSymbols != null) {
      result['active_symbols'] =
          activeSymbols.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ActiveSymbolsReceive copyWith({
    List<ActiveSymbol> activeSymbols,
  }) =>
      ActiveSymbolsReceive(
        activeSymbols: activeSymbols ?? this.activeSymbols,
      );
}
/// Active symbol model class
abstract class ActiveSymbolModel {
  /// Initializes
  ActiveSymbolModel({
    @required this.allowForwardStarting,
    @required this.delayAmount,
    @required this.displayName,
    @required this.exchangeIsOpen,
    @required this.exchangeName,
    @required this.intradayIntervalMinutes,
    @required this.isTradingSuspended,
    @required this.market,
    @required this.marketDisplayName,
    @required this.pip,
    @required this.quotedCurrencySymbol,
    this.spot,
    @required this.spotAge,
    @required this.spotTime,
    @required this.submarket,
    @required this.submarketDisplayName,
    @required this.symbol,
    @required this.symbolType,
  });

  /// `true` if the symbol is tradable in a forward starting contract, `false` if not.
  final bool allowForwardStarting;

  /// Amount the data feed is delayed (in minutes) due to Exchange licensing requirements. Only returned on `full` active symbols call.
  final int delayAmount;

  /// Display name.
  final String displayName;

  /// `true` if market is currently open, `false` if closed.
  final bool exchangeIsOpen;

  /// Exchange name (for underlyings listed on a Stock Exchange). Only returned on `full` active symbols call.
  final String exchangeName;

  /// Intraday interval minutes. Only returned on `full` active symbols call.
  final int intradayIntervalMinutes;

  /// `true` indicates that trading is currently suspended, `false` if not.
  final bool isTradingSuspended;

  /// Market category (forex, indices, etc).
  final String market;

  /// Translated market name.
  final String marketDisplayName;

  /// Pip size (i.e. minimum fluctuation amount).
  final double pip;

  /// For stock indices, the underlying currency for that instrument. Only returned on `full` active symbols call.
  final String quotedCurrencySymbol;

  /// Latest spot price of the underlying. Only returned on `full` active symbols call.
  final double spot;

  /// Number of seconds elapsed since the last spot price. Only returned on `full` active symbols call.
  final String spotAge;

  /// Latest spot epoch time. Only returned on `full` active symbols call.
  final String spotTime;

  /// Submarket name.
  final String submarket;

  /// Translated submarket name.
  final String submarketDisplayName;

  /// The symbol code for this underlying.
  final String symbol;

  /// Symbol type (forex, commodities, etc).
  final String symbolType;
}

/// Active symbol class
class ActiveSymbol extends ActiveSymbolModel {
  /// Initializes
  ActiveSymbol({
    @required bool allowForwardStarting,
    @required int delayAmount,
    @required String displayName,
    @required bool exchangeIsOpen,
    @required String exchangeName,
    @required int intradayIntervalMinutes,
    @required bool isTradingSuspended,
    @required String market,
    @required String marketDisplayName,
    @required double pip,
    @required String quotedCurrencySymbol,
    double spot,
    @required String spotAge,
    @required String spotTime,
    @required String submarket,
    @required String submarketDisplayName,
    @required String symbol,
    @required String symbolType,
  }) : super(
          allowForwardStarting: allowForwardStarting,
          delayAmount: delayAmount,
          displayName: displayName,
          exchangeIsOpen: exchangeIsOpen,
          exchangeName: exchangeName,
          intradayIntervalMinutes: intradayIntervalMinutes,
          isTradingSuspended: isTradingSuspended,
          market: market,
          marketDisplayName: marketDisplayName,
          pip: pip,
          quotedCurrencySymbol: quotedCurrencySymbol,
          spot: spot,
          spotAge: spotAge,
          spotTime: spotTime,
          submarket: submarket,
          submarketDisplayName: submarketDisplayName,
          symbol: symbol,
          symbolType: symbolType,
        );

  /// Creates an instance from JSON
  factory ActiveSymbol.fromJson(Map<String, dynamic> json) => ActiveSymbol(
        allowForwardStarting: getBool(json['allow_forward_starting']),
        delayAmount: json['delay_amount'],
        displayName: json['display_name'],
        exchangeIsOpen: getBool(json['exchange_is_open']),
        exchangeName: json['exchange_name'],
        intradayIntervalMinutes: json['intraday_interval_minutes'],
        isTradingSuspended: getBool(json['is_trading_suspended']),
        market: json['market'],
        marketDisplayName: json['market_display_name'],
        pip: getDouble(json['pip']),
        quotedCurrencySymbol: json['quoted_currency_symbol'],
        spot: getDouble(json['spot']),
        spotAge: json['spot_age'],
        spotTime: json['spot_time'],
        submarket: json['submarket'],
        submarketDisplayName: json['submarket_display_name'],
        symbol: json['symbol'],
        symbolType: json['symbol_type'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['allow_forward_starting'] = allowForwardStarting;
    result['delay_amount'] = delayAmount;
    result['display_name'] = displayName;
    result['exchange_is_open'] = exchangeIsOpen;
    result['exchange_name'] = exchangeName;
    result['intraday_interval_minutes'] = intradayIntervalMinutes;
    result['is_trading_suspended'] = isTradingSuspended;
    result['market'] = market;
    result['market_display_name'] = marketDisplayName;
    result['pip'] = pip;
    result['quoted_currency_symbol'] = quotedCurrencySymbol;
    result['spot'] = spot;
    result['spot_age'] = spotAge;
    result['spot_time'] = spotTime;
    result['submarket'] = submarket;
    result['submarket_display_name'] = submarketDisplayName;
    result['symbol'] = symbol;
    result['symbol_type'] = symbolType;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ActiveSymbol copyWith({
    bool allowForwardStarting,
    int delayAmount,
    String displayName,
    bool exchangeIsOpen,
    String exchangeName,
    int intradayIntervalMinutes,
    bool isTradingSuspended,
    String market,
    String marketDisplayName,
    double pip,
    String quotedCurrencySymbol,
    double spot,
    String spotAge,
    String spotTime,
    String submarket,
    String submarketDisplayName,
    String symbol,
    String symbolType,
  }) =>
      ActiveSymbol(
        allowForwardStarting: allowForwardStarting ?? this.allowForwardStarting,
        delayAmount: delayAmount ?? this.delayAmount,
        displayName: displayName ?? this.displayName,
        exchangeIsOpen: exchangeIsOpen ?? this.exchangeIsOpen,
        exchangeName: exchangeName ?? this.exchangeName,
        intradayIntervalMinutes:
            intradayIntervalMinutes ?? this.intradayIntervalMinutes,
        isTradingSuspended: isTradingSuspended ?? this.isTradingSuspended,
        market: market ?? this.market,
        marketDisplayName: marketDisplayName ?? this.marketDisplayName,
        pip: pip ?? this.pip,
        quotedCurrencySymbol: quotedCurrencySymbol ?? this.quotedCurrencySymbol,
        spot: spot ?? this.spot,
        spotAge: spotAge ?? this.spotAge,
        spotTime: spotTime ?? this.spotTime,
        submarket: submarket ?? this.submarket,
        submarketDisplayName: submarketDisplayName ?? this.submarketDisplayName,
        symbol: symbol ?? this.symbol,
        symbolType: symbolType ?? this.symbolType,
      );
}
