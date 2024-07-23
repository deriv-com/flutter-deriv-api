/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_start_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Copy start request class.
class CopyStartRequest extends Request {
  /// Initialize CopyStartRequest.
  const CopyStartRequest({
    this.assets,
    required this.copyStart,
    this.loginid,
    this.maxTradeStake,
    this.minTradeStake,
    this.tradeTypes,
    super.msgType = 'copy_start',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CopyStartRequest.fromJson(Map<String, dynamic> json) =>
      CopyStartRequest(
        assets: json['assets'] as dynamic,
        copyStart: json['copy_start'] as String?,
        loginid: json['loginid'] as String?,
        maxTradeStake: json['max_trade_stake'] as num?,
        minTradeStake: json['min_trade_stake'] as num?,
        tradeTypes: json['trade_types'] as dynamic,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] Used to set assets to be copied. E.x ["frxUSDJPY", "R_50"]
  final dynamic assets;

  /// API tokens identifying the accounts of trader which will be used to copy trades
  final String? copyStart;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Used to set maximum trade stake to be copied.
  final num? maxTradeStake;

  /// [Optional] Used to set minimal trade stake to be copied.
  final num? minTradeStake;

  /// [Optional] Used to set trade types to be copied. E.x ["CALL", "PUT"]
  final dynamic tradeTypes;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'assets': assets,
        'copy_start': copyStart,
        'loginid': loginid,
        'max_trade_stake': maxTradeStake,
        'min_trade_stake': minTradeStake,
        'trade_types': tradeTypes,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStartRequest copyWith({
    dynamic assets,
    String? copyStart,
    String? loginid,
    num? maxTradeStake,
    num? minTradeStake,
    dynamic tradeTypes,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CopyStartRequest(
        assets: assets ?? this.assets,
        copyStart: copyStart ?? this.copyStart,
        loginid: loginid ?? this.loginid,
        maxTradeStake: maxTradeStake ?? this.maxTradeStake,
        minTradeStake: minTradeStake ?? this.minTradeStake,
        tradeTypes: tradeTypes ?? this.tradeTypes,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
