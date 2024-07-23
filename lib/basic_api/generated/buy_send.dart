/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/buy_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Buy request class.
class BuyRequest extends Request {
  /// Initialize BuyRequest.
  const BuyRequest({
    required this.buy,
    this.loginid,
    this.parameters,
    required this.price,
    this.subscribe,
    super.msgType = 'buy',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory BuyRequest.fromJson(Map<String, dynamic> json) => BuyRequest(
        buy: json['buy'] as String?,
        loginid: json['loginid'] as String?,
        parameters: json['parameters'] as Map<String, dynamic>?,
        price: json['price'] as num?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Either the ID received from a Price Proposal (`proposal` call), or `1` if contract buy parameters are passed in the `parameters` field.
  final String? buy;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// [Optional] Used to pass the parameters for contract buy.
  final Map<String, dynamic>? parameters;

  /// Maximum price at which to purchase the contract.
  final num? price;

  /// [Optional] `true` to stream.
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'buy': buy,
        'loginid': loginid,
        'parameters': parameters,
        'price': price,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  BuyRequest copyWith({
    String? buy,
    String? loginid,
    Map<String, dynamic>? parameters,
    num? price,
    bool? subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      BuyRequest(
        buy: buy ?? this.buy,
        loginid: loginid ?? this.loginid,
        parameters: parameters ?? this.parameters,
        price: price ?? this.price,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
