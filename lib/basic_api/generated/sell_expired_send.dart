/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_expired_send.json.
// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Sell expired request class.
class SellExpiredRequest extends Request {
  /// Initialize SellExpiredRequest.
  const SellExpiredRequest({
    this.sellExpired = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'sell_expired',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory SellExpiredRequest.fromJson(Map<String, dynamic> json) =>
      SellExpiredRequest(
        sellExpired:
            json['sell_expired'] == null ? null : json['sell_expired'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? sellExpired;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'sell_expired': sellExpired == null
            ? null
            : sellExpired!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellExpiredRequest copyWith({
    bool? sellExpired,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SellExpiredRequest(
        sellExpired: sellExpired ?? this.sellExpired,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
