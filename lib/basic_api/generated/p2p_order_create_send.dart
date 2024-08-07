/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/p2p_order_create_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// P2p order create request class.
class P2pOrderCreateRequest extends Request {
  /// Initialize P2pOrderCreateRequest.
  const P2pOrderCreateRequest({
    required this.advertId,
    required this.amount,
    this.contactInfo,
    this.loginid,
    this.p2pOrderCreate = true,
    this.paymentInfo,
    required this.paymentMethodIds,
    this.rate,
    this.subscribe,
    super.msgType = 'p2p_order_create',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory P2pOrderCreateRequest.fromJson(Map<String, dynamic> json) =>
      P2pOrderCreateRequest(
        advertId: json['advert_id'] as String?,
        amount: json['amount'] as num?,
        contactInfo: json['contact_info'] as String?,
        loginid: json['loginid'] as String?,
        p2pOrderCreate: json['p2p_order_create'] == null
            ? null
            : json['p2p_order_create'] == 1,
        paymentInfo: json['payment_info'] as String?,
        paymentMethodIds: (json['payment_method_ids'] as List<dynamic>?)
            ?.map<int>((dynamic item) => item as int)
            .toList(),
        rate: json['rate'] as num?,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The unique identifier for the advert to create an order against.
  final String? advertId;

  /// The amount of currency to be bought or sold.
  final num? amount;

  /// [Optional] Seller contact information. Only applicable for 'sell orders'.
  final String? contactInfo;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// Must be `true`
  final bool? p2pOrderCreate;

  /// [Optional] Payment instructions, only applicable for sell orders.
  final String? paymentInfo;

  /// IDs of payment methods, only applicable for sell orders.
  final List<int>? paymentMethodIds;

  /// [Optional] Conversion rate from account currency to local currency, only applicable for floating rate adverts.
  final num? rate;

  /// [Optional] If set to `true`, will send updates whenever there is an update to the order.
  final bool? subscribe;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'advert_id': advertId,
        'amount': amount,
        'contact_info': contactInfo,
        'loginid': loginid,
        'p2p_order_create': p2pOrderCreate == null
            ? null
            : p2pOrderCreate!
                ? 1
                : 0,
        'payment_info': paymentInfo,
        'payment_method_ids': paymentMethodIds,
        'rate': rate,
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
  P2pOrderCreateRequest copyWith({
    String? advertId,
    num? amount,
    String? contactInfo,
    String? loginid,
    bool? p2pOrderCreate,
    String? paymentInfo,
    List<int>? paymentMethodIds,
    num? rate,
    bool? subscribe,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      P2pOrderCreateRequest(
        advertId: advertId ?? this.advertId,
        amount: amount ?? this.amount,
        contactInfo: contactInfo ?? this.contactInfo,
        loginid: loginid ?? this.loginid,
        p2pOrderCreate: p2pOrderCreate ?? this.p2pOrderCreate,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethodIds: paymentMethodIds ?? this.paymentMethodIds,
        rate: rate ?? this.rate,
        subscribe: subscribe ?? this.subscribe,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
