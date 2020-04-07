///
abstract class ActiveSymbolModel {
  ///
  ActiveSymbolModel(
    this.allowForwardStarting,
    this.delayAmount,
    this.displayName,
    this.exchangeIsOpen,
    this.exchangeName,
    this.intradayIntervalMinutes,
    this.isTradingSuspended,
    this.market,
    this.marketDisplayName,
    this.pip,
    this.quotedCurrencySymbol,
    this.spot,
    this.spotAge,
    this.spotTime,
    this.submarket,
    this.submarketDisplayName,
    this.symbol,
    this.symbolType,
  );

  /// `1` if the symbol is tradable in a forward starting contract, `0` if not.
  final int allowForwardStarting;

  /// Amount the data feed is delayed (in minutes) due to Exchange licensing requirements. Only returned on `full` active symbols call.
  final int delayAmount;

  /// Display name.
  final String displayName;

  /// `1` if market is currently open, `0` if closed.
  final int exchangeIsOpen;

  /// Exchange name (for underlyings listed on a Stock Exchange). Only returned on `full` active symbols call.
  final String exchangeName;

  /// Intraday interval minutes. Only returned on `full` active symbols call.
  final int intradayIntervalMinutes;

  /// `1` indicates that trading is currently suspended, `0` if not.
  final int isTradingSuspended;

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
