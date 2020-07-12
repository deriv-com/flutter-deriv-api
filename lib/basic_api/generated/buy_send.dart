/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// BuyRequest class
class BuyRequest extends Request {
  /// Initialize BuyRequest
  const BuyRequest({
    @required this.buy,
    this.parameters,
    @required this.price,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'buy',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory BuyRequest.fromJson(Map<String, dynamic> json) => BuyRequest(
        buy: json['buy'] as String,
        parameters: json['parameters'] as Map<String, dynamic>,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        price: json['price'] as num,
        reqId: json['req_id'] as int,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
      );

  /// Either the ID received from a Price Proposal (`proposal` call), or `1` if contract buy parameters are passed in the `parameters` field.
  final String buy;

  /// [Optional] Used to pass the parameters for contract buy.
  final Map<String, dynamic> parameters;

  /// Maximum price at which to purchase the contract.
  final num price;

  /// [Optional] `true` to stream.
  final bool subscribe;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buy': buy,
        'parameters': parameters,
        'passthrough': passthrough,
        'price': price,
        'req_id': reqId,
        'subscribe': subscribe == null ? null : subscribe ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  BuyRequest copyWith({
    String buy,
    Map<String, dynamic> parameters,
    num price,
    bool subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      BuyRequest(
        buy: buy ?? this.buy,
        parameters: parameters ?? this.parameters,
        price: price ?? this.price,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
