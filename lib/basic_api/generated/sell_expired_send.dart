/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_expired_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Sell expired send class
class SellExpiredSend extends Request {
  /// Initialize SellExpiredSend
  const SellExpiredSend({
    this.sellExpired = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'sell_expired',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SellExpiredSend.fromJson(Map<String, dynamic> json) =>
      SellExpiredSend(
        sellExpired:
            json['sell_expired'] == null ? null : json['sell_expired'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool sellExpired;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'sell_expired': sellExpired == null
            ? null
            : sellExpired
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellExpiredSend copyWith({
    bool sellExpired,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      SellExpiredSend(
        sellExpired: sellExpired ?? this.sellExpired,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
