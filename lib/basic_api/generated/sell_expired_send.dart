/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_expired_send.json

import '../request.dart';

/// SellExpiredRequest class
class SellExpiredRequest extends Request {
  /// Initialize SellExpiredRequest
  const SellExpiredRequest({
    this.sellExpired = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'sell_expired',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SellExpiredRequest.fromJson(Map<String, dynamic> json) =>
      SellExpiredRequest(
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        sellExpired: json['sell_expired'] as int,
      );

  /// Must be `1`
  final int sellExpired;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'passthrough': passthrough,
        'req_id': reqId,
        'sell_expired': sellExpired,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellExpiredRequest copyWith({
    int sellExpired,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      SellExpiredRequest(
        sellExpired: sellExpired ?? this.sellExpired,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
