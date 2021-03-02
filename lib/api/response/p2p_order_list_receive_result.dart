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
    @required this.subscription,
    @required this.p2pOrderList,
  });

  /// For subscription requests only.
  final Subscription subscription;

  /// List of P2P orders.
  final P2pOrderList p2pOrderList;
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
    @required this.type,
    @required this.status,
    @required this.rateDisplay,
    @required this.rate,
    @required this.priceDisplay,
    @required this.price,
    @required this.paymentInfo,
    @required this.localCurrency,
    @required this.isIncoming,
    @required this.id,
    @required this.expiryTime,
    @required this.disputeDetails,
    @required this.createdTime,
    @required this.contactInfo,
    @required this.clientDetails,
    @required this.chatChannelUrl,
    @required this.amountDisplay,
    @required this.amount,
    @required this.advertiserDetails,
    @required this.advertDetails,
    @required this.accountCurrency,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum type;

  /// Current order status.
  final StatusEnum status;

  /// Conversion rate of the order, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate of the order.
  final double rate;

  /// Cost in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Cost in local currency.
  final double price;

  /// Payment instructions.
  final String paymentInfo;

  /// Local currency for this order.
  final String localCurrency;

  /// `true` if the order is created for the advert of the current client, otherwise `false`.
  final bool isIncoming;

  /// The unique identifier for this order.
  final String id;

  /// The epoch time in which the order will be expired.
  final DateTime expiryTime;

  /// Details of the order dispute.
  final ListItemDisputeDetails disputeDetails;

  /// The epoch time of the order creation.
  final DateTime createdTime;

  /// Seller contact information.
  final String contactInfo;

  /// Details of the client who created the order.
  final ListItemClientDetails clientDetails;

  /// The URL to be used to initialise the chat for this order.
  final String chatChannelUrl;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The amount of the order.
  final double amount;

  /// Details of the advertiser for this order.
  final ListItemAdvertiserDetails advertiserDetails;

  /// Details of the advert for this order.
  final ListItemAdvertDetails advertDetails;

  /// The currency to be bought or sold.
  final String accountCurrency;
}

/// List item class
class ListItem extends ListItemModel {
  /// Initializes
  ListItem({
    @required String accountCurrency,
    @required ListItemAdvertDetails advertDetails,
    @required ListItemAdvertiserDetails advertiserDetails,
    @required double amount,
    @required String amountDisplay,
    @required String chatChannelUrl,
    @required ListItemClientDetails clientDetails,
    @required String contactInfo,
    @required DateTime createdTime,
    @required ListItemDisputeDetails disputeDetails,
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
            : ListItemAdvertDetails.fromJson(json['advert_details']),
        advertiserDetails: json['advertiser_details'] == null
            ? null
            : ListItemAdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        chatChannelUrl: json['chat_channel_url'],
        clientDetails: json['client_details'] == null
            ? null
            : ListItemClientDetails.fromJson(json['client_details']),
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time']),
        disputeDetails: json['dispute_details'] == null
            ? null
            : ListItemDisputeDetails.fromJson(json['dispute_details']),
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
    ListItemAdvertDetails advertDetails,
    ListItemAdvertiserDetails advertiserDetails,
    double amount,
    String amountDisplay,
    String chatChannelUrl,
    ListItemClientDetails clientDetails,
    String contactInfo,
    DateTime createdTime,
    ListItemDisputeDetails disputeDetails,
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
/// List item advert details model class
abstract class ListItemAdvertDetailsModel {
  /// Initializes
  ListItemAdvertDetailsModel({
    @required this.type,
    @required this.paymentMethod,
    @required this.id,
    @required this.description,
  });

  /// Type of the advert.
  final TypeEnum type;

  /// The payment method.
  final String paymentMethod;

  /// The unique identifier for the advert.
  final String id;

  /// General information about the advert.
  final String description;
}

/// List item advert details class
class ListItemAdvertDetails extends ListItemAdvertDetailsModel {
  /// Initializes
  ListItemAdvertDetails({
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
  factory ListItemAdvertDetails.fromJson(Map<String, dynamic> json) =>
      ListItemAdvertDetails(
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
  ListItemAdvertDetails copyWith({
    String description,
    String id,
    String paymentMethod,
    TypeEnum type,
  }) =>
      ListItemAdvertDetails(
        description: description ?? this.description,
        id: id ?? this.id,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        type: type ?? this.type,
      );
}
/// List item advertiser details model class
abstract class ListItemAdvertiserDetailsModel {
  /// Initializes
  ListItemAdvertiserDetailsModel({
    @required this.name,
    @required this.loginid,
    @required this.lastName,
    @required this.id,
    @required this.firstName,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's account identifier.
  final String loginid;

  /// The advertiser's last name.
  final String lastName;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's first name.
  final String firstName;
}

/// List item advertiser details class
class ListItemAdvertiserDetails extends ListItemAdvertiserDetailsModel {
  /// Initializes
  ListItemAdvertiserDetails({
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
  factory ListItemAdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      ListItemAdvertiserDetails(
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
  ListItemAdvertiserDetails copyWith({
    String firstName,
    String id,
    String lastName,
    String loginid,
    String name,
  }) =>
      ListItemAdvertiserDetails(
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
      );
}
/// List item client details model class
abstract class ListItemClientDetailsModel {
  /// Initializes
  ListItemClientDetailsModel({
    @required this.name,
    @required this.loginid,
    @required this.lastName,
    @required this.id,
    @required this.firstName,
  });

  /// The client's displayed name.
  final String name;

  /// The client's account identifier.
  final String loginid;

  /// The client's last name.
  final String lastName;

  /// The client's unique P2P identifier.
  final String id;

  /// The client's first name.
  final String firstName;
}

/// List item client details class
class ListItemClientDetails extends ListItemClientDetailsModel {
  /// Initializes
  ListItemClientDetails({
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
  factory ListItemClientDetails.fromJson(Map<String, dynamic> json) =>
      ListItemClientDetails(
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
  ListItemClientDetails copyWith({
    String firstName,
    String id,
    String lastName,
    String loginid,
    String name,
  }) =>
      ListItemClientDetails(
        firstName: firstName ?? this.firstName,
        id: id ?? this.id,
        lastName: lastName ?? this.lastName,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
      );
}
/// List item dispute details model class
abstract class ListItemDisputeDetailsModel {
  /// Initializes
  ListItemDisputeDetailsModel({
    this.disputeReason,
    this.disputerLoginid,
  });

  /// The dispute reason
  final String disputeReason;

  /// The loginid of the client who's raising the dispute
  final String disputerLoginid;
}

/// List item dispute details class
class ListItemDisputeDetails extends ListItemDisputeDetailsModel {
  /// Initializes
  ListItemDisputeDetails({
    String disputeReason,
    String disputerLoginid,
  }) : super(
          disputeReason: disputeReason,
          disputerLoginid: disputerLoginid,
        );

  /// Creates an instance from JSON
  factory ListItemDisputeDetails.fromJson(Map<String, dynamic> json) =>
      ListItemDisputeDetails(
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
  ListItemDisputeDetails copyWith({
    String disputeReason,
    String disputerLoginid,
  }) =>
      ListItemDisputeDetails(
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
