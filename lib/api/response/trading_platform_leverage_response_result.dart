// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Trading platform leverage response model class.
abstract class TradingPlatformLeverageResponseModel {
  /// Initializes Trading platform leverage response model class .
  const TradingPlatformLeverageResponseModel({
    this.tradingPlatformLeverage,
  });

  /// Information for dynamic leverage for the requested trading platform
  final TradingPlatformLeverage? tradingPlatformLeverage;
}

/// Trading platform leverage response class.
class TradingPlatformLeverageResponse
    extends TradingPlatformLeverageResponseModel {
  /// Initializes Trading platform leverage response class.
  const TradingPlatformLeverageResponse({
    super.tradingPlatformLeverage,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformLeverageResponse.fromJson(
    dynamic tradingPlatformLeverageJson,
  ) =>
      TradingPlatformLeverageResponse(
        tradingPlatformLeverage: tradingPlatformLeverageJson == null
            ? null
            : TradingPlatformLeverage.fromJson(tradingPlatformLeverageJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingPlatformLeverage != null) {
      resultMap['trading_platform_leverage'] =
          tradingPlatformLeverage!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformLeverageResponse copyWith({
    TradingPlatformLeverage? tradingPlatformLeverage,
  }) =>
      TradingPlatformLeverageResponse(
        tradingPlatformLeverage:
            tradingPlatformLeverage ?? this.tradingPlatformLeverage,
      );
}
/// Trading platform leverage model class.
abstract class TradingPlatformLeverageModel {
  /// Initializes Trading platform leverage model class .
  const TradingPlatformLeverageModel({
    this.leverage,
  });

  /// List of objects containing leverage data by category
  final Map<String, LeverageProperty>? leverage;
}

/// Trading platform leverage class.
class TradingPlatformLeverage extends TradingPlatformLeverageModel {
  /// Initializes Trading platform leverage class.
  const TradingPlatformLeverage({
    super.leverage,
  });

  /// Creates an instance from JSON.
  factory TradingPlatformLeverage.fromJson(Map<String, dynamic> json) =>
      TradingPlatformLeverage(
        leverage: json['leverage'] == null
            ? null
            : Map<String, LeverageProperty>.fromEntries(json['leverage']
                .entries
                .map<MapEntry<String, LeverageProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, LeverageProperty>(entry.key,
                            LeverageProperty.fromJson(entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['leverage'] = leverage;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingPlatformLeverage copyWith({
    Map<String, LeverageProperty>? leverage,
  }) =>
      TradingPlatformLeverage(
        leverage: leverage ?? this.leverage,
      );
}
/// Leverage property model class.
abstract class LeveragePropertyModel {
  /// Initializes Leverage property model class .
  const LeveragePropertyModel({
    this.displayName,
    this.instruments,
    this.max,
    this.min,
    this.volume,
  });

  /// Display name for each category
  final String? displayName;

  /// List of instruments supported for the category
  final List<dynamic>? instruments;

  /// Maximum leverage
  final int? max;

  /// Minimum leverage
  final int? min;

  /// Range of data and its corressponding leverage
  final Volume? volume;
}

/// Leverage property class.
class LeverageProperty extends LeveragePropertyModel {
  /// Initializes Leverage property class.
  const LeverageProperty({
    super.displayName,
    super.instruments,
    super.max,
    super.min,
    super.volume,
  });

  /// Creates an instance from JSON.
  factory LeverageProperty.fromJson(Map<String, dynamic> json) =>
      LeverageProperty(
        displayName: json['display_name'],
        instruments: json['instruments'] == null
            ? null
            : List<dynamic>.from(
                json['instruments']?.map(
                  (dynamic item) => item,
                ),
              ),
        max: json['max'],
        min: json['min'],
        volume: json['volume'] == null ? null : Volume.fromJson(json['volume']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    if (instruments != null) {
      resultMap['instruments'] = instruments!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }
    resultMap['max'] = max;
    resultMap['min'] = min;
    if (volume != null) {
      resultMap['volume'] = volume!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LeverageProperty copyWith({
    String? displayName,
    List<dynamic>? instruments,
    int? max,
    int? min,
    Volume? volume,
  }) =>
      LeverageProperty(
        displayName: displayName ?? this.displayName,
        instruments: instruments ?? this.instruments,
        max: max ?? this.max,
        min: min ?? this.min,
        volume: volume ?? this.volume,
      );
}
/// Volume model class.
abstract class VolumeModel {
  /// Initializes Volume model class .
  const VolumeModel({
    this.data,
    this.unit,
  });

  /// Leverage data
  final List<DataItem>? data;

  /// Measurable unit of leverage
  final String? unit;
}

/// Volume class.
class Volume extends VolumeModel {
  /// Initializes Volume class.
  const Volume({
    super.data,
    super.unit,
  });

  /// Creates an instance from JSON.
  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        data: json['data'] == null
            ? null
            : List<DataItem>.from(
                json['data']?.map(
                  (dynamic item) => DataItem.fromJson(item),
                ),
              ),
        unit: json['unit'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (data != null) {
      resultMap['data'] = data!
          .map<dynamic>(
            (DataItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['unit'] = unit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Volume copyWith({
    List<DataItem>? data,
    String? unit,
  }) =>
      Volume(
        data: data ?? this.data,
        unit: unit ?? this.unit,
      );
}
/// Data item model class.
abstract class DataItemModel {
  /// Initializes Data item model class .
  const DataItemModel({
    this.from,
    this.leverage,
    this.to,
  });

  /// Range start point
  final double? from;

  /// Record leverage
  final int? leverage;

  /// Range end point
  final int? to;
}

/// Data item class.
class DataItem extends DataItemModel {
  /// Initializes Data item class.
  const DataItem({
    super.from,
    super.leverage,
    super.to,
  });

  /// Creates an instance from JSON.
  factory DataItem.fromJson(Map<String, dynamic> json) => DataItem(
        from: getDouble(json['from']),
        leverage: json['leverage'],
        to: json['to'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['from'] = from;
    resultMap['leverage'] = leverage;
    resultMap['to'] = to;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DataItem copyWith({
    double? from,
    int? leverage,
    int? to,
  }) =>
      DataItem(
        from: from ?? this.from,
        leverage: leverage ?? this.leverage,
        to: to ?? this.to,
      );
}
