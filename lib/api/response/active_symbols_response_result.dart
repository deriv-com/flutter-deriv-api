// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Active symbols response model class.
abstract class ActiveSymbolsResponseModel {
  /// Initializes Active symbols response model class .
  const ActiveSymbolsResponseModel({
    this.activeSymbols,
  });

  /// List of active symbols.
  final List<ActiveSymbolsItem>? activeSymbols;
}

/// Active symbols response class.
class ActiveSymbolsResponse extends ActiveSymbolsResponseModel {
  /// Initializes Active symbols response class.
  const ActiveSymbolsResponse({
    super.activeSymbols,
  });

  /// Creates an instance from JSON.
  factory ActiveSymbolsResponse.fromJson(
    dynamic activeSymbolsJson,
  ) =>
      ActiveSymbolsResponse(
        activeSymbols: activeSymbolsJson == null
            ? null
            : List<ActiveSymbolsItem>.from(
                activeSymbolsJson?.map(
                  (dynamic item) => ActiveSymbolsItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (activeSymbols != null) {
      resultMap['active_symbols'] = activeSymbols!
          .map<dynamic>(
            (ActiveSymbolsItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the list of active symbols.
  ///
  /// For parameters information refer to [ActiveSymbolsRequest].
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<ActiveSymbolsResponse> fetchActiveSymbols(
    ActiveSymbolsRequest request,
  ) async {
    final ActiveSymbolsReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ActiveSymbolsResponse.fromJson(response.activeSymbols);
  }

  /// Creates a copy of instance with given parameters.
  ActiveSymbolsResponse copyWith({
    List<ActiveSymbolsItem>? activeSymbols,
  }) =>
      ActiveSymbolsResponse(
        activeSymbols: activeSymbols ?? this.activeSymbols,
      );
}
/// Active symbols item model class.
abstract class ActiveSymbolsItemModel {
  /// Initializes Active symbols item model class .
  const ActiveSymbolsItemModel({
    required this.symbolType,
    required this.symbol,
    required this.submarketDisplayName,
    required this.submarket,
    required this.subgroupDisplayName,
    required this.subgroup,
    required this.pip,
    required this.marketDisplayName,
    required this.market,
    required this.isTradingSuspended,
    required this.exchangeIsOpen,
    required this.displayOrder,
    required this.displayName,
    this.allowForwardStarting,
    this.delayAmount,
    this.exchangeName,
    this.intradayIntervalMinutes,
    this.quotedCurrencySymbol,
    this.spot,
    this.spotAge,
    this.spotPercentageChange,
    this.spotTime,
  });

  /// Symbol type (forex, commodities, etc).
  final String symbolType;

  /// The symbol code for this underlying.
  final String symbol;

  /// Translated submarket name.
  final String submarketDisplayName;

  /// Submarket name.
  final String submarket;

  /// Translated subgroup name.
  final String subgroupDisplayName;

  /// Subgroup name.
  final String subgroup;

  /// Pip size (i.e. minimum fluctuation amount).
  final double pip;

  /// Translated market name.
  final String marketDisplayName;

  /// Market category (forex, indices, etc).
  final String market;

  /// `true` indicates that trading is currently suspended, `false` if not.
  final bool isTradingSuspended;

  /// `true` if market is currently open, `false` if closed.
  final bool exchangeIsOpen;

  /// Display order.
  final int displayOrder;

  /// Display name.
  final String displayName;

  /// `true` if the symbol is tradable in a forward starting contract, `false` if not.
  final bool? allowForwardStarting;

  /// Amount the data feed is delayed (in minutes) due to Exchange licensing requirements. Only returned on `full` active symbols call.
  final int? delayAmount;

  /// Exchange name (for underlyings listed on a Stock Exchange). Only returned on `full` active symbols call.
  final String? exchangeName;

  /// Intraday interval minutes. Only returned on `full` active symbols call.
  final int? intradayIntervalMinutes;

  /// For stock indices, the underlying currency for that instrument. Only returned on `full` active symbols call.
  final String? quotedCurrencySymbol;

  /// Latest spot price of the underlying. Only returned on `full` active symbols call.
  final double? spot;

  /// Number of seconds elapsed since the last spot price. Only returned on `full` active symbols call.
  final String? spotAge;

  /// Daily percentage for a symbol. Only returned on 'full' active symbols call.
  final String? spotPercentageChange;

  /// Latest spot epoch time. Only returned on `full` active symbols call.
  final String? spotTime;
}

/// Active symbols item class.
class ActiveSymbolsItem extends ActiveSymbolsItemModel {
  /// Initializes Active symbols item class.
  const ActiveSymbolsItem({
    required super.displayName,
    required super.displayOrder,
    required super.exchangeIsOpen,
    required super.isTradingSuspended,
    required super.market,
    required super.marketDisplayName,
    required super.pip,
    required super.subgroup,
    required super.subgroupDisplayName,
    required super.submarket,
    required super.submarketDisplayName,
    required super.symbol,
    required super.symbolType,
    super.allowForwardStarting,
    super.delayAmount,
    super.exchangeName,
    super.intradayIntervalMinutes,
    super.quotedCurrencySymbol,
    super.spot,
    super.spotAge,
    super.spotPercentageChange,
    super.spotTime,
  });

  /// Creates an instance from JSON.
  factory ActiveSymbolsItem.fromJson(Map<String, dynamic> json) =>
      ActiveSymbolsItem(
        displayName: json['display_name'],
        displayOrder: json['display_order'],
        exchangeIsOpen: getBool(json['exchange_is_open'])!,
        isTradingSuspended: getBool(json['is_trading_suspended'])!,
        market: json['market'],
        marketDisplayName: json['market_display_name'],
        pip: getDouble(json['pip'])!,
        subgroup: json['subgroup'],
        subgroupDisplayName: json['subgroup_display_name'],
        submarket: json['submarket'],
        submarketDisplayName: json['submarket_display_name'],
        symbol: json['symbol'],
        symbolType: json['symbol_type'],
        allowForwardStarting: getBool(json['allow_forward_starting']),
        delayAmount: json['delay_amount'],
        exchangeName: json['exchange_name'],
        intradayIntervalMinutes: json['intraday_interval_minutes'],
        quotedCurrencySymbol: json['quoted_currency_symbol'],
        spot: getDouble(json['spot']),
        spotAge: json['spot_age'],
        spotPercentageChange: json['spot_percentage_change'],
        spotTime: json['spot_time'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['display_order'] = displayOrder;
    resultMap['exchange_is_open'] = exchangeIsOpen;
    resultMap['is_trading_suspended'] = isTradingSuspended;
    resultMap['market'] = market;
    resultMap['market_display_name'] = marketDisplayName;
    resultMap['pip'] = pip;
    resultMap['subgroup'] = subgroup;
    resultMap['subgroup_display_name'] = subgroupDisplayName;
    resultMap['submarket'] = submarket;
    resultMap['submarket_display_name'] = submarketDisplayName;
    resultMap['symbol'] = symbol;
    resultMap['symbol_type'] = symbolType;
    resultMap['allow_forward_starting'] = allowForwardStarting;
    resultMap['delay_amount'] = delayAmount;
    resultMap['exchange_name'] = exchangeName;
    resultMap['intraday_interval_minutes'] = intradayIntervalMinutes;
    resultMap['quoted_currency_symbol'] = quotedCurrencySymbol;
    resultMap['spot'] = spot;
    resultMap['spot_age'] = spotAge;
    resultMap['spot_percentage_change'] = spotPercentageChange;
    resultMap['spot_time'] = spotTime;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ActiveSymbolsItem copyWith({
    String? displayName,
    int? displayOrder,
    bool? exchangeIsOpen,
    bool? isTradingSuspended,
    String? market,
    String? marketDisplayName,
    double? pip,
    String? subgroup,
    String? subgroupDisplayName,
    String? submarket,
    String? submarketDisplayName,
    String? symbol,
    String? symbolType,
    bool? allowForwardStarting,
    int? delayAmount,
    String? exchangeName,
    int? intradayIntervalMinutes,
    String? quotedCurrencySymbol,
    double? spot,
    String? spotAge,
    String? spotPercentageChange,
    String? spotTime,
  }) =>
      ActiveSymbolsItem(
        displayName: displayName ?? this.displayName,
        displayOrder: displayOrder ?? this.displayOrder,
        exchangeIsOpen: exchangeIsOpen ?? this.exchangeIsOpen,
        isTradingSuspended: isTradingSuspended ?? this.isTradingSuspended,
        market: market ?? this.market,
        marketDisplayName: marketDisplayName ?? this.marketDisplayName,
        pip: pip ?? this.pip,
        subgroup: subgroup ?? this.subgroup,
        subgroupDisplayName: subgroupDisplayName ?? this.subgroupDisplayName,
        submarket: submarket ?? this.submarket,
        submarketDisplayName: submarketDisplayName ?? this.submarketDisplayName,
        symbol: symbol ?? this.symbol,
        symbolType: symbolType ?? this.symbolType,
        allowForwardStarting: allowForwardStarting ?? this.allowForwardStarting,
        delayAmount: delayAmount ?? this.delayAmount,
        exchangeName: exchangeName ?? this.exchangeName,
        intradayIntervalMinutes:
            intradayIntervalMinutes ?? this.intradayIntervalMinutes,
        quotedCurrencySymbol: quotedCurrencySymbol ?? this.quotedCurrencySymbol,
        spot: spot ?? this.spot,
        spotAge: spotAge ?? this.spotAge,
        spotPercentageChange: spotPercentageChange ?? this.spotPercentageChange,
        spotTime: spotTime ?? this.spotTime,
      );
}
