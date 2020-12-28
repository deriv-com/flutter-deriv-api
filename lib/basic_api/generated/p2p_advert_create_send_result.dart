/// P2p advert create send model class
abstract class P2pAdvertCreateSendModel {
  /// Initializes
  P2pAdvertCreateSendModel({
    @required this.p2pAdvertCreate,
    @required this.amount,
    this.contactInfo,
    this.description,
    this.localCurrency,
    @required this.maxOrderAmount,
    @required this.minOrderAmount,
    this.paymentInfo,
    @required this.paymentMethod,
    @required this.rate,
    @required this.type,
  });

  /// Must be 1
  final int p2pAdvertCreate;

  /// The total amount of the advert, in advertiser's account currency.
  final double amount;

  /// [Optional] Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// [Optional] General information about the advert.
  final String description;

  /// [Optional] Local currency for this advert. If not provided, will use the currency of client's residence by default.
  final String localCurrency;

  /// Maximum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be less than or equal to total `amount` of the advert.
  final double maxOrderAmount;

  /// Minimum allowed amount for the orders of this advert, in advertiser's `account_currency`. Should be less than `max_order_amount`.
  final double minOrderAmount;

  /// [Optional] Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// The payment method.
  final PaymentMethodEnum paymentMethod;

  /// Conversion rate from advertiser's account currency to `local_currency`.
  final double rate;

  /// Whether this is a buy or a sell.
  final TypeEnum type;
}

/// P2p advert create send class
class P2pAdvertCreateSend extends P2pAdvertCreateSendModel {
  /// Initializes
  P2pAdvertCreateSend({
    @required int p2pAdvertCreate,
    @required double amount,
    String contactInfo,
    String description,
    String localCurrency,
    @required double maxOrderAmount,
    @required double minOrderAmount,
    String paymentInfo,
    @required String paymentMethod,
    @required double rate,
    @required String type,
  }) : super(
          p2pAdvertCreate: p2pAdvertCreate,
          amount: amount,
          contactInfo: contactInfo,
          description: description,
          localCurrency: localCurrency,
          maxOrderAmount: maxOrderAmount,
          minOrderAmount: minOrderAmount,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          rate: rate,
          type: type,
        );

  /// Creates an instance from JSON
  factory P2pAdvertCreateSend.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreateSend(
        p2pAdvertCreate: json['p2p_advert_create'],
        amount: getDouble(json['amount']),
        contactInfo: json['contact_info'],
        description: json['description'],
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount']),
        minOrderAmount: getDouble(json['min_order_amount']),
        paymentInfo: json['payment_info'],
        paymentMethod: json['payment_method'] == null
            ? null
            : paymentMethodEnumMapper.entries
                .firstWhere((entry) => entry.value == json['payment_method'],
                    orElse: () => null)
                ?.key,
        rate: getDouble(json['rate']),
        type: json['type'] == null
            ? null
            : typeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['type'],
                    orElse: () => null)
                ?.key,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['p2p_advert_create'] = p2pAdvertCreate;
    result['amount'] = amount;
    result['contact_info'] = contactInfo;
    result['description'] = description;
    result['local_currency'] = localCurrency;
    result['max_order_amount'] = maxOrderAmount;
    result['min_order_amount'] = minOrderAmount;
    result['payment_info'] = paymentInfo;
    result['payment_method'] = paymentMethodEnumMapper[paymentMethod];
    result['rate'] = rate;
    result['type'] = typeEnumMapper[type];

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertCreateSend copyWith({
    int p2pAdvertCreate,
    double amount,
    String contactInfo,
    String description,
    String localCurrency,
    double maxOrderAmount,
    double minOrderAmount,
    String paymentInfo,
    String paymentMethod,
    double rate,
    String type,
  }) =>
      P2pAdvertCreateSend(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
        amount: amount ?? this.amount,
        contactInfo: contactInfo ?? this.contactInfo,
        description: description ?? this.description,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        rate: rate ?? this.rate,
        type: type ?? this.type,
      );
  // Creating Enum Mappers

  static final Map<PaymentMethodEnum, String> paymentMethodEnumMapper = {
    PaymentMethodEnum.bank_transfer: 'bank_transfer',
  };

  static final Map<TypeEnum, String> typeEnumMapper = {
    TypeEnum.buy: 'buy',
    TypeEnum.sell: 'sell',
  };
}

// Creating Enums

enum PaymentMethodEnum {
  bank_transfer,
}

enum TypeEnum {
  buy,
  sell,
}
