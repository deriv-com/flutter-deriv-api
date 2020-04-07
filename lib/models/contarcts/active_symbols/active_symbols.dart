import 'package:flutter_deriv_api/models/contarcts/active_symbols/active_symbols_model.dart';

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
  static Future<List<ActiveSymbol>> getActiveSymbols() async {}
}
