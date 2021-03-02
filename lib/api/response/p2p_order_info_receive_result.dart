import 'package:meta/meta.dart';

import '../../basic_api/generated/forget_all_receive.dart';
import '../../basic_api/generated/forget_receive.dart';
import '../../basic_api/generated/p2p_order_cancel_receive.dart';
import '../../basic_api/generated/p2p_order_cancel_send.dart';
import '../../basic_api/generated/p2p_order_confirm_receive.dart';
import '../../basic_api/generated/p2p_order_confirm_send.dart';
import '../../basic_api/generated/p2p_order_info_receive.dart';
import '../../basic_api/generated/p2p_order_info_send.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import '../models/enums.dart';
import 'forget_all_receive_result.dart';
import 'forget_receive_result.dart';
import 'p2p_order_cancel_receive_result.dart';
import 'p2p_order_confirm_receive_result.dart';

/// P2p order info response model class
abstract class P2pOrderInfoResponseModel {
  /// Initializes
  P2pOrderInfoResponseModel({
    @required this.subscription,
    @required this.p2pOrderInfo,
  });

  /// For subscription requests only.
  final Subscription subscription;

  /// The information of P2P order.
  final P2pOrderInfo p2pOrderInfo;
}

/// P2p order info response class
class P2pOrderInfoResponse extends P2pOrderInfoResponseModel {
  /// Initializes
  P2pOrderInfoResponse({
    @required P2pOrderInfo p2pOrderInfo,
    @required Subscription subscription,
  }) : super(
          p2pOrderInfo: p2pOrderInfo,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory P2pOrderInfoResponse.fromJson(
    dynamic p2pOrderInfoJson,
    dynamic subscriptionJson,
  ) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: p2pOrderInfoJson == null
            ? null
            : P2pOrderInfo.fromJson(p2pOrderInfoJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderInfo != null) {
      resultMap['p2p_order_info'] = p2pOrderInfo.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Future<P2pOrderInfoResponse> fetchOrder(
      P2pOrderInfoSend request) async {
    final P2pOrderInfoReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderInfoResponse.fromJson(
        response.p2pOrderInfo, response.subscription);
  }

  /// Subscribes to this order
  Stream<P2pOrderInfoResponse> subscribe({
    RequestCompareFunction comparePredicate,
  }) =>
      subscribeOrder(
        P2pOrderInfoSend(id: p2pOrderInfo.id),
        comparePredicate: comparePredicate,
      );

  /// Subscribes to order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Stream<P2pOrderInfoResponse> subscribeOrder(
    P2pOrderInfoSend request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<P2pOrderInfoResponse>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
                P2POrderException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderInfoReceive
              ? P2pOrderInfoResponse.fromJson(
                  response.p2pOrderInfo,
                  response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from order subscription.
  ///
  /// Throws a [P2POrderException] if API response contains an error
  Future<ForgetResponse> unsubscribeOrder() async {
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

  /// Unsubscribes all order subscriptions (Subscriptions to a single order or list).
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllOrder() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pOrder);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Cancels this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [P2POrderException] if API response contains an error
  Future<P2pOrderCancelResponse> cancel() async {
    final P2pOrderCancelReceive response =
        await _api.call(request: P2pOrderCancelSend(id: p2pOrderInfo.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderCancelResponse.fromJson(response.p2pOrderCancel);
  }

  /// Confirms this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [P2POrderException] if API response contains an error
  Future<P2pOrderConfirmResponse> confirm() async {
    final P2pOrderConfirmReceive response =
        await _api.call(request: P2pOrderConfirmSend(id: p2pOrderInfo.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderConfirmResponse.fromJson(response.p2pOrderConfirm);
  }

  /// Creates a copy of instance with given parameters
  P2pOrderInfoResponse copyWith({
    P2pOrderInfo p2pOrderInfo,
    Subscription subscription,
  }) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: p2pOrderInfo ?? this.p2pOrderInfo,
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
/// P2p order info model class
abstract class P2pOrderInfoModel {
  /// Initializes
  P2pOrderInfoModel({
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
  final DisputeDetails disputeDetails;

  /// The epoch time of the order creation.
  final DateTime createdTime;

  /// Seller contact information.
  final String contactInfo;

  /// Details of the client who created the order.
  final ClientDetails clientDetails;

  /// The URL to be used to initialise the chat for this order.
  final String chatChannelUrl;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The amount of the order.
  final double amount;

  /// Details of the advertiser for this order.
  final AdvertiserDetails advertiserDetails;

  /// Details of the advert for this order.
  final AdvertDetails advertDetails;

  /// The currency of order.
  final String accountCurrency;
}

/// P2p order info class
class P2pOrderInfo extends P2pOrderInfoModel {
  /// Initializes
  P2pOrderInfo({
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
  factory P2pOrderInfo.fromJson(Map<String, dynamic> json) => P2pOrderInfo(
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
  P2pOrderInfo copyWith({
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
      P2pOrderInfo(
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
