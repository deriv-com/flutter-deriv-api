import 'package:meta/meta.dart';

import '../../basic_api/generated/forget_receive.dart';
import '../../basic_api/generated/p2p_order_list_receive.dart';
import '../../basic_api/generated/p2p_order_list_send.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import 'forget_all_receive_result.dart';
import 'forget_receive_result.dart';
import 'p2p_order_info_receive_result.dart';

/// P2p order list response model class
abstract class P2pOrderListResponseModel {
  /// Initializes
  P2pOrderListResponseModel({
    @required this.p2pOrderList,
    @required this.subscription,
  });

  /// List of P2P orders.
  final P2pOrderList p2pOrderList;

  /// For subscription requests only.
  final Subscription subscription;
}

/// P2p order list response class
class P2pOrderListResponse extends P2pOrderListResponseModel {
  /// Initializes
  P2pOrderListResponse({
    @required P2pOrderList p2pOrderList,
    @required Subscription subscription,
  }) : super(
          p2pOrderList: p2pOrderList,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory P2pOrderListResponse.fromJson(
    dynamic p2pOrderListJson,
    dynamic subscriptionJson,
  ) =>
      P2pOrderListResponse(
        p2pOrderList: p2pOrderListJson == null
            ? null
            : P2pOrderList.fromJson(p2pOrderListJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderList != null) {
      resultMap['p2p_order_list'] = p2pOrderList.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Future<P2pOrderListResponse> fetchOrderList([
    P2pOrderListSend request,
  ]) async {
    final P2pOrderListReceive response = await _api.call(
      request: request ?? const P2pOrderListSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderListResponse.fromJson(
        response.p2pOrderList, response.subscription);
  }

  /// Subscribes to the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Stream<P2pOrderListResponse> subscribeOrderList({
    P2pOrderListSend request,
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(
        request: request ?? const P2pOrderListSend(),
        comparePredicate: comparePredicate,
      )
          .map<P2pOrderListResponse>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
                P2POrderException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderListReceive
              ? P2pOrderListResponse.fromJson(
                  response.p2pOrderList,
                  response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from order list subscription.
  ///
  /// Throws a [P2POrderException] if API response contains an error
  Future<ForgetResponse> unsubscribeOrderList() async {
    if (subscription?.id == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes from all order subscriptions (Subscriptions to a single order or list).
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllOrder() =>
      P2pOrderInfoResponse.unsubscribeAllOrder();

  /// Creates a copy of instance with given parameters
  P2pOrderListResponse copyWith({
    P2pOrderList p2pOrderList,
    Subscription subscription,
  }) =>
      P2pOrderListResponse(
        p2pOrderList: p2pOrderList ?? this.p2pOrderList,
        subscription: subscription ?? this.subscription,
      );
}

final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "buy": TypeEnum.buy,
  "sell": TypeEnum.sell,
};

/// type Enum
enum TypeEnum {
  buy,
  sell,
}

final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "pending": StatusEnum.pending,
  "buyer-confirmed": StatusEnum.buyerConfirmed,
  "cancelled": StatusEnum.cancelled,
  "timed-out": StatusEnum.timedOut,
  "blocked": StatusEnum.blocked,
  "refunded": StatusEnum.refunded,
  "completed": StatusEnum.completed,
  "disputed": StatusEnum.disputed,
  "dispute-refunded": StatusEnum.disputeRefunded,
  "dispute-completed": StatusEnum.disputeCompleted,
};

/// status Enum
enum StatusEnum {
  pending,
  buyerConfirmed,
  cancelled,
  timedOut,
  blocked,
  refunded,
  completed,
  disputed,
  disputeRefunded,
  disputeCompleted,
}
/// P2p order list model class
abstract class P2pOrderListModel {
  /// Initializes
  P2pOrderListModel({
    @required this.list,
  });

  /// List of orders.
  final List<ListItem> list;
}

/// P2p order list class
class P2pOrderList extends P2pOrderListModel {
  /// Initializes
  P2pOrderList({
    @required List<ListItem> list,
  }) : super(
          list: list,
        );

  /// Creates an instance from JSON
  factory P2pOrderList.fromJson(Map<String, dynamic> json) => P2pOrderList(
        list: json['list'] == null
            ? null
            : List<ListItem>.from(
                json['list'].map((dynamic item) => ListItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (list != null) {
      resultMap['list'] =
          list.map<dynamic>((ListItem item) => item.toJson()).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderList copyWith({
    List<ListItem> list,
  }) =>
      P2pOrderList(
        list: list ?? this.list,
      );
}
/// List item model class
abstract class ListItemModel {
  /// Initializes
  ListItemModel({
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
  final DateTime createdTime;

  /// Details of the order dispute.
  final DisputeDetails disputeDetails;

  /// The epoch time in which the order will be expired.
  final DateTime expiryTime;

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

/// List item class
class ListItem extends ListItemModel {
  /// Initializes
  ListItem({
    @required String accountCurrency,
    @required AdvertDetails advertDetails,
    @required AdvertiserDetails advertiserDetails,
    @required double amount,
    @required String amountDisplay,
    @required String chatChannelUrl,
    @required ClientDetails clientDetails,
    @required String contactInfo,
    @required DateTime createdTime,
    @required DisputeDetails disputeDetails,
    @required DateTime expiryTime,
    @required String id,
    @required bool isIncoming,
    @required String localCurrency,
    @required String paymentInfo,
    @required double price,
    @required String priceDisplay,
    @required double rate,
    @required String rateDisplay,
    @required StatusEnum status,
    @required TypeEnum type,
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
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
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
        createdTime: getDateTime(json['created_time']),
        disputeDetails: json['dispute_details'] == null
            ? null
            : DisputeDetails.fromJson(json['dispute_details']),
        expiryTime: getDateTime(json['expiry_time']),
        id: json['id'],
        isIncoming: getBool(json['is_incoming']),
        localCurrency: json['local_currency'],
        paymentInfo: json['payment_info'],
        price: getDouble(json['price']),
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate']),
        rateDisplay: json['rate_display'],
        status: statusEnumMapper[json['status']],
        type: typeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    if (advertDetails != null) {
      resultMap['advert_details'] = advertDetails.toJson();
    }
    if (advertiserDetails != null) {
      resultMap['advertiser_details'] = advertiserDetails.toJson();
    }
    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['chat_channel_url'] = chatChannelUrl;
    if (clientDetails != null) {
      resultMap['client_details'] = clientDetails.toJson();
    }
    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    if (disputeDetails != null) {
      resultMap['dispute_details'] = disputeDetails.toJson();
    }
    resultMap['expiry_time'] = getSecondsSinceEpochDateTime(expiryTime);
    resultMap['id'] = id;
    resultMap['is_incoming'] = isIncoming;
    resultMap['local_currency'] = localCurrency;
    resultMap['payment_info'] = paymentInfo;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere((entry) => entry.value == status, orElse: () => null)
        ?.key;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((entry) => entry.value == type, orElse: () => null)
        ?.key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ListItem copyWith({
    String accountCurrency,
    AdvertDetails advertDetails,
    AdvertiserDetails advertiserDetails,
    double amount,
    String amountDisplay,
    String chatChannelUrl,
    ClientDetails clientDetails,
    String contactInfo,
    DateTime createdTime,
    DisputeDetails disputeDetails,
    DateTime expiryTime,
    String id,
    bool isIncoming,
    String localCurrency,
    String paymentInfo,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    StatusEnum status,
    TypeEnum type,
  }) =>
      ListItem(
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
    @required TypeEnum type,
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
        type: typeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['payment_method'] = paymentMethod;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((entry) => entry.value == type, orElse: () => null)
        ?.key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AdvertDetails copyWith({
    String description,
    String id,
    String paymentMethod,
    TypeEnum type,
  }) =>
      AdvertDetails(
        description: description ?? this.description,
        id: id ?? this.id,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        type: type ?? this.type,
      );
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['first_name'] = firstName;
    resultMap['id'] = id;
    resultMap['last_name'] = lastName;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;

    return resultMap;
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['first_name'] = firstName;
    resultMap['id'] = id;
    resultMap['last_name'] = lastName;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;

    return resultMap;
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
  final String disputeReason;

  /// The loginid of the client who's raising the dispute
  final String disputerLoginid;
}

/// Dispute details class
class DisputeDetails extends DisputeDetailsModel {
  /// Initializes
  DisputeDetails({
    String disputeReason,
    String disputerLoginid,
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['dispute_reason'] = disputeReason;
    resultMap['disputer_loginid'] = disputerLoginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  DisputeDetails copyWith({
    String disputeReason,
    String disputerLoginid,
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
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
