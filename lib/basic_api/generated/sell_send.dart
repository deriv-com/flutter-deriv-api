/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Sell request class.
class SellRequest extends Request {
  /// Initialize SellRequest.
  const SellRequest({
    required this.price,
    required this.sell,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'sell',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory SellRequest.fromJson(Map<String, dynamic> json) => SellRequest(
        price: json['price'] as num?,
        sell: json['sell'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Minimum price at which to sell the contract, or `0` for 'sell at market'.
  final num? price;

  /// Pass contract_id received from the `portfolio` call.
  final int? sell;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'price': price,
        'sell': sell,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SellRequest copyWith({
    num? price,
    int? sell,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SellRequest(
        price: price ?? this.price,
        sell: sell ?? this.sell,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
