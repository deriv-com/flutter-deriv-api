/// generated automatically from flutter_deriv_api|lib/api/sell_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'sell_send.g.dart';

/// JSON conversion for 'sell_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellRequest extends Request {
  /// Initialize SellRequest
  const SellRequest({
    this.price,
    this.sell = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory SellRequest.fromJson(Map<String, dynamic> json) =>
      _$SellRequestFromJson(json);

  // Properties
  /// Minimum price at which to sell the contract, or `0` for 'sell at market'.
  final num price;

  /// Pass contract_id received from the `portfolio` call.
  final int sell;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SellRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SellRequest copyWith({
    num price,
    int sell,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      SellRequest(
        price: price ?? this.price,
        sell: sell ?? this.sell,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
