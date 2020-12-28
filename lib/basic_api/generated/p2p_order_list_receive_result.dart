/// P2p order list receive model class
abstract class P2pOrderListReceiveModel {
  /// Initializes
  P2pOrderListReceiveModel({
    @required this.p2pOrderList,
    @required this.subscription,
  });

  /// List of P2P orders.
  final P2pOrderList p2pOrderList;

  /// For subscription requests only.
  final Subscription subscription;
}

/// P2p order list receive class
class P2pOrderListReceive extends P2pOrderListReceiveModel {
  /// Initializes
  P2pOrderListReceive({
    @required P2pOrderList p2pOrderList,
    @required Subscription subscription,
  }) : super(
          p2pOrderList: p2pOrderList,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory P2pOrderListReceive.fromJson(Map<String, dynamic> json) =>
      P2pOrderListReceive(
        p2pOrderList: json['p2p_order_list'] == null
            ? null
            : P2pOrderList.fromJson(json['p2p_order_list']),
        subscription: json['subscription'] == null
            ? null
            : Subscription.fromJson(json['subscription']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (p2pOrderList != null) {
      result['p2p_order_list'] = p2pOrderList.toJson();
    }
    if (subscription != null) {
      result['subscription'] = subscription.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderListReceive copyWith({
    P2pOrderList p2pOrderList,
    Subscription subscription,
  }) =>
      P2pOrderListReceive(
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        subscription: subscription ?? this.subscription,
      );
}
/// P2p order list model class
abstract class P2pOrderListModel {
  /// Initializes
  P2pOrderListModel({
    @required this.list,
  });

  /// List of orders.
  final List<List> list;
}

/// P2p order list class
class P2pOrderList extends P2pOrderListModel {
  /// Initializes
  P2pOrderList({
    @required List<List> list,
  }) : super(
          list: list,
        );

  /// Creates an instance from JSON
  factory P2pOrderList.fromJson(Map<String, dynamic> json) => P2pOrderList(
        list: json['list'] == null
            ? null
            : json['list']
                .map<List>((dynamic item) => List.fromJson(item))
                .toList(),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (list != null) {
      result['list'] = list.map((item) => item.toJson()).toList();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderList copyWith({
    List<List> list,
  }) =>
      P2pOrderList(
        list: list ?? this.list,
      );
}
/// List model class
abstract class ListModel {
  /// Initializes
  ListModel({
    @required this.accountCurrency,
    @required this.advertDetails,
    @required this.advertiserDetails,
    @required this.amount,
    @required this.amountDisplay,
    @required this.chatChannelUrl,
    @required this.clientDetails,
    @required this.contactInfo,
    @required this.createdTime,
    @required this.disputeDetails,
    @required this.expiryTime,
    @required this.id,
    @required this.isIncoming,
    @required this.localCurrency,
    @required this.paymentInfo,
    @required this.price,
    @required this.priceDisplay,
    @required this.rate,
    @required this.rateDisplay,
    @required this.status,
    @required this.type,
  });

  /// The currency to be bought or sold.
  final String accountCurrency;

  /// Details of the advert for this order.
  final AdvertDetails advertDetails;

  /// Details of the advertiser for this order.
  final AdvertiserDetails advertiserDetails;

  /// The amount of the order.
  final double amount;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The URL to be used to initialise the chat for this order.
  final String chatChannelUrl;

  /// Details of the client who created the order.
  final ClientDetails clientDetails;

  /// Seller contact information.
  final String contactInfo;

  /// The epoch time of the order creation.
  final int createdTime;

  /// Details of the order dispute.
  final DisputeDetails disputeDetails;

  /// The epoch time in which the order will be expired.
  final int expiryTime;

  /// The unique identifier for this order.
  final String id;

  /// `true` if the order is created for the advert of the current client, otherwise `false`.
  final bool isIncoming;

  /// Local currency for this order.
  final String localCurrency;

  /// Payment instructions.
  final String paymentInfo;

  /// Cost in local currency.
  final double price;

  /// Cost in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Conversion rate of the order.
  final double rate;

  /// Conversion rate of the order, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Current order status.
  final StatusEnum status;

  /// Whether this is a buy or a sell.
  final TypeEnum type;
}

/// List class
class List extends ListModel {
  /// Initializes
  List({
    @required String accountCurrency,
    @required AdvertDetails advertDetails,
    @required AdvertiserDetails advertiserDetails,
    @required double amount,
    @required String amountDisplay,
    @required String chatChannelUrl,
    @required ClientDetails clientDetails,
    @required String contactInfo,
    @required int createdTime,
    @required DisputeDetails disputeDetails,
    @required int expiryTime,
    @required String id,
    @required bool isIncoming,
    @required String localCurrency,
    @required String paymentInfo,
    @required double price,
    @required String priceDisplay,
    @required double rate,
    @required String rateDisplay,
    @required String status,
    @required String type,
  }) : super(
          accountCurrency: accountCurrency,
          advertDetails: advertDetails,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          chatChannelUrl: chatChannelUrl,
          clientDetails: clientDetails,
          contactInfo: contactInfo,
          createdTime: createdTime,
          disputeDetails: disputeDetails,
          expiryTime: expiryTime,
          id: id,
          isIncoming: isIncoming,
          localCurrency: localCurrency,
          paymentInfo: paymentInfo,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          status: status,
          type: type,
        );

  /// Creates an instance from JSON
  factory List.fromJson(Map<String, dynamic> json) => List(
        accountCurrency: json['account_currency'],
        advertDetails: json['advert_details'] == null
            ? null
            : AdvertDetails.fromJson(json['advert_details']),
        advertiserDetails: json['advertiser_details'] == null
            ? null
            : AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        chatChannelUrl: json['chat_channel_url'],
        clientDetails: json['client_details'] == null
            ? null
            : ClientDetails.fromJson(json['client_details']),
        contactInfo: json['contact_info'],
        createdTime: json['created_time'],
        disputeDetails: json['dispute_details'] == null
            ? null
            : DisputeDetails.fromJson(json['dispute_details']),
        expiryTime: json['expiry_time'],
        id: json['id'],
        isIncoming: getBool(json['is_incoming']),
        localCurrency: json['local_currency'],
        paymentInfo: json['payment_info'],
        price: getDouble(json['price']),
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate']),
        rateDisplay: json['rate_display'],
        status: json['status'] == null
            ? null
            : statusEnumMapper.entries
                .firstWhere((entry) => entry.value == json['status'],
                    orElse: () => null)
                ?.key,
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
    if (advertDetails != null) {
      result['advert_details'] = advertDetails.toJson();
    }
    if (advertiserDetails != null) {
      result['advertiser_details'] = advertiserDetails.toJson();
    }
    result['amount'] = amount;
    result['amount_display'] = amountDisplay;
    result['chat_channel_url'] = chatChannelUrl;
    if (clientDetails != null) {
      result['client_details'] = clientDetails.toJson();
    }
    result['contact_info'] = contactInfo;
    result['created_time'] = createdTime;
    if (disputeDetails != null) {
      result['dispute_details'] = disputeDetails.toJson();
    }
    result['expiry_time'] = expiryTime;
    result['id'] = id;
    result['is_incoming'] = isIncoming;
    result['local_currency'] = localCurrency;
    result['payment_info'] = paymentInfo;
    result['price'] = price;
    result['price_display'] = priceDisplay;
    result['rate'] = rate;
    result['rate_display'] = rateDisplay;
    result['status'] = statusEnumMapper[status];
    result['type'] = typeEnumMapper[type];

    return result;
  }

  /// Creates a copy of instance with given parameters
  List copyWith({
    String accountCurrency,
    AdvertDetails advertDetails,
    AdvertiserDetails advertiserDetails,
    double amount,
    String amountDisplay,
    String chatChannelUrl,
    ClientDetails clientDetails,
    String contactInfo,
    int createdTime,
    DisputeDetails disputeDetails,
    int expiryTime,
    String id,
    bool isIncoming,
    String localCurrency,
    String paymentInfo,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    String status,
    String type,
  }) =>
      List(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertDetails: advertDetails ?? this.advertDetails,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        chatChannelUrl: chatChannelUrl ?? this.chatChannelUrl,
        clientDetails: clientDetails ?? this.clientDetails,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        disputeDetails: disputeDetails ?? this.disputeDetails,
        expiryTime: expiryTime ?? this.expiryTime,
        id: id ?? this.id,
        isIncoming: isIncoming ?? this.isIncoming,
        localCurrency: localCurrency ?? this.localCurrency,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        status: status ?? this.status,
        type: type ?? this.type,
      );
  // Creating Enum Mappers

  static final Map<StatusEnum, String> statusEnumMapper = {
    StatusEnum.pending: 'pending',
    StatusEnum.buyer_confirmed: 'buyer-confirmed',
    StatusEnum.cancelled: 'cancelled',
    StatusEnum.timed_out: 'timed-out',
    StatusEnum.blocked: 'blocked',
    StatusEnum.refunded: 'refunded',
    StatusEnum.completed: 'completed',
    StatusEnum.disputed: 'disputed',
    StatusEnum.dispute_refunded: 'dispute-refunded',
    StatusEnum.dispute_completed: 'dispute-completed',
  };

  static final Map<TypeEnum, String> typeEnumMapper = {
    TypeEnum.buy: 'buy',
    TypeEnum.sell: 'sell',
  };
}

// Creating Enums

enum StatusEnum {
  pending,
  buyer_confirmed,
  cancelled,
  timed_out,
  blocked,
  refunded,
  completed,
  disputed,
  dispute_refunded,
  dispute_completed,
}

enum TypeEnum {
  buy,
  sell,
}
/// Advert details model class
abstract class AdvertDetailsModel {
  /// Initializes
  AdvertDetailsModel({
    @required this.description,
    @required this.id,
    @required this.paymentMethod,
    @required this.type,
  });

  /// General information about the advert.
  final String description;

  /// The unique identifier for the advert.
  final String id;

  /// The payment method.
  final String paymentMethod;

  /// Type of the advert.
  final TypeEnum type;
}

/// Advert details class
class AdvertDetails extends AdvertDetailsModel {
  /// Initializes
  AdvertDetails({
    @required String description,
    @required String id,
    @required String paymentMethod,
    @required String type,
  }) : super(
          description: description,
          id: id,
          paymentMethod: paymentMethod,
          type: type,
        );

  /// Creates an instance from JSON
  factory AdvertDetails.fromJson(Map<String, dynamic> json) => AdvertDetails(
        description: json['description'],
        id: json['id'],
        paymentMethod: json['payment_method'],
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

    result['description'] = description;
    result['id'] = id;
    result['payment_method'] = paymentMethod;
    result['type'] = typeEnumMapper[type];

    return result;
  }

  /// Creates a copy of instance with given parameters
  AdvertDetails copyWith({
    String description,
    String id,
    String paymentMethod,
    String type,
  }) =>
      AdvertDetails(
        description: description ?? this.description,
        id: id ?? this.id,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        type: type ?? this.type,
      );
  // Creating Enum Mappers

  static final Map<TypeEnum, String> typeEnumMapper = {
    TypeEnum.buy: 'buy',
    TypeEnum.sell: 'sell',
  };
}

// Creating Enums

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
    @required this.loginid,
    @required this.name,
  });

  /// The advertiser's first name.
  final String firstName;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's last name.
  final String lastName;

  /// The advertiser's account identifier.
  final String loginid;

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
    @required String loginid,
    @required String name,
  }) : super(
          firstName: firstName,
          id: id,
          lastName: lastName,
          loginid: loginid,
          name: name,
        );

  /// Creates an instance from JSON
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        firstName: json['first_name'],
        id: json['id'],
        lastName: json['last_name'],
        loginid: json['loginid'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['first_name'] = firstName;
    result['id'] = id;
    result['last_name'] = lastName;
    result['loginid'] = loginid;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  AdvertiserDetails copyWith({
    String firstName,
    String id,
    String lastName,
    String loginid,
    String name,
  }) =>
      AdvertiserDetails(
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
      );
}
/// Client details model class
abstract class ClientDetailsModel {
  /// Initializes
  ClientDetailsModel({
    @required this.firstName,
    @required this.id,
    @required this.lastName,
    @required this.loginid,
    @required this.name,
  });

  /// The client's first name.
  final String firstName;

  /// The client's unique P2P identifier.
  final String id;

  /// The client's last name.
  final String lastName;

  /// The client's account identifier.
  final String loginid;

  /// The client's displayed name.
  final String name;
}

/// Client details class
class ClientDetails extends ClientDetailsModel {
  /// Initializes
  ClientDetails({
    @required String firstName,
    @required String id,
    @required String lastName,
    @required String loginid,
    @required String name,
  }) : super(
          firstName: firstName,
          id: id,
          lastName: lastName,
          loginid: loginid,
          name: name,
        );

  /// Creates an instance from JSON
  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
        firstName: json['first_name'],
        id: json['id'],
        lastName: json['last_name'],
        loginid: json['loginid'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['first_name'] = firstName;
    result['id'] = id;
    result['last_name'] = lastName;
    result['loginid'] = loginid;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ClientDetails copyWith({
    String firstName,
    String id,
    String lastName,
    String loginid,
    String name,
  }) =>
      ClientDetails(
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
      );
}
/// Dispute details model class
abstract class DisputeDetailsModel {
  /// Initializes
  DisputeDetailsModel({
    this.disputeReason,
    this.disputerLoginid,
  });

  /// The dispute reason
  final UNKNOWN_TYPE disputeReason;

  /// The loginid of the client who's raising the dispute
  final UNKNOWN_TYPE disputerLoginid;
}

/// Dispute details class
class DisputeDetails extends DisputeDetailsModel {
  /// Initializes
  DisputeDetails({
    UNKNOWN_TYPE disputeReason,
    UNKNOWN_TYPE disputerLoginid,
  }) : super(
          disputeReason: disputeReason,
          disputerLoginid: disputerLoginid,
        );

  /// Creates an instance from JSON
  factory DisputeDetails.fromJson(Map<String, dynamic> json) => DisputeDetails(
        disputeReason: json['dispute_reason'],
        disputerLoginid: json['disputer_loginid'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['dispute_reason'] = disputeReason;
    result['disputer_loginid'] = disputerLoginid;

    return result;
  }

  /// Creates a copy of instance with given parameters
  DisputeDetails copyWith({
    UNKNOWN_TYPE disputeReason,
    UNKNOWN_TYPE disputerLoginid,
  }) =>
      DisputeDetails(
        disputeReason: disputeReason ?? this.disputeReason,
        disputerLoginid: disputerLoginid ?? this.disputerLoginid,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['id'] = id;

    return result;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
