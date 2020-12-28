/// P2p advert update receive model class
abstract class P2pAdvertUpdateReceiveModel {
  /// Initializes
  P2pAdvertUpdateReceiveModel({
    @required this.p2pAdvertUpdate,
  });

  /// P2P updated advert information.
  final P2pAdvertUpdate p2pAdvertUpdate;
}

/// P2p advert update receive class
class P2pAdvertUpdateReceive extends P2pAdvertUpdateReceiveModel {
  /// Initializes
  P2pAdvertUpdateReceive({
    @required P2pAdvertUpdate p2pAdvertUpdate,
  }) : super(
          p2pAdvertUpdate: p2pAdvertUpdate,
        );

  /// Creates an instance from JSON
  factory P2pAdvertUpdateReceive.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdateReceive(
        p2pAdvertUpdate: json['p2p_advert_update'] == null
            ? null
            : P2pAdvertUpdate.fromJson(json['p2p_advert_update']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (p2pAdvertUpdate != null) {
      result['p2p_advert_update'] = p2pAdvertUpdate.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertUpdateReceive copyWith({
    P2pAdvertUpdate p2pAdvertUpdate,
  }) =>
      P2pAdvertUpdateReceive(
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
      );
}
/// P2p advert update model class
abstract class P2pAdvertUpdateModel {
  /// Initializes
  P2pAdvertUpdateModel({
    @required this.accountCurrency,
    @required this.advertiserDetails,
    @required this.amount,
    @required this.amountDisplay,
    @required this.contactInfo,
    @required this.counterpartyType,
    @required this.country,
    @required this.createdTime,
    @required this.description,
    @required this.id,
    @required this.isActive,
    @required this.localCurrency,
    @required this.maxOrderAmount,
    @required this.maxOrderAmountDisplay,
    @required this.minOrderAmount,
    @required this.minOrderAmountDisplay,
    @required this.paymentInfo,
    @required this.paymentMethod,
    @required this.price,
    @required this.priceDisplay,
    @required this.rate,
    @required this.rateDisplay,
    @required this.remainingAmount,
    @required this.remainingAmountDisplay,
    @required this.type,
  });

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String contactInfo;

  /// Type of transaction from the opposite party's perspective.
  final CounterpartyTypeEnum counterpartyType;

  /// The target country code of the advert.
  final String country;

  /// The advert creation time in epoch.
  final int createdTime;

  /// General information about the advert.
  final String description;

  /// The unique identifier for this advert.
  final String id;

  /// The activation status of the advert.
  final bool isActive;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String localCurrency;

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String maxOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String minOrderAmountDisplay;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String paymentInfo;

  /// The payment method.
  final PaymentMethodEnum paymentMethod;

  /// Cost of the advert in local currency.
  final double price;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Conversion rate from account currency to local currency.
  final double rate;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Amount currently available for orders, in `account_currency`. It is only visible for advertisers.
  final double remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String remainingAmountDisplay;

  /// Whether this is a buy or a sell.
  final TypeEnum type;
}

/// P2p advert update class
class P2pAdvertUpdate extends P2pAdvertUpdateModel {
  /// Initializes
  P2pAdvertUpdate({
    @required String accountCurrency,
    @required AdvertiserDetails advertiserDetails,
    @required double amount,
    @required String amountDisplay,
    @required String contactInfo,
    @required String counterpartyType,
    @required String country,
    @required int createdTime,
    @required String description,
    @required String id,
    @required bool isActive,
    @required String localCurrency,
    @required double maxOrderAmount,
    @required String maxOrderAmountDisplay,
    @required double minOrderAmount,
    @required String minOrderAmountDisplay,
    @required String paymentInfo,
    @required String paymentMethod,
    @required double price,
    @required String priceDisplay,
    @required double rate,
    @required String rateDisplay,
    @required double remainingAmount,
    @required String remainingAmountDisplay,
    @required String type,
  }) : super(
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          localCurrency: localCurrency,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
        );

  /// Creates an instance from JSON
  factory P2pAdvertUpdate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdate(
        accountCurrency: json['account_currency'],
        advertiserDetails: json['advertiser_details'] == null
            ? null
            : AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        counterpartyType: json['counterparty_type'] == null
            ? null
            : counterpartyTypeEnumMapper.entries
                .firstWhere((entry) => entry.value == json['counterparty_type'],
                    orElse: () => null)
                ?.key,
        country: json['country'],
        createdTime: json['created_time'],
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active']),
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount']),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
        paymentInfo: json['payment_info'],
        paymentMethod: json['payment_method'] == null
            ? null
            : paymentMethodEnumMapper.entries
                .firstWhere((entry) => entry.value == json['payment_method'],
                    orElse: () => null)
                ?.key,
        price: getDouble(json['price']),
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate']),
        rateDisplay: json['rate_display'],
        remainingAmount: getDouble(json['remaining_amount']),
        remainingAmountDisplay: json['remaining_amount_display'],
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

    result['account_currency'] = accountCurrency;
    if (advertiserDetails != null) {
      result['advertiser_details'] = advertiserDetails.toJson();
    }
    result['amount'] = amount;
    result['amount_display'] = amountDisplay;
    result['contact_info'] = contactInfo;
    result['counterparty_type'] = counterpartyTypeEnumMapper[counterpartyType];
    result['country'] = country;
    result['created_time'] = createdTime;
    result['description'] = description;
    result['id'] = id;
    result['is_active'] = isActive;
    result['local_currency'] = localCurrency;
    result['max_order_amount'] = maxOrderAmount;
    result['max_order_amount_display'] = maxOrderAmountDisplay;
    result['min_order_amount'] = minOrderAmount;
    result['min_order_amount_display'] = minOrderAmountDisplay;
    result['payment_info'] = paymentInfo;
    result['payment_method'] = paymentMethodEnumMapper[paymentMethod];
    result['price'] = price;
    result['price_display'] = priceDisplay;
    result['rate'] = rate;
    result['rate_display'] = rateDisplay;
    result['remaining_amount'] = remainingAmount;
    result['remaining_amount_display'] = remainingAmountDisplay;
    result['type'] = typeEnumMapper[type];

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertUpdate copyWith({
    String accountCurrency,
    AdvertiserDetails advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    String counterpartyType,
    String country,
    int createdTime,
    String description,
    String id,
    bool isActive,
    String localCurrency,
    double maxOrderAmount,
    String maxOrderAmountDisplay,
    double minOrderAmount,
    String minOrderAmountDisplay,
    String paymentInfo,
    String paymentMethod,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    double remainingAmount,
    String remainingAmountDisplay,
    String type,
  }) =>
      P2pAdvertUpdate(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        description: description ?? this.description,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountDisplay:
            maxOrderAmountDisplay ?? this.maxOrderAmountDisplay,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
        type: type ?? this.type,
      );
  // Creating Enum Mappers

  static final Map<CounterpartyTypeEnum, String> counterpartyTypeEnumMapper = {
    CounterpartyTypeEnum.buy: 'buy',
    CounterpartyTypeEnum.sell: 'sell',
  };

  static final Map<PaymentMethodEnum, String> paymentMethodEnumMapper = {
    PaymentMethodEnum.bank_transfer: 'bank_transfer',
  };

  static final Map<TypeEnum, String> typeEnumMapper = {
    TypeEnum.buy: 'buy',
    TypeEnum.sell: 'sell',
  };
}

// Creating Enums

enum CounterpartyTypeEnum {
  buy,
  sell,
}

enum PaymentMethodEnum {
  bank_transfer,
}

enum TypeEnum {
  buy,
  sell,
}
/// Advertiser details model class
abstract class AdvertiserDetailsModel {
  /// Initializes
  AdvertiserDetailsModel({
    @required this.firstName,
    @required this.id,
    @required this.lastName,
    @required this.name,
  });

  /// The advertiser's first name.
  final String firstName;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's last name.
  final String lastName;

  /// The advertiser's displayed name.
  final String name;
}

/// Advertiser details class
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes
  AdvertiserDetails({
    @required String firstName,
    @required String id,
    @required String lastName,
    @required String name,
  }) : super(
          firstName: firstName,
          id: id,
          lastName: lastName,
          name: name,
        );

  /// Creates an instance from JSON
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        firstName: json['first_name'],
        id: json['id'],
        lastName: json['last_name'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['first_name'] = firstName;
    result['id'] = id;
    result['last_name'] = lastName;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AdvertiserDetails copyWith({
    String firstName,
    String id,
    String lastName,
    String name,
  }) =>
      AdvertiserDetails(
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        name: name ?? this.name,
      );
}
