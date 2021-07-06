import '../../basic_api/generated/p2p_order_create_receive.dart';
import '../../basic_api/generated/p2p_order_create_send.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// P2p order create response model class
abstract class P2pOrderCreateResponseModel {
  /// Initializes
  P2pOrderCreateResponseModel({
    this.p2pOrderCreate,
    this.subscription,
  });

  /// Information of the creates P2P order.
  final P2pOrderCreate? p2pOrderCreate;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// P2p order create response class
class P2pOrderCreateResponse extends P2pOrderCreateResponseModel {
  /// Initializes
  P2pOrderCreateResponse({
    P2pOrderCreate? p2pOrderCreate,
    Subscription? subscription,
  }) : super(
          p2pOrderCreate: p2pOrderCreate,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory P2pOrderCreateResponse.fromJson(
    dynamic p2pOrderCreateJson,
    dynamic subscriptionJson,
  ) =>
      P2pOrderCreateResponse(
        p2pOrderCreate: p2pOrderCreateJson == null
            ? null
            : P2pOrderCreate.fromJson(p2pOrderCreateJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderCreate != null) {
      resultMap['p2p_order_create'] = p2pOrderCreate!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates order with parameters specified in [P2pOrderCreateRequest]
  static Future<P2pOrderCreateResponse> create(
      P2pOrderCreateSend request) async {
    final P2pOrderCreateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderCreateResponse.fromJson(
        response.p2pOrderCreate, response.subscription);
  }

  /// Creates order and subscribes to the result with parameters specified in [P2pOrderCreateRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Stream<P2pOrderCreateResponse?> createAndSubscribe(
    P2pOrderCreateSend request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api.subscribe(request: request, comparePredicate: comparePredicate)!.map(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                P2POrderException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderCreateReceive
              ? P2pOrderCreateResponse.fromJson(
                  response.p2pOrderCreate,
                  response.subscription,
                )
              : null;
        },
      );

  /// Creates a copy of instance with given parameters
  P2pOrderCreateResponse copyWith({
    P2pOrderCreate? p2pOrderCreate,
    Subscription? subscription,
  }) =>
      P2pOrderCreateResponse(
        p2pOrderCreate: p2pOrderCreate ?? this.p2pOrderCreate,
        subscription: subscription ?? this.subscription,
      );
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "buy": TypeEnum.buy,
  "sell": TypeEnum.sell,
};

/// Type Enum.
enum TypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "pending": StatusEnum.pending,
};

/// Status Enum.
enum StatusEnum {
  /// pending.
  pending,
}
/// P2p order create model class
abstract class P2pOrderCreateModel {
  /// Initializes
  P2pOrderCreateModel({
    required this.type,
    required this.status,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.paymentInfo,
    required this.localCurrency,
    required this.isIncoming,
    required this.id,
    required this.expiryTime,
    required this.disputeDetails,
    required this.createdTime,
    required this.contactInfo,
    required this.clientDetails,
    required this.chatChannelUrl,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.advertDetails,
    required this.accountCurrency,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.paymentMethodIds,
  });

  /// Type of the order.
  final TypeEnum type;

  /// The status of the created order.
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

  /// Supported payment methods. Comma separated list.
  final String? paymentMethod;

  /// Details of available payment methods.
  final List<PaymentMethodDetailsItem>? paymentMethodDetails;

  /// IDs of payment methods.
  final List<int>? paymentMethodIds;
}

/// P2p order create class
class P2pOrderCreate extends P2pOrderCreateModel {
  /// Initializes
  P2pOrderCreate({
    required String accountCurrency,
    required AdvertDetails advertDetails,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required String chatChannelUrl,
    required ClientDetails clientDetails,
    required String contactInfo,
    required DateTime createdTime,
    required DisputeDetails disputeDetails,
    required DateTime expiryTime,
    required String id,
    required bool isIncoming,
    required String localCurrency,
    required String paymentInfo,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required StatusEnum status,
    required TypeEnum type,
    String? paymentMethod,
    List<PaymentMethodDetailsItem>? paymentMethodDetails,
    List<int>? paymentMethodIds,
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
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
          paymentMethodIds: paymentMethodIds,
        );

  /// Creates an instance from JSON
  factory P2pOrderCreate.fromJson(Map<String, dynamic> json) => P2pOrderCreate(
        accountCurrency: json['account_currency'],
        advertDetails: AdvertDetails.fromJson(json['advert_details']),
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        chatChannelUrl: json['chat_channel_url'],
        clientDetails: ClientDetails.fromJson(json['client_details']),
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time'])!,
        disputeDetails: DisputeDetails.fromJson(json['dispute_details']),
        expiryTime: getDateTime(json['expiry_time'])!,
        id: json['id'],
        isIncoming: getBool(json['is_incoming'])!,
        localCurrency: json['local_currency'],
        paymentInfo: json['payment_info'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        status: statusEnumMapper[json['status']]!,
        type: typeEnumMapper[json['type']]!,
        paymentMethod: json['payment_method'],
        paymentMethodDetails: json['payment_method_details'] == null
            ? null
            : List<PaymentMethodDetailsItem>.from(
                json['payment_method_details']?.map(
                  (dynamic item) => PaymentMethodDetailsItem.fromJson(item),
                ),
              ),
        paymentMethodIds: json['payment_method_ids'] == null
            ? null
            : List<int>.from(
                json['payment_method_ids']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    resultMap['advert_details'] = advertDetails.toJson();

    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['chat_channel_url'] = chatChannelUrl;
    resultMap['client_details'] = clientDetails.toJson();

    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['dispute_details'] = disputeDetails.toJson();

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
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['payment_method'] = paymentMethod;
    if (paymentMethodDetails != null) {
      resultMap['payment_method_details'] = paymentMethodDetails!
          .map<dynamic>(
            (PaymentMethodDetailsItem item) => item.toJson(),
          )
          .toList();
    }
    if (paymentMethodIds != null) {
      resultMap['payment_method_ids'] = paymentMethodIds!
          .map<dynamic>(
            (int item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pOrderCreate copyWith({
    required String accountCurrency,
    required AdvertDetails advertDetails,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required String chatChannelUrl,
    required ClientDetails clientDetails,
    required String contactInfo,
    required DateTime createdTime,
    required DisputeDetails disputeDetails,
    required DateTime expiryTime,
    required String id,
    required bool isIncoming,
    required String localCurrency,
    required String paymentInfo,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required StatusEnum status,
    required TypeEnum type,
    String? paymentMethod,
    List<PaymentMethodDetailsItem>? paymentMethodDetails,
    List<int>? paymentMethodIds,
  }) =>
      P2pOrderCreate(
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
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
        paymentMethodIds: paymentMethodIds ?? this.paymentMethodIds,
      );
}
/// Advert details model class
abstract class AdvertDetailsModel {
  /// Initializes
  AdvertDetailsModel({
    required this.type,
    required this.id,
    required this.description,
    this.paymentMethod,
  });

  /// Type of the advert.
  final TypeEnum type;

  /// The unique identifier for the advert.
  final String id;

  /// General information about the advert.
  final String description;

  /// The payment method.
  final String? paymentMethod;
}

/// Advert details class
class AdvertDetails extends AdvertDetailsModel {
  /// Initializes
  AdvertDetails({
    required String description,
    required String id,
    required TypeEnum type,
    String? paymentMethod,
  }) : super(
          description: description,
          id: id,
          type: type,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON
  factory AdvertDetails.fromJson(Map<String, dynamic> json) => AdvertDetails(
        description: json['description'],
        id: json['id'],
        type: typeEnumMapper[json['type']]!,
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AdvertDetails copyWith({
    required String description,
    required String id,
    required TypeEnum type,
    String? paymentMethod,
  }) =>
      AdvertDetails(
        description: description,
        id: id,
        type: type,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
/// Advertiser details model class
abstract class AdvertiserDetailsModel {
  /// Initializes
  AdvertiserDetailsModel({
    required this.name,
    required this.loginid,
    required this.id,
    this.firstName,
    this.lastName,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's account identifier.
  final String loginid;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's first name.
  final String? firstName;

  /// The advertiser's last name.
  final String? lastName;
}

/// Advertiser details class
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes
  AdvertiserDetails({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) : super(
          id: id,
          loginid: loginid,
          name: name,
          firstName: firstName,
          lastName: lastName,
        );

  /// Creates an instance from JSON
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        id: json['id'],
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AdvertiserDetails copyWith({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) =>
      AdvertiserDetails(
        id: id,
        loginid: loginid,
        name: name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
}
/// Client details model class
abstract class ClientDetailsModel {
  /// Initializes
  ClientDetailsModel({
    required this.name,
    required this.loginid,
    required this.id,
    this.firstName,
    this.lastName,
  });

  /// The client's displayed name.
  final String name;

  /// The client's account identifier.
  final String loginid;

  /// The client's unique P2P identifier.
  final String id;

  /// The client's first name.
  final String? firstName;

  /// The client's last name.
  final String? lastName;
}

/// Client details class
class ClientDetails extends ClientDetailsModel {
  /// Initializes
  ClientDetails({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) : super(
          id: id,
          loginid: loginid,
          name: name,
          firstName: firstName,
          lastName: lastName,
        );

  /// Creates an instance from JSON
  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
        id: json['id'],
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ClientDetails copyWith({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) =>
      ClientDetails(
        id: id,
        loginid: loginid,
        name: name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
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
  final String? disputeReason;

  /// The loginid of the client who's raising the dispute
  final String? disputerLoginid;
}

/// Dispute details class
class DisputeDetails extends DisputeDetailsModel {
  /// Initializes
  DisputeDetails({
    String? disputeReason,
    String? disputerLoginid,
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
    String? disputeReason,
    String? disputerLoginid,
  }) =>
      DisputeDetails(
        disputeReason: disputeReason ?? this.disputeReason,
        disputerLoginid: disputerLoginid ?? this.disputerLoginid,
      );
}
/// Payment method details item model class
abstract class PaymentMethodDetailsItemModel {
  /// Initializes
  PaymentMethodDetailsItemModel({
    this.method,
  });

  /// Payment method identifier.
  final String? method;
}

/// Payment method details item class
class PaymentMethodDetailsItem extends PaymentMethodDetailsItemModel {
  /// Initializes
  PaymentMethodDetailsItem({
    String? method,
  }) : super(
          method: method,
        );

  /// Creates an instance from JSON
  factory PaymentMethodDetailsItem.fromJson(Map<String, dynamic> json) =>
      PaymentMethodDetailsItem(
        method: json['method'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['method'] = method;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  PaymentMethodDetailsItem copyWith({
    String? method,
  }) =>
      PaymentMethodDetailsItem(
        method: method ?? this.method,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    required String id,
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
    required String id,
  }) =>
      Subscription(
        id: id,
      );
}
