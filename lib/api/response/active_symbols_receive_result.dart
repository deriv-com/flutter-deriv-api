import 'package:meta/meta.dart';

import '../../basic_api/generated/active_symbols_receive.dart';
import '../../basic_api/generated/active_symbols_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Active symbols response model class
abstract class ActiveSymbolsResponseModel {
  /// Initializes
  ActiveSymbolsResponseModel({
    @required this.activeSymbols,
  });

  /// List of active symbols.
  final List<ActiveSymbolsItem> activeSymbols;
}

/// Active symbols response class
class ActiveSymbolsResponse extends ActiveSymbolsResponseModel {
  /// Initializes
  ActiveSymbolsResponse({
    @required List<ActiveSymbolsItem> activeSymbols,
  }) : super(
          activeSymbols: activeSymbols,
        );

  /// Creates an instance from JSON
  factory ActiveSymbolsResponse.fromJson(
    dynamic activeSymbolsJson,
  ) =>
      ActiveSymbolsResponse(
        activeSymbols: activeSymbolsJson == null
            ? null
            : List<ActiveSymbolsItem>.from(activeSymbolsJson
                .map((dynamic item) => ActiveSymbolsItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (activeSymbols != null) {
      resultMap['active_symbols'] = activeSymbols
          .map<dynamic>((ActiveSymbolsItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of active symbols.
  ///
  /// For parameters information refer to [ActiveSymbolsRequest].
  /// Throws an [ActiveSymbolsException] if API response contains an error
  static Future<ActiveSymbolsResponse> fetchActiveSymbols(
    ActiveSymbolsSend request,
  ) async {
    final ActiveSymbolsReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ActiveSymbolsException(baseExceptionModel: baseExceptionModel),
    );

    return ActiveSymbolsResponse.fromJson(response.activeSymbols);
  }

  /// Creates a copy of instance with given parameters
  ActiveSymbolsResponse copyWith({
    List<ActiveSymbolsItem> activeSymbols,
  }) =>
      ActiveSymbolsResponse(
        activeSymbols: activeSymbols ?? this.activeSymbols,
      );
}

/// Active symbols item model class
abstract class ActiveSymbolsItemModel {
  /// Initializes
  ActiveSymbolsItemModel({
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

/// Active symbols item class
class ActiveSymbolsItem extends ActiveSymbolsItemModel {
  /// Initializes
  ActiveSymbolsItem({
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
  factory ActiveSymbolsItem.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsItem(
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['allow_forward_starting'] = allowForwardStarting;
    resultMap['delay_amount'] = delayAmount;
    resultMap['display_name'] = displayName;
    resultMap['exchange_is_open'] = exchangeIsOpen;
    resultMap['exchange_name'] = exchangeName;
    resultMap['intraday_interval_minutes'] = intradayIntervalMinutes;
    resultMap['is_trading_suspended'] = isTradingSuspended;
    resultMap['market'] = market;
    resultMap['market_display_name'] = marketDisplayName;
    resultMap['pip'] = pip;
    resultMap['quoted_currency_symbol'] = quotedCurrencySymbol;
    resultMap['spot'] = spot;
    resultMap['spot_age'] = spotAge;
    resultMap['spot_time'] = spotTime;
    resultMap['submarket'] = submarket;
    resultMap['submarket_display_name'] = submarketDisplayName;
    resultMap['symbol'] = symbol;
    resultMap['symbol_type'] = symbolType;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ActiveSymbolsItem copyWith({
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
      ActiveSymbolsItem(
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
