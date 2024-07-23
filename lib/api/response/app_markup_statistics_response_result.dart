// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// App markup statistics response model class.
abstract class AppMarkupStatisticsResponseModel {
  /// Initializes App markup statistics response model class .
  const AppMarkupStatisticsResponseModel({
    this.appMarkupStatistics,
  });

  /// App Markup transaction statistics
  final AppMarkupStatistics? appMarkupStatistics;
}

/// App markup statistics response class.
class AppMarkupStatisticsResponse extends AppMarkupStatisticsResponseModel {
  /// Initializes App markup statistics response class.
  const AppMarkupStatisticsResponse({
    super.appMarkupStatistics,
  });

  /// Creates an instance from JSON.
  factory AppMarkupStatisticsResponse.fromJson(
    dynamic appMarkupStatisticsJson,
  ) =>
      AppMarkupStatisticsResponse(
        appMarkupStatistics: appMarkupStatisticsJson == null
            ? null
            : AppMarkupStatistics.fromJson(appMarkupStatisticsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (appMarkupStatistics != null) {
      resultMap['app_markup_statistics'] = appMarkupStatistics!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AppMarkupStatisticsResponse copyWith({
    AppMarkupStatistics? appMarkupStatistics,
  }) =>
      AppMarkupStatisticsResponse(
        appMarkupStatistics: appMarkupStatistics ?? this.appMarkupStatistics,
      );
}

/// App markup statistics model class.
abstract class AppMarkupStatisticsModel {
  /// Initializes App markup statistics model class .
  const AppMarkupStatisticsModel({
    this.breakdown,
    this.totalAppMarkupUsd,
    this.totalTransactionsCount,
  });

  /// Array of summed app markups grouped by app_id
  final List<BreakdownItem>? breakdown;

  /// The sum of markup the client paid in USD
  final double? totalAppMarkupUsd;

  /// The total count of transactions
  final double? totalTransactionsCount;
}

/// App markup statistics class.
class AppMarkupStatistics extends AppMarkupStatisticsModel {
  /// Initializes App markup statistics class.
  const AppMarkupStatistics({
    super.breakdown,
    super.totalAppMarkupUsd,
    super.totalTransactionsCount,
  });

  /// Creates an instance from JSON.
  factory AppMarkupStatistics.fromJson(Map<String, dynamic> json) =>
      AppMarkupStatistics(
        breakdown: json['breakdown'] == null
            ? null
            : List<BreakdownItem>.from(
                json['breakdown']?.map(
                  (dynamic item) => BreakdownItem.fromJson(item),
                ),
              ),
        totalAppMarkupUsd: getDouble(json['total_app_markup_usd']),
        totalTransactionsCount: getDouble(json['total_transactions_count']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (breakdown != null) {
      resultMap['breakdown'] = breakdown!
          .map<dynamic>(
            (BreakdownItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['total_app_markup_usd'] = totalAppMarkupUsd;
    resultMap['total_transactions_count'] = totalTransactionsCount;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AppMarkupStatistics copyWith({
    List<BreakdownItem>? breakdown,
    double? totalAppMarkupUsd,
    double? totalTransactionsCount,
  }) =>
      AppMarkupStatistics(
        breakdown: breakdown ?? this.breakdown,
        totalAppMarkupUsd: totalAppMarkupUsd ?? this.totalAppMarkupUsd,
        totalTransactionsCount:
            totalTransactionsCount ?? this.totalTransactionsCount,
      );
}

/// Breakdown item model class.
abstract class BreakdownItemModel {
  /// Initializes Breakdown item model class .
  const BreakdownItemModel({
    this.appId,
    this.appMarkupUsd,
    this.appMarkupValue,
    this.devCurrcode,
    this.transactionsCount,
  });

  /// ID of the application where this contract was purchased.
  final int? appId;

  /// The sum of markup the client paid in USD
  final double? appMarkupUsd;

  /// The sum of markup the client paid in developer's currency
  final double? appMarkupValue;

  /// Currency code of the app developer
  final String? devCurrcode;

  /// The count of app transactions
  final double? transactionsCount;
}

/// Breakdown item class.
class BreakdownItem extends BreakdownItemModel {
  /// Initializes Breakdown item class.
  const BreakdownItem({
    super.appId,
    super.appMarkupUsd,
    super.appMarkupValue,
    super.devCurrcode,
    super.transactionsCount,
  });

  /// Creates an instance from JSON.
  factory BreakdownItem.fromJson(Map<String, dynamic> json) => BreakdownItem(
        appId: json['app_id'],
        appMarkupUsd: getDouble(json['app_markup_usd']),
        appMarkupValue: getDouble(json['app_markup_value']),
        devCurrcode: json['dev_currcode'],
        transactionsCount: getDouble(json['transactions_count']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_id'] = appId;
    resultMap['app_markup_usd'] = appMarkupUsd;
    resultMap['app_markup_value'] = appMarkupValue;
    resultMap['dev_currcode'] = devCurrcode;
    resultMap['transactions_count'] = transactionsCount;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  BreakdownItem copyWith({
    int? appId,
    double? appMarkupUsd,
    double? appMarkupValue,
    String? devCurrcode,
    double? transactionsCount,
  }) =>
      BreakdownItem(
        appId: appId ?? this.appId,
        appMarkupUsd: appMarkupUsd ?? this.appMarkupUsd,
        appMarkupValue: appMarkupValue ?? this.appMarkupValue,
        devCurrcode: devCurrcode ?? this.devCurrcode,
        transactionsCount: transactionsCount ?? this.transactionsCount,
      );
}
