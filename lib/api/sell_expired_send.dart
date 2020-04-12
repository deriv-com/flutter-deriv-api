/// generated automatically from flutter_deriv_api|lib/api/sell_expired_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'sell_expired_send.g.dart';

/// JSON conversion for 'sell_expired_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellExpiredRequest extends Request {
  /// Initialize SellExpiredRequest
  const SellExpiredRequest({
    this.sellExpired = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory SellExpiredRequest.fromJson(Map<String, dynamic> json) =>
      _$SellExpiredRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int sellExpired;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SellExpiredRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SellExpiredRequest copyWith({
    int sellExpired,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      SellExpiredRequest(
        sellExpired: sellExpired ?? this.sellExpired,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
