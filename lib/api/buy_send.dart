/// generated automatically from flutter_deriv_api|lib/api/buy_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'buy_send.g.dart';

/// JSON conversion for 'buy_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class BuyRequest extends Request {
  /// Initialize BuyRequest
  const BuyRequest({
    this.buy,
    this.parameters,
    this.price,
    this.subscribe,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'buy',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory BuyRequest.fromJson(Map<String, dynamic> json) =>
      _$BuyRequestFromJson(json);

  // Properties
  /// Either the ID received from a Price Proposal (`proposal` call), or `1` if contract buy parameters are passed in the `parameters` field.
  final String buy;

  /// [Optional] Used to pass the parameters for contract buy.
  final Map<String, dynamic> parameters;

  /// Maximum price at which to purchase the contract.
  final num price;

  /// [Optional] `1` to stream.
  final int subscribe;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$BuyRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  BuyRequest copyWith({
    String buy,
    Map<String, dynamic> parameters,
    num price,
    int subscribe,
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
