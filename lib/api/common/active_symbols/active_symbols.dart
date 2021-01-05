import 'package:flutter_deriv_api/api/common/active_symbols/exceptions/active_symbols_exception.dart';
import 'package:flutter_deriv_api/api/common/models/active_symbols_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

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

  /// Generates an instance from JSON
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
        spotTime: getDateTimeFromString(json['spot_time']),
        submarket: json['submarket'],
        submarketDisplayName: json['submarket_display_name'],
        symbol: json['symbol'],
        symbolType: json['symbol_type'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of active symbols.
  ///
  /// For parameters information refer to [ActiveSymbolsRequest].
  /// Throws an [ActiveSymbolsException] if API response contains an error
  static Future<List<ActiveSymbol>> fetchActiveSymbols(
    ActiveSymbolsRequest request,
  ) async {
    final ActiveSymbolsResponse response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ActiveSymbolsException(baseExceptionModel: baseExceptionModel),
    );

    return response.activeSymbols
        .map<ActiveSymbol>(
            (dynamic symbolEntry) => ActiveSymbol.fromJson(symbolEntry))
        .toList();
  }

  /// Generates a copy of instance with given parameters
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
