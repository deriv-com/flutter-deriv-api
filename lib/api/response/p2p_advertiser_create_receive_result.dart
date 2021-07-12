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

/// P2p advertiser create response model class.
abstract class P2pAdvertiserCreateResponseModel {
  /// Initializes.
  P2pAdvertiserCreateResponseModel({
    this.p2pAdvertiserCreate,
    this.subscription,
  });

  /// P2P advertiser information.
  final P2pAdvertiserCreate? p2pAdvertiserCreate;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// P2p advertiser create response class.
class P2pAdvertiserCreateResponse extends P2pAdvertiserCreateResponseModel {
  /// Initializes
  P2pAdvertiserCreateResponse({
    P2pAdvertiserCreate? p2pAdvertiserCreate,
    Subscription? subscription,
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
      resultMap['p2p_advertiser_create'] = p2pAdvertiserCreate!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

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
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserCreateResponse.fromJson(
        response.p2pAdvertiserCreate, response.subscription);
  }

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Stream<P2pAdvertiserCreateResponse?> createAdvertiserAndSubscribe(
    P2pAdvertiserCreateSend request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<P2pAdvertiserCreateResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
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

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserCreateResponse copyWith({
    P2pAdvertiserCreate? p2pAdvertiserCreate,
    Subscription? subscription,
  }) =>
      P2pAdvertiserCreateResponse(
        p2pAdvertiserCreate: p2pAdvertiserCreate ?? this.p2pAdvertiserCreate,
        subscription: subscription ?? this.subscription,
      );
}
/// P2p advertiser create model class.
abstract class P2pAdvertiserCreateModel {
  /// Initializes.
  P2pAdvertiserCreateModel({
    required this.totalOrdersCount,
    required this.sellOrdersCount,
    required this.paymentInfo,
    required this.name,
    required this.isListed,
    required this.isApproved,
    required this.id,
    required this.createdTime,
    required this.contactInfo,
    required this.chatUserId,
    required this.chatToken,
    required this.cancelsRemaining,
    required this.buyOrdersCount,
    this.balanceAvailable,
    this.basicVerification,
    this.buyCompletionRate,
    this.cancelTimeAvg,
    this.dailyBuy,
    this.dailyBuyLimit,
    this.dailySell,
    this.dailySellLimit,
    this.defaultAdvertDescription,
    this.fullVerification,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.showName,
    this.totalCompletionRate,
  });

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;

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

  /// The epoch time that the client became an advertiser.
  final DateTime createdTime;

  /// Advertiser's contact information.
  final String contactInfo;

  /// The unique identifier for the chat user.
  final String chatUserId;

  /// The token to be used for authenticating the client for chat.
  final String chatToken;

  /// The number of times the user may cancel orders before being temporarily blocked.
  final int cancelsRemaining;

  /// The number of buy order completed within the past 30 days.
  final int buyOrdersCount;

  /// Amount of funds available to sell on P2P. May be less than account balance according to deposit methods used.
  final double? balanceAvailable;

  /// Boolean value: 1 or 0, indicating whether the advertiser's identify has been verified.
  final int? basicVerification;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double? buyCompletionRate;

  /// The average time in seconds taken to cancel orders as a buyer within the past 30 days.
  final int? cancelTimeAvg;

  /// Total value of P2P buy transactions in the past 24 hours.
  final String? dailyBuy;

  /// Maximum allowed value of P2P buy transactions in a 24 hour period.
  final String? dailyBuyLimit;

  /// Total value of P2P sell transactions in the past 24 hours.
  final String? dailySell;

  /// Maximum allowed value of P2P sell transactions in a 24 hour period.
  final String? dailySellLimit;

  /// Default description that can be used every time an advert is created.
  final String? defaultAdvertDescription;

  /// Boolean value: 1 or 0, indicating whether the advertiser's address has been verified.
  final int? fullVerification;

  /// The average time in seconds taken to release funds as a seller within the past 30 days.
  final int? releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the past 30 days.
  final double? sellCompletionRate;

  /// When `true`, the advertiser's real name will be displayed to other users on adverts and orders.
  final bool? showName;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double? totalCompletionRate;
}

/// P2p advertiser create class.
class P2pAdvertiserCreate extends P2pAdvertiserCreateModel {
  /// Initializes
  P2pAdvertiserCreate({
    required int buyOrdersCount,
    required int cancelsRemaining,
    required String chatToken,
    required String chatUserId,
    required String contactInfo,
    required DateTime createdTime,
    required String id,
    required bool isApproved,
    required bool isListed,
    required String name,
    required String paymentInfo,
    required int sellOrdersCount,
    required int totalOrdersCount,
    double? balanceAvailable,
    int? basicVerification,
    double? buyCompletionRate,
    int? cancelTimeAvg,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? defaultAdvertDescription,
    int? fullVerification,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    bool? showName,
    double? totalCompletionRate,
  }) : super(
          buyOrdersCount: buyOrdersCount,
          cancelsRemaining: cancelsRemaining,
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          createdTime: createdTime,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          name: name,
          paymentInfo: paymentInfo,
          sellOrdersCount: sellOrdersCount,
          totalOrdersCount: totalOrdersCount,
          balanceAvailable: balanceAvailable,
          basicVerification: basicVerification,
          buyCompletionRate: buyCompletionRate,
          cancelTimeAvg: cancelTimeAvg,
          dailyBuy: dailyBuy,
          dailyBuyLimit: dailyBuyLimit,
          dailySell: dailySell,
          dailySellLimit: dailySellLimit,
          defaultAdvertDescription: defaultAdvertDescription,
          fullVerification: fullVerification,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          showName: showName,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserCreate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserCreate(
        buyOrdersCount: json['buy_orders_count'],
        cancelsRemaining: json['cancels_remaining'],
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time'])!,
        id: json['id'],
        isApproved: getBool(json['is_approved'])!,
        isListed: getBool(json['is_listed'])!,
        name: json['name'],
        paymentInfo: json['payment_info'],
        sellOrdersCount: json['sell_orders_count'],
        totalOrdersCount: json['total_orders_count'],
        balanceAvailable: getDouble(json['balance_available']),
        basicVerification: json['basic_verification'],
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        cancelTimeAvg: json['cancel_time_avg'],
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        defaultAdvertDescription: json['default_advert_description'],
        fullVerification: json['full_verification'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        showName: getBool(json['show_name']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['cancels_remaining'] = cancelsRemaining;
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['name'] = name;
    resultMap['payment_info'] = paymentInfo;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['balance_available'] = balanceAvailable;
    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['full_verification'] = fullVerification;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['show_name'] = showName;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserCreate copyWith({
    required int buyOrdersCount,
    required int cancelsRemaining,
    required String chatToken,
    required String chatUserId,
    required String contactInfo,
    required DateTime createdTime,
    required String id,
    required bool isApproved,
    required bool isListed,
    required String name,
    required String paymentInfo,
    required int sellOrdersCount,
    required int totalOrdersCount,
    double? balanceAvailable,
    int? basicVerification,
    double? buyCompletionRate,
    int? cancelTimeAvg,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? defaultAdvertDescription,
    int? fullVerification,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    bool? showName,
    double? totalCompletionRate,
  }) =>
      P2pAdvertiserCreate(
        buyOrdersCount: buyOrdersCount,
        cancelsRemaining: cancelsRemaining,
        chatToken: chatToken,
        chatUserId: chatUserId,
        contactInfo: contactInfo,
        createdTime: createdTime,
        id: id,
        isApproved: isApproved,
        isListed: isListed,
        name: name,
        paymentInfo: paymentInfo,
        sellOrdersCount: sellOrdersCount,
        totalOrdersCount: totalOrdersCount,
        balanceAvailable: balanceAvailable ?? this.balanceAvailable,
        basicVerification: basicVerification ?? this.basicVerification,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        dailyBuy: dailyBuy ?? this.dailyBuy,
        dailyBuyLimit: dailyBuyLimit ?? this.dailyBuyLimit,
        dailySell: dailySell ?? this.dailySell,
        dailySellLimit: dailySellLimit ?? this.dailySellLimit,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        fullVerification: fullVerification ?? this.fullVerification,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        showName: showName ?? this.showName,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes.
  SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
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

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    required String id,
  }) =>
      Subscription(
        id: id,
      );
}
