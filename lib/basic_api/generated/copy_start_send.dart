/// generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_start_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'copy_start_send.g.dart';

/// JSON conversion for 'copy_start_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopyStartRequest extends Request {
  /// Initialize CopyStartRequest
  const CopyStartRequest({
    this.assets,
    this.copyStart,
    this.maxTradeStake,
    this.minTradeStake,
    this.tradeTypes,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory CopyStartRequest.fromJson(Map<String, dynamic> json) =>
      _$CopyStartRequestFromJson(json);

  // Properties
  /// [Optional] Used to set assets to be copied. E.x ["frxUSDJPY", "R_50"]
  final String assets;

  /// API tokens identifying the accounts of trader which will be used to copy trades
  final String copyStart;

  /// [Optional] Used to set maximum trade stake to be copied.
  final num maxTradeStake;

  /// [Optional] Used to set minimal trade stake to be copied.
  final num minTradeStake;

  /// [Optional] Used to set trade types to be copied. E.x ["CALL", "PUT"]
  final String tradeTypes;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopyStartRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CopyStartRequest copyWith({
    String assets,
    String copyStart,
    num maxTradeStake,
    num minTradeStake,
    String tradeTypes,
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
