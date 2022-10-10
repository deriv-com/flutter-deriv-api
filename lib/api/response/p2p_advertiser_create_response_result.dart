// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_create_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_create_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p advertiser create response model class.
abstract class P2pAdvertiserCreateResponseModel {
  /// Initializes P2p advertiser create response model class .
  const P2pAdvertiserCreateResponseModel({
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
  /// Initializes P2p advertiser create response class.
  const P2pAdvertiserCreateResponse({
    P2pAdvertiserCreate? p2pAdvertiserCreate,
    Subscription? subscription,
  }) : super(
          p2pAdvertiserCreate: p2pAdvertiserCreate,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
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

  /// Converts an instance to JSON.
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
    P2pAdvertiserCreateRequest request,
  ) async {
    final P2pAdvertiserCreateReceive response =
        await createAdvertiserRaw(request);

    return P2pAdvertiserCreateResponse.fromJson(
        response.p2pAdvertiserCreate, response.subscription);
  }

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Future<P2pAdvertiserCreateReceive> createAdvertiserRaw(
    P2pAdvertiserCreateRequest request,
  ) async {
    final P2pAdvertiserCreateReceive response = await _api.call(
      request: request.copyWith(subscribe: false),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Stream<P2pAdvertiserCreateResponse?> createAdvertiserAndSubscribe(
    P2pAdvertiserCreateRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      createAdvertiserAndSubscribeRaw(
        request,
        comparePredicate: comparePredicate,
      ).map(
        (P2pAdvertiserCreateReceive? response) => response != null
            ? P2pAdvertiserCreateResponse.fromJson(
                response.p2pAdvertiserCreate,
                response.subscription,
              )
            : null,
      );

  /// Registers the client as a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserCreateRequest].
  static Stream<P2pAdvertiserCreateReceive?> createAdvertiserAndSubscribeRaw(
    P2pAdvertiserCreateRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<P2pAdvertiserCreateReceive?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pAdvertiserCreateReceive ? response : null;
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
  /// Initializes P2p advertiser create model class .
  const P2pAdvertiserCreateModel({
    required this.totalTurnover,
    required this.totalOrdersCount,
    required this.showName,
    required this.sellOrdersCount,
    required this.sellOrdersAmount,
    required this.ratingCount,
    required this.paymentInfo,
    required this.partnerCount,
    required this.name,
    required this.isOnline,
    required this.isListed,
    required this.isApproved,
    required this.id,
    required this.fullVerification,
    required this.defaultAdvertDescription,
    required this.createdTime,
    required this.contactInfo,
    required this.chatUserId,
    required this.chatToken,
    required this.cancelsRemaining,
    required this.buyOrdersCount,
    required this.buyOrdersAmount,
    required this.blockedByCount,
    required this.basicVerification,
    required this.balanceAvailable,
    this.advertRates,
    this.buyCompletionRate,
    this.buyTimeAvg,
    this.cancelTimeAvg,
    this.dailyBuy,
    this.dailyBuyLimit,
    this.dailySell,
    this.dailySellLimit,
    this.lastOnlineTime,
    this.ratingAverage,
    this.recommendedAverage,
    this.recommendedCount,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.totalCompletionRate,
    this.withdrawalLimit,
  });

  /// Total order volume since advertiser registration.
  final String totalTurnover;

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;

  /// When `true`, the advertiser's real name will be displayed to other users on adverts and orders.
  final bool showName;

  /// The number of sell order orders completed within the past 30 days.
  final int sellOrdersCount;

  /// Sell order volume in the past 30 days.
  final String sellOrdersAmount;

  /// Number of ratings given to the advertiser.
  final int ratingCount;

  /// Advertiser's payment information.
  final String paymentInfo;

  /// Number of different users the advertiser has traded with since registration.
  final int partnerCount;

  /// The advertiser's displayed name.
  final String name;

  /// Indicates if the advertiser is currently online.
  final bool isOnline;

  /// Indicates if the advertiser's active adverts are listed. When `false`, adverts won't be listed regardless if they are active or not.
  final bool isListed;

  /// The approval status of the advertiser.
  final bool isApproved;

  /// The advertiser's identification number.
  final String id;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's address has been verified.
  final bool fullVerification;

  /// Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

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

  /// Buy order volume in the past 30 days.
  final String buyOrdersAmount;

  /// The number of P2P users who have blocked this advertiser.
  final int blockedByCount;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's identify has been verified.
  final bool basicVerification;

  /// Amount of funds available to sell on P2P. May be less than account balance according to deposit methods used.
  final double balanceAvailable;

  /// Average difference of advert rate compared to the market rate over the past 30 days.
  final double? advertRates;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double? buyCompletionRate;

  /// The average time in seconds taken to make payment as a buyer within the past 30 days.
  final int? buyTimeAvg;

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

  /// Epoch of the latest time the advertiser was online, up to 6 months.
  final DateTime? lastOnlineTime;

  /// Average rating of the advertiser, range is 1-5.
  final double? ratingAverage;

  /// Percentage of users who have recommended the advertiser.
  final double? recommendedAverage;

  /// Number of times the advertiser has been recommended.
  final int? recommendedCount;

  /// The average time in seconds taken to release funds as a seller within the past 30 days.
  final int? releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the past 30 days.
  final double? sellCompletionRate;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double? totalCompletionRate;

  /// Remaining withdrawal_limit of a non-fully authenticated advertiser.
  final String? withdrawalLimit;
}

/// P2p advertiser create class.
class P2pAdvertiserCreate extends P2pAdvertiserCreateModel {
  /// Initializes P2p advertiser create class.
  const P2pAdvertiserCreate({
    required double balanceAvailable,
    required bool basicVerification,
    required int blockedByCount,
    required String buyOrdersAmount,
    required int buyOrdersCount,
    required int cancelsRemaining,
    required String chatToken,
    required String chatUserId,
    required String contactInfo,
    required DateTime createdTime,
    required String defaultAdvertDescription,
    required bool fullVerification,
    required String id,
    required bool isApproved,
    required bool isListed,
    required bool isOnline,
    required String name,
    required int partnerCount,
    required String paymentInfo,
    required int ratingCount,
    required String sellOrdersAmount,
    required int sellOrdersCount,
    required bool showName,
    required int totalOrdersCount,
    required String totalTurnover,
    double? advertRates,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    DateTime? lastOnlineTime,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    double? totalCompletionRate,
    String? withdrawalLimit,
  }) : super(
          balanceAvailable: balanceAvailable,
          basicVerification: basicVerification,
          blockedByCount: blockedByCount,
          buyOrdersAmount: buyOrdersAmount,
          buyOrdersCount: buyOrdersCount,
          cancelsRemaining: cancelsRemaining,
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          createdTime: createdTime,
          defaultAdvertDescription: defaultAdvertDescription,
          fullVerification: fullVerification,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          isOnline: isOnline,
          name: name,
          partnerCount: partnerCount,
          paymentInfo: paymentInfo,
          ratingCount: ratingCount,
          sellOrdersAmount: sellOrdersAmount,
          sellOrdersCount: sellOrdersCount,
          showName: showName,
          totalOrdersCount: totalOrdersCount,
          totalTurnover: totalTurnover,
          advertRates: advertRates,
          buyCompletionRate: buyCompletionRate,
          buyTimeAvg: buyTimeAvg,
          cancelTimeAvg: cancelTimeAvg,
          dailyBuy: dailyBuy,
          dailyBuyLimit: dailyBuyLimit,
          dailySell: dailySell,
          dailySellLimit: dailySellLimit,
          lastOnlineTime: lastOnlineTime,
          ratingAverage: ratingAverage,
          recommendedAverage: recommendedAverage,
          recommendedCount: recommendedCount,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          totalCompletionRate: totalCompletionRate,
          withdrawalLimit: withdrawalLimit,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserCreate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserCreate(
        balanceAvailable: getDouble(json['balance_available'])!,
        basicVerification: getBool(json['basic_verification'])!,
        blockedByCount: json['blocked_by_count'],
        buyOrdersAmount: json['buy_orders_amount'],
        buyOrdersCount: json['buy_orders_count'],
        cancelsRemaining: json['cancels_remaining'],
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time'])!,
        defaultAdvertDescription: json['default_advert_description'],
        fullVerification: getBool(json['full_verification'])!,
        id: json['id'],
        isApproved: getBool(json['is_approved'])!,
        isListed: getBool(json['is_listed'])!,
        isOnline: getBool(json['is_online'])!,
        name: json['name'],
        partnerCount: json['partner_count'],
        paymentInfo: json['payment_info'],
        ratingCount: json['rating_count'],
        sellOrdersAmount: json['sell_orders_amount'],
        sellOrdersCount: json['sell_orders_count'],
        showName: getBool(json['show_name'])!,
        totalOrdersCount: json['total_orders_count'],
        totalTurnover: json['total_turnover'],
        advertRates: getDouble(json['advert_rates']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        buyTimeAvg: json['buy_time_avg'],
        cancelTimeAvg: json['cancel_time_avg'],
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        lastOnlineTime: getDateTime(json['last_online_time']),
        ratingAverage: getDouble(json['rating_average']),
        recommendedAverage: getDouble(json['recommended_average']),
        recommendedCount: json['recommended_count'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
        withdrawalLimit: json['withdrawal_limit'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance_available'] = balanceAvailable;
    resultMap['basic_verification'] = basicVerification;
    resultMap['blocked_by_count'] = blockedByCount;
    resultMap['buy_orders_amount'] = buyOrdersAmount;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['cancels_remaining'] = cancelsRemaining;
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['is_online'] = isOnline;
    resultMap['name'] = name;
    resultMap['partner_count'] = partnerCount;
    resultMap['payment_info'] = paymentInfo;
    resultMap['rating_count'] = ratingCount;
    resultMap['sell_orders_amount'] = sellOrdersAmount;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['show_name'] = showName;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['total_turnover'] = totalTurnover;
    resultMap['advert_rates'] = advertRates;
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['buy_time_avg'] = buyTimeAvg;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['last_online_time'] =
        getSecondsSinceEpochDateTime(lastOnlineTime);
    resultMap['rating_average'] = ratingAverage;
    resultMap['recommended_average'] = recommendedAverage;
    resultMap['recommended_count'] = recommendedCount;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['total_completion_rate'] = totalCompletionRate;
    resultMap['withdrawal_limit'] = withdrawalLimit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserCreate copyWith({
    double? balanceAvailable,
    bool? basicVerification,
    int? blockedByCount,
    String? buyOrdersAmount,
    int? buyOrdersCount,
    int? cancelsRemaining,
    String? chatToken,
    String? chatUserId,
    String? contactInfo,
    DateTime? createdTime,
    String? defaultAdvertDescription,
    bool? fullVerification,
    String? id,
    bool? isApproved,
    bool? isListed,
    bool? isOnline,
    String? name,
    int? partnerCount,
    String? paymentInfo,
    int? ratingCount,
    String? sellOrdersAmount,
    int? sellOrdersCount,
    bool? showName,
    int? totalOrdersCount,
    String? totalTurnover,
    double? advertRates,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    DateTime? lastOnlineTime,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    double? totalCompletionRate,
    String? withdrawalLimit,
  }) =>
      P2pAdvertiserCreate(
        balanceAvailable: balanceAvailable ?? this.balanceAvailable,
        basicVerification: basicVerification ?? this.basicVerification,
        blockedByCount: blockedByCount ?? this.blockedByCount,
        buyOrdersAmount: buyOrdersAmount ?? this.buyOrdersAmount,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        cancelsRemaining: cancelsRemaining ?? this.cancelsRemaining,
        chatToken: chatToken ?? this.chatToken,
        chatUserId: chatUserId ?? this.chatUserId,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        fullVerification: fullVerification ?? this.fullVerification,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isListed: isListed ?? this.isListed,
        isOnline: isOnline ?? this.isOnline,
        name: name ?? this.name,
        partnerCount: partnerCount ?? this.partnerCount,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        ratingCount: ratingCount ?? this.ratingCount,
        sellOrdersAmount: sellOrdersAmount ?? this.sellOrdersAmount,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        showName: showName ?? this.showName,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
        totalTurnover: totalTurnover ?? this.totalTurnover,
        advertRates: advertRates ?? this.advertRates,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        buyTimeAvg: buyTimeAvg ?? this.buyTimeAvg,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        dailyBuy: dailyBuy ?? this.dailyBuy,
        dailyBuyLimit: dailyBuyLimit ?? this.dailyBuyLimit,
        dailySell: dailySell ?? this.dailySell,
        dailySellLimit: dailySellLimit ?? this.dailySellLimit,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
        ratingAverage: ratingAverage ?? this.ratingAverage,
        recommendedAverage: recommendedAverage ?? this.recommendedAverage,
        recommendedCount: recommendedCount ?? this.recommendedCount,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
        withdrawalLimit: withdrawalLimit ?? this.withdrawalLimit,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
