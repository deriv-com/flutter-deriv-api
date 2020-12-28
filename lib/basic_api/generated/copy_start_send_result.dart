/// Copy start send model class
abstract class CopyStartSendModel {
  /// Initializes
  CopyStartSendModel({
    @required this.copyStart,
    this.assets,
    this.maxTradeStake,
    this.minTradeStake,
    this.tradeTypes,
  });

  /// API tokens identifying the accounts of trader which will be used to copy trades
  final String copyStart;

  /// [Optional] Used to set assets to be copied. E.x ["frxUSDJPY", "R_50"]
  final UNKNOWN_TYPE assets;

  /// [Optional] Used to set maximum trade stake to be copied.
  final double maxTradeStake;

  /// [Optional] Used to set minimal trade stake to be copied.
  final double minTradeStake;

  /// [Optional] Used to set trade types to be copied. E.x ["CALL", "PUT"]
  final UNKNOWN_TYPE tradeTypes;
}

/// Copy start send class
class CopyStartSend extends CopyStartSendModel {
  /// Initializes
  CopyStartSend({
    @required String copyStart,
    UNKNOWN_TYPE assets,
    double maxTradeStake,
    double minTradeStake,
    UNKNOWN_TYPE tradeTypes,
  }) : super(
          copyStart: copyStart,
          assets: assets,
          maxTradeStake: maxTradeStake,
          minTradeStake: minTradeStake,
          tradeTypes: tradeTypes,
        );

  /// Creates an instance from JSON
  factory CopyStartSend.fromJson(Map<String, dynamic> json) => CopyStartSend(
        copyStart: json['copy_start'],
        assets: json['assets'],
        maxTradeStake: getDouble(json['max_trade_stake']),
        minTradeStake: getDouble(json['min_trade_stake']),
        tradeTypes: json['trade_types'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['copy_start'] = copyStart;
    result['assets'] = assets;
    result['max_trade_stake'] = maxTradeStake;
    result['min_trade_stake'] = minTradeStake;
    result['trade_types'] = tradeTypes;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopyStartSend copyWith({
    String copyStart,
    UNKNOWN_TYPE assets,
    double maxTradeStake,
    double minTradeStake,
    UNKNOWN_TYPE tradeTypes,
  }) =>
      CopyStartSend(
        copyStart: copyStart ?? this.copyStart,
        assets: assets ?? this.assets,
        maxTradeStake: maxTradeStake ?? this.maxTradeStake,
        minTradeStake: minTradeStake ?? this.minTradeStake,
        tradeTypes: tradeTypes ?? this.tradeTypes,
      );
}
