/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_start_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// CopyStartRequest class
class CopyStartRequest extends Request {
  /// Initialize CopyStartRequest
  const CopyStartRequest({
    this.assets,
    @required this.copyStart,
    this.maxTradeStake,
    this.minTradeStake,
    this.tradeTypes,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'copy_start',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CopyStartRequest.fromJson(Map<String, dynamic> json) =>
      CopyStartRequest(
        assets: json['assets'] as dynamic,
        copyStart: json['copy_start'] as String,
        maxTradeStake: json['max_trade_stake'] as num,
        minTradeStake: json['min_trade_stake'] as num,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
        tradeTypes: json['trade_types'] as dynamic,
      );

  /// [Optional] Used to set assets to be copied. E.x ["frxUSDJPY", "R_50"]
  final dynamic assets;

  /// API tokens identifying the accounts of trader which will be used to copy trades
  final String copyStart;

  /// [Optional] Used to set maximum trade stake to be copied.
  final num maxTradeStake;

  /// [Optional] Used to set minimal trade stake to be copied.
  final num minTradeStake;

  /// [Optional] Used to set trade types to be copied. E.x ["CALL", "PUT"]
  final dynamic tradeTypes;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'assets': assets,
        'copy_start': copyStart,
        'max_trade_stake': maxTradeStake,
        'min_trade_stake': minTradeStake,
        'passthrough': passthrough,
        'req_id': reqId,
        'trade_types': tradeTypes,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStartRequest copyWith({
    dynamic assets,
    String copyStart,
    num maxTradeStake,
    num minTradeStake,
    dynamic tradeTypes,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CopyStartRequest(
        assets: assets ?? this.assets,
        copyStart: copyStart ?? this.copyStart,
        maxTradeStake: maxTradeStake ?? this.maxTradeStake,
        minTradeStake: minTradeStake ?? this.minTradeStake,
        tradeTypes: tradeTypes ?? this.tradeTypes,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
