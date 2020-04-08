import 'package:flutter_deriv_api/models/active_symbols_model.dart';

/// Active Symbol
class ActiveSymbol extends ActiveSymbolModel {
  /// Initializes
  ActiveSymbol({
    int allowForwardStarting,
    int delayAmount,
    String displayName,
    int exchangeIsOpen,
    String exchangeName,
    int intradayIntervalMinutes,
    int isTradingSuspended,
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
  }) : super(
            allowForwardStarting,
            delayAmount,
            displayName,
            exchangeIsOpen,
            exchangeName,
            intradayIntervalMinutes,
            isTradingSuspended,
            market,
            marketDisplayName,
            pip,
            quotedCurrencySymbol,
            spot,
            spotAge,
            spotTime,
            submarket,
            submarketDisplayName,
            symbol,
            symbolType);

  /// from Json
  factory ActiveSymbol.fromJson(Map<String, dynamic> json) => ActiveSymbol(
        allowForwardStarting: json['allow_forward_starting'],
        delayAmount: json['delay_amount'],
        displayName: json['display_name'],
        exchangeIsOpen: json['exchange_is_open'],
        exchangeName: json['exchange_name'],
        intradayIntervalMinutes: json[''],
        isTradingSuspended: json['is_trading_suspended'],
        market: json['market'],
        marketDisplayName: json['market_display_name'],
        pip: json['pip'],
        quotedCurrencySymbol: json['quoted_currency_symbol'],
        spot: json['spot'],
        spotAge: json['spot_age'],
        spotTime: json['spot_time'],
        submarket: json['submarket'],
        submarketDisplayName: json['submarket_display_name'],
        symbol: json['symbol'],
        symbolType: json['symbol_type'],
      );

  /// Fetch the list of [ActiveSymbol]s
  static Future<List<ActiveSymbol>> getActiveSymbols() async =>
      // TODO(Ramin): call to the actual Api class when its ready
      <ActiveSymbol>[];

  /// Clone a new instance
  ActiveSymbol copyWith({
    int allowForwardStarting,
    int delayAmount,
    String displayName,
    int exchangeIsOpen,
    String exchangeName,
    int intradayIntervalMinutes,
    int isTradingSuspended,
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
