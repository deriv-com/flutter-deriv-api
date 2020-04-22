import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/api/models/active_symbols_model.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_receive.dart';
import 'package:flutter_deriv_api/api/contarcts/active_symbols/exceptions/active_symbols_exception.dart';

/// Active Symbol
class ActiveSymbol extends ActiveSymbolModel {
  /// Initializes
  ActiveSymbol({
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
    DateTime spotTime,
    String submarket,
    String submarketDisplayName,
    String symbol,
    String symbolType,
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
            symbolType: symbolType);

  /// from Json
  factory ActiveSymbol.fromJson(Map<String, dynamic> json) => ActiveSymbol(
        allowForwardStarting: getBool(json['allow_forward_starting']),
        delayAmount: json['delay_amount'],
        displayName: json['display_name'],
        exchangeIsOpen: getBool(json['exchange_is_open']),
        exchangeName: json['exchange_name'],
        intradayIntervalMinutes: json[''],
        isTradingSuspended: getBool(json['is_trading_suspended']),
        market: json['market'],
        marketDisplayName: json['market_display_name'],
        pip: json['pip'],
        quotedCurrencySymbol: json['quoted_currency_symbol'],
        spot: json['spot'],
        spotAge: json['spot_age'],
        spotTime: json['spot_time'] != null
            ? getDateTime(int.parse(json['spot_time']))
            : null,
        submarket: json['submarket'],
        submarketDisplayName: json['submarket_display_name'],
        symbol: json['symbol'],
        symbolType: json['symbol_type'],
      );

  /// API instance
  static final BasicBinaryAPI _api =
      Injector.getInjector().get<BasicBinaryAPI>();

  /// Fetch the list of active symbols
  /// For parameters information refer to [ActiveSymbolsRequest]
  static Future<List<ActiveSymbol>> getActiveSymbols({
    String mode = 'brief',
    String landingCompany,
    String productType,
  }) async {
    final ActiveSymbolsResponse activeSymbolsResponse = await _api.call(
      request: ActiveSymbolsRequest(
          activeSymbols: mode,
          landingCompany: landingCompany,
          productType: productType),
    );

    if (activeSymbolsResponse.error != null) {
      throw ActiveSymbolsException(
        message: activeSymbolsResponse.error['message'],
      );
    }

    return activeSymbolsResponse.activeSymbols
        .map<ActiveSymbol>(
            (dynamic symbolEntry) => ActiveSymbol.fromJson(symbolEntry))
        .toList();
  }

  /// Clone a new instance
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
    DateTime spotTime,
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
