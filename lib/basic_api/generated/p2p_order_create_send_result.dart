/// P2p order create send model class
abstract class P2pOrderCreateSendModel {
  /// Initializes
  P2pOrderCreateSendModel({
    @required this.p2pOrderCreate,
    @required this.advertId,
    @required this.amount,
    this.contactInfo,
    this.paymentInfo,
    this.subscribe,
  });

  /// Must be 1
  final int p2pOrderCreate;

  /// The unique identifier for the advert to create an order against.
  final String advertId;

  /// The amount of currency to be bought or sold.
  final double amount;

  /// [Optional] Seller contact information. Only applicable for 'sell orders'.
  final String contactInfo;

  /// [Optional] Payment instructions. Only applicable for 'sell orders'.
  final String paymentInfo;

  /// [Optional] If set to 1, will send updates whenever there is an update to the order.
  final int subscribe;
}

/// P2p order create send class
class P2pOrderCreateSend extends P2pOrderCreateSendModel {
  /// Initializes
  P2pOrderCreateSend({
    @required int p2pOrderCreate,
    @required String advertId,
    @required double amount,
    String contactInfo,
    String paymentInfo,
    int subscribe,
  }) : super(
          p2pOrderCreate: p2pOrderCreate,
          advertId: advertId,
          amount: amount,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
          subscribe: subscribe,
        );

  /// Creates an instance from JSON
  factory P2pOrderCreateSend.fromJson(Map<String, dynamic> json) =>
      P2pOrderCreateSend(
        p2pOrderCreate: json['p2p_order_create'],
        advertId: json['advert_id'],
        amount: getDouble(json['amount']),
        contactInfo: json['contact_info'],
        paymentInfo: json['payment_info'],
        subscribe: json['subscribe'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_order_create'] = p2pOrderCreate;
    result['advert_id'] = advertId;
    result['amount'] = amount;
    result['contact_info'] = contactInfo;
    result['payment_info'] = paymentInfo;
    result['subscribe'] = subscribe;

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderCreateSend copyWith({
    int p2pOrderCreate,
    String advertId,
    double amount,
    String contactInfo,
    String paymentInfo,
    int subscribe,
  }) =>
      P2pOrderCreateSend(
        p2pOrderCreate: p2pOrderCreate ?? this.p2pOrderCreate,
        advertId: advertId ?? this.advertId,
        amount: amount ?? this.amount,
        contactInfo: contactInfo ?? this.contactInfo,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        subscribe: subscribe ?? this.subscribe,
      );
}
