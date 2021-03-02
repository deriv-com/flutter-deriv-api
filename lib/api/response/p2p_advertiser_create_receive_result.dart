import 'package:meta/meta.dart';

import '../../basic_api/generated/p2p_advertiser_create_receive.dart';
import '../../basic_api/generated/p2p_advertiser_create_send.dart';
import '../../basic_api/generated/p2p_advertiser_info_receive.dart';
import '../../basic_api/response.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/connection/call_manager/base_call_manager.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// P2p advertiser create response model class
abstract class P2pAdvertiserCreateResponseModel {
  /// Initializes
  P2pAdvertiserCreateResponseModel({
    @required this.subscription,
    @required this.p2pAdvertiserCreate,
  });

  /// For subscription requests only.
  final Subscription subscription;

  /// P2P advertiser information.
  final P2pAdvertiserCreate p2pAdvertiserCreate;
}

/// P2p advertiser create response class
class P2pAdvertiserCreateResponse extends P2pAdvertiserCreateResponseModel {
  /// Initializes
  P2pAdvertiserCreateResponse({
    @required P2pAdvertiserCreate p2pAdvertiserCreate,
    @required Subscription subscription,
  }) : super(
          p2pAdvertiserCreate: p2pAdvertiserCreate,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserCreateResponse.fromJson(
    dynamic p2pAdvertiserCreateJson,
    dynamic subscriptionJson,
  ) =>
      P2pAdvertiserCreateResponse(
        p2pAdvertiserCreate: p2pAdvertiserCreateJson == null
            ? null
            : P2pAdvertiserCreate.fromJson(p2pAdvertiserCreateJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserCreate != null) {
      resultMap['p2p_advertiser_create'] = p2pAdvertiserCreate.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Future<P2pAdvertiserCreateResponse> createAdvertiser(
    P2pAdvertiserCreateSend request,
  ) async {
    final P2pAdvertiserCreateReceive response = await _api.call(
      request: request.copyWith(subscribe: false),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserCreateResponse.fromJson(
        response.p2pAdvertiserCreate, response.subscription);
  }

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Stream<P2pAdvertiserCreateResponse> createAdvertiserAndSubscribe(
    P2pAdvertiserCreateSend request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<P2pAdvertiserCreateResponse>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
                P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pAdvertiserCreateReceive
              ? P2pAdvertiserCreateResponse.fromJson(
                  response.p2pAdvertiserCreate,
                  response.subscription,
                )
              : null;
        },
      );

  /// Creates a copy of instance with given parameters
  P2pAdvertiserCreateResponse copyWith({
    P2pAdvertiserCreate p2pAdvertiserCreate,
    Subscription subscription,
  }) =>
      P2pAdvertiserCreateResponse(
        p2pAdvertiserCreate: p2pAdvertiserCreate ?? this.p2pAdvertiserCreate,
        subscription: subscription ?? this.subscription,
      );
}
/// P2p advertiser create model class
abstract class P2pAdvertiserCreateModel {
  /// Initializes
  P2pAdvertiserCreateModel({
    @required this.totalOrdersCount,
    @required this.showName,
    @required this.sellOrdersCount,
    @required this.paymentInfo,
    @required this.name,
    @required this.isListed,
    @required this.isApproved,
    @required this.id,
    @required this.fullVerification,
    @required this.defaultAdvertDescription,
    @required this.dailySellLimit,
    @required this.dailySell,
    @required this.dailyBuyLimit,
    @required this.dailyBuy,
    @required this.createdTime,
    @required this.contactInfo,
    @required this.chatUserId,
    @required this.chatToken,
    @required this.buyOrdersCount,
    @required this.basicVerification,
    @required this.balanceAvailable,
    this.buyCompletionRate,
    this.cancelTimeAvg,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.totalCompletionRate,
  });

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;

  /// When `true`, the advertiser's real name will be displayed to other users on adverts and orders.
  final bool showName;

  /// The number of sell order orders completed within the past 30 days.
  final int sellOrdersCount;

  /// Advertiser's payment information.
  final String paymentInfo;

  /// The advertiser's displayed name.
  final String name;

  /// Indicates if the advertiser's active adverts are listed. When `false`, adverts won't be listed regardless if they are active or not.
  final bool isListed;

  /// The approval status of the advertiser.
  final bool isApproved;

  /// The advertiser's identification number.
  final String id;

  /// Boolean value: 1 or 0, indicating whether the advertiser's address has been verified.
  final int fullVerification;

  /// Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// Maximum allowed value of P2P sell transactions in a 24 hour period.
  final String dailySellLimit;

  /// Total value of P2P sell transactions in the past 24 hours.
  final String dailySell;

  /// Maximum allowed value of P2P buy transactions in a 24 hour period.
  final String dailyBuyLimit;

  /// Total value of P2P buy transactions in the past 24 hours.
  final String dailyBuy;

  /// The epoch time that the client became an advertiser.
  final DateTime createdTime;

  /// Advertiser's contact information.
  final String contactInfo;

  /// The unique identifier for the chat user.
  final String chatUserId;

  /// The token to be used for authenticating the client for chat.
  final String chatToken;

  /// The number of buy order completed within the past 30 days.
  final int buyOrdersCount;

  /// Boolean value: 1 or 0, indicating whether the advertiser's identify has been verified.
  final int basicVerification;

  /// Amount of funds available to sell on P2P. May be less than account balance according to deposit methods used.
  final double balanceAvailable;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double buyCompletionRate;

  /// The average time in seconds taken to cancel orders as a buyer within the past 30 days.
  final int cancelTimeAvg;

  /// The average time in seconds taken to release funds as a seller within the past 30 days.
  final int releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the past 30 days.
  final double sellCompletionRate;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double totalCompletionRate;
}

/// P2p advertiser create class
class P2pAdvertiserCreate extends P2pAdvertiserCreateModel {
  /// Initializes
  P2pAdvertiserCreate({
    @required double balanceAvailable,
    @required int basicVerification,
    @required int buyOrdersCount,
    @required String chatToken,
    @required String chatUserId,
    @required String contactInfo,
    @required DateTime createdTime,
    @required String dailyBuy,
    @required String dailyBuyLimit,
    @required String dailySell,
    @required String dailySellLimit,
    @required String defaultAdvertDescription,
    @required int fullVerification,
    @required String id,
    @required bool isApproved,
    @required bool isListed,
    @required String name,
    @required String paymentInfo,
    @required int sellOrdersCount,
    @required bool showName,
    @required int totalOrdersCount,
    double buyCompletionRate,
    int cancelTimeAvg,
    int releaseTimeAvg,
    double sellCompletionRate,
    double totalCompletionRate,
  }) : super(
          balanceAvailable: balanceAvailable,
          basicVerification: basicVerification,
          buyOrdersCount: buyOrdersCount,
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          createdTime: createdTime,
          dailyBuy: dailyBuy,
          dailyBuyLimit: dailyBuyLimit,
          dailySell: dailySell,
          dailySellLimit: dailySellLimit,
          defaultAdvertDescription: defaultAdvertDescription,
          fullVerification: fullVerification,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          name: name,
          paymentInfo: paymentInfo,
          sellOrdersCount: sellOrdersCount,
          showName: showName,
          totalOrdersCount: totalOrdersCount,
          buyCompletionRate: buyCompletionRate,
          cancelTimeAvg: cancelTimeAvg,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserCreate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserCreate(
        balanceAvailable: getDouble(json['balance_available']),
        basicVerification: json['basic_verification'],
        buyOrdersCount: json['buy_orders_count'],
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time']),
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        defaultAdvertDescription: json['default_advert_description'],
        fullVerification: json['full_verification'],
        id: json['id'],
        isApproved: getBool(json['is_approved']),
        isListed: getBool(json['is_listed']),
        name: json['name'],
        paymentInfo: json['payment_info'],
        sellOrdersCount: json['sell_orders_count'],
        showName: getBool(json['show_name']),
        totalOrdersCount: json['total_orders_count'],
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        cancelTimeAvg: json['cancel_time_avg'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance_available'] = balanceAvailable;
    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['name'] = name;
    resultMap['payment_info'] = paymentInfo;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['show_name'] = showName;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserCreate copyWith({
    double balanceAvailable,
    int basicVerification,
    int buyOrdersCount,
    String chatToken,
    String chatUserId,
    String contactInfo,
    DateTime createdTime,
    String dailyBuy,
    String dailyBuyLimit,
    String dailySell,
    String dailySellLimit,
    String defaultAdvertDescription,
    int fullVerification,
    String id,
    bool isApproved,
    bool isListed,
    String name,
    String paymentInfo,
    int sellOrdersCount,
    bool showName,
    int totalOrdersCount,
    double buyCompletionRate,
    int cancelTimeAvg,
    int releaseTimeAvg,
    double sellCompletionRate,
    double totalCompletionRate,
  }) =>
      P2pAdvertiserCreate(
        balanceAvailable: balanceAvailable ?? this.balanceAvailable,
        basicVerification: basicVerification ?? this.basicVerification,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        chatToken: chatToken ?? this.chatToken,
        chatUserId: chatUserId ?? this.chatUserId,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        dailyBuy: dailyBuy ?? this.dailyBuy,
        dailyBuyLimit: dailyBuyLimit ?? this.dailyBuyLimit,
        dailySell: dailySell ?? this.dailySell,
        dailySellLimit: dailySellLimit ?? this.dailySellLimit,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        fullVerification: fullVerification ?? this.fullVerification,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isListed: isListed ?? this.isListed,
        name: name ?? this.name,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        showName: showName ?? this.showName,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
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
