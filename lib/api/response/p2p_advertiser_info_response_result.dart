// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_info_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_info_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p advertiser info response model class.
abstract class P2pAdvertiserInfoResponseModel {
  /// Initializes P2p advertiser info response model class .
  const P2pAdvertiserInfoResponseModel({
    this.p2pAdvertiserInfo,
    this.subscription,
  });

  /// P2P advertiser information.
  final P2pAdvertiserInfo? p2pAdvertiserInfo;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// P2p advertiser info response class.
class P2pAdvertiserInfoResponse extends P2pAdvertiserInfoResponseModel {
  /// Initializes P2p advertiser info response class.
  const P2pAdvertiserInfoResponse({
    super.p2pAdvertiserInfo,
    super.subscription,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserInfoResponse.fromJson(
    dynamic p2pAdvertiserInfoJson,
    dynamic subscriptionJson,
  ) =>
      P2pAdvertiserInfoResponse(
        p2pAdvertiserInfo: p2pAdvertiserInfoJson == null
            ? null
            : P2pAdvertiserInfo.fromJson(p2pAdvertiserInfoJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserInfo != null) {
      resultMap['p2p_advertiser_info'] = p2pAdvertiserInfo!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Retrieves information about a P2P (peer to peer) advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<P2pAdvertiserInfoResponse> fetchAdvertiserInformation(
    P2pAdvertiserInfoRequest request,
  ) async {
    final P2pAdvertiserInfoReceive response =
        await fetchAdvertiserInformationRaw(request);

    return P2pAdvertiserInfoResponse.fromJson(
        response.p2pAdvertiserInfo, response.subscription);
  }

  /// Retrieves information about a P2P (peer to peer) advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<P2pAdvertiserInfoReceive> fetchAdvertiserInformationRaw(
    P2pAdvertiserInfoRequest request,
  ) async {
    final P2pAdvertiserInfoReceive response = await _api.call(
      request: request.copyWith(subscribe: false),
    );

    return response;
  }

  /// Subscribes to information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Stream<P2pAdvertiserInfoResponse?> subscribeAdvertiserInformation(
    P2pAdvertiserInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeAdvertiserInformationRaw(
        request,
        comparePredicate: comparePredicate,
      ).map(
        (P2pAdvertiserInfoReceive? response) => response == null
            ? null
            : P2pAdvertiserInfoResponse.fromJson(
                response.p2pAdvertiserInfo,
                response.subscription,
              ),
      );

  /// Subscribes to information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Stream<P2pAdvertiserInfoReceive?> subscribeAdvertiserInformationRaw(
    P2pAdvertiserInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<P2pAdvertiserInfoReceive?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pAdvertiserInfoReceive ? response : null;
        },
      );

  /// Unsubscribes from P2P (peer to peer) advertiser information.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  Future<ForgetResponse?> unsubscribeAdvertiser() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all P2P (peer to peer) advertisers.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<ForgetAllResponse> unsubscribeAllAdvertiser() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pAdvertiser);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserInfoResponse copyWith({
    P2pAdvertiserInfo? p2pAdvertiserInfo,
    Subscription? subscription,
  }) =>
      P2pAdvertiserInfoResponse(
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        subscription: subscription ?? this.subscription,
      );
}
/// P2p advertiser info model class.
abstract class P2pAdvertiserInfoModel {
  /// Initializes P2p advertiser info model class .
  const P2pAdvertiserInfoModel({
    required this.totalTurnover,
    required this.totalOrdersCount,
    required this.sellOrdersCount,
    required this.sellOrdersAmount,
    required this.ratingCount,
    required this.partnerCount,
    required this.name,
    required this.isOnline,
    required this.isListed,
    required this.isApproved,
    required this.id,
    required this.fullVerification,
    required this.defaultAdvertDescription,
    required this.createdTime,
    required this.buyOrdersCount,
    required this.buyOrdersAmount,
    required this.basicVerification,
    this.activeFixedAds,
    this.activeFloatAds,
    this.advertRates,
    this.balanceAvailable,
    this.blockTrade,
    this.blockedByCount,
    this.blockedUntil,
    this.buyCompletionRate,
    this.buyTimeAvg,
    this.cancelTimeAvg,
    this.cancelsRemaining,
    this.chatToken,
    this.chatUserId,
    this.contactInfo,
    this.dailyBuy,
    this.dailyBuyLimit,
    this.dailySell,
    this.dailySellLimit,
    this.firstName,
    this.isBlocked,
    this.isFavourite,
    this.isRecommended,
    this.lastName,
    this.lastOnlineTime,
    this.maxOrderAmount,
    this.minBalance,
    this.minOrderAmount,
    this.paymentInfo,
    this.ratingAverage,
    this.recommendedAverage,
    this.recommendedCount,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.showName,
    this.totalCompletionRate,
    this.upgradableDailyLimits,
    this.withdrawalLimit,
  });

  /// Total order volume since advertiser registration.
  final String totalTurnover;

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;

  /// The number of sell order orders completed within the past 30 days.
  final int sellOrdersCount;

  /// Sell order volume in the past 30 days.
  final String sellOrdersAmount;

  /// Number of ratings given to the advertiser.
  final int ratingCount;

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

  /// The number of buy order completed within the past 30 days.
  final int buyOrdersCount;

  /// Buy order volume in the past 30 days.
  final String buyOrdersAmount;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's identify has been verified.
  final bool basicVerification;

  /// Number of active fixed rate adverts belonging to the advertiser.
  final int? activeFixedAds;

  /// Number of active floating rate adverts belonging to the advertiser.
  final int? activeFloatAds;

  /// Average difference of advert rate compared to the market rate over the past 30 days.
  final double? advertRates;

  /// Amount of funds available to sell on P2P. May be less than account balance according to deposit methods used.
  final double? balanceAvailable;

  /// Block trading limits, if block trading is allowed.
  final BlockTrade? blockTrade;

  /// The number of P2P users who have blocked this advertiser.
  final int? blockedByCount;

  /// If a temporary bar was placed, this is the epoch time at which it will end.
  final DateTime? blockedUntil;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double? buyCompletionRate;

  /// The average time in seconds taken to make payment as a buyer within the past 30 days.
  final int? buyTimeAvg;

  /// The average time in seconds taken to cancel orders as a buyer within the past 30 days.
  final int? cancelTimeAvg;

  /// The number of times the user may cancel orders before being temporarily blocked.
  final int? cancelsRemaining;

  /// The token to be used for authenticating the client for chat.
  final String? chatToken;

  /// The unique identifier for the chat user.
  final String? chatUserId;

  /// Advertiser's contact information.
  final String? contactInfo;

  /// Total value of P2P buy transactions in the past 24 hours.
  final String? dailyBuy;

  /// Maximum allowed value of P2P buy transactions in a 24 hour period.
  final String? dailyBuyLimit;

  /// Total value of P2P sell transactions in the past 24 hours.
  final String? dailySell;

  /// Maximum allowed value of P2P sell transactions in a 24 hour period.
  final String? dailySellLimit;

  /// The advertiser's first name.
  final String? firstName;

  /// Indicates that the advertiser is blocked by the current user.
  final bool? isBlocked;

  /// Indicates that the advertiser is a favourite of the current user
  final bool? isFavourite;

  /// Indicates that the advertiser was recommended in the most recent review by the current user.
  final int? isRecommended;

  /// The advertiser's last name.
  final String? lastName;

  /// Epoch of the latest time the advertiser was online, up to 6 months.
  final DateTime? lastOnlineTime;

  /// Maximum order amount for adverts.
  final String? maxOrderAmount;

  /// Sell ads will be hidden when your available balance or remaining daily sell limit falls beneath this value.
  final String? minBalance;

  /// Minimum order amount for adverts.
  final String? minOrderAmount;

  /// Advertiser's payment information.
  final String? paymentInfo;

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

  /// When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
  final bool? showName;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double? totalCompletionRate;

  /// New daily limits available.
  final UpgradableDailyLimits? upgradableDailyLimits;

  /// Remaining withdrawal_limit of a non-fully authenticated advertiser.
  final String? withdrawalLimit;
}

/// P2p advertiser info class.
class P2pAdvertiserInfo extends P2pAdvertiserInfoModel {
  /// Initializes P2p advertiser info class.
  const P2pAdvertiserInfo({
    required super.basicVerification,
    required super.buyOrdersAmount,
    required super.buyOrdersCount,
    required super.createdTime,
    required super.defaultAdvertDescription,
    required super.fullVerification,
    required super.id,
    required super.isApproved,
    required super.isListed,
    required super.isOnline,
    required super.name,
    required super.partnerCount,
    required super.ratingCount,
    required super.sellOrdersAmount,
    required super.sellOrdersCount,
    required super.totalOrdersCount,
    required super.totalTurnover,
    super.activeFixedAds,
    super.activeFloatAds,
    super.advertRates,
    super.balanceAvailable,
    super.blockTrade,
    super.blockedByCount,
    super.blockedUntil,
    super.buyCompletionRate,
    super.buyTimeAvg,
    super.cancelTimeAvg,
    super.cancelsRemaining,
    super.chatToken,
    super.chatUserId,
    super.contactInfo,
    super.dailyBuy,
    super.dailyBuyLimit,
    super.dailySell,
    super.dailySellLimit,
    super.firstName,
    super.isBlocked,
    super.isFavourite,
    super.isRecommended,
    super.lastName,
    super.lastOnlineTime,
    super.maxOrderAmount,
    super.minBalance,
    super.minOrderAmount,
    super.paymentInfo,
    super.ratingAverage,
    super.recommendedAverage,
    super.recommendedCount,
    super.releaseTimeAvg,
    super.sellCompletionRate,
    super.showName,
    super.totalCompletionRate,
    super.upgradableDailyLimits,
    super.withdrawalLimit,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserInfo.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserInfo(
        basicVerification: getBool(json['basic_verification'])!,
        buyOrdersAmount: json['buy_orders_amount'],
        buyOrdersCount: json['buy_orders_count'],
        createdTime: getDateTime(json['created_time'])!,
        defaultAdvertDescription: json['default_advert_description'],
        fullVerification: getBool(json['full_verification'])!,
        id: json['id'],
        isApproved: getBool(json['is_approved'])!,
        isListed: getBool(json['is_listed'])!,
        isOnline: getBool(json['is_online'])!,
        name: json['name'],
        partnerCount: json['partner_count'],
        ratingCount: json['rating_count'],
        sellOrdersAmount: json['sell_orders_amount'],
        sellOrdersCount: json['sell_orders_count'],
        totalOrdersCount: json['total_orders_count'],
        totalTurnover: json['total_turnover'],
        activeFixedAds: json['active_fixed_ads'],
        activeFloatAds: json['active_float_ads'],
        advertRates: getDouble(json['advert_rates']),
        balanceAvailable: getDouble(json['balance_available']),
        blockTrade: json['block_trade'] == null
            ? null
            : BlockTrade.fromJson(json['block_trade']),
        blockedByCount: json['blocked_by_count'],
        blockedUntil: getDateTime(json['blocked_until']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        buyTimeAvg: json['buy_time_avg'],
        cancelTimeAvg: json['cancel_time_avg'],
        cancelsRemaining: json['cancels_remaining'],
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        firstName: json['first_name'],
        isBlocked: getBool(json['is_blocked']),
        isFavourite: getBool(json['is_favourite']),
        isRecommended: json['is_recommended'],
        lastName: json['last_name'],
        lastOnlineTime: getDateTime(json['last_online_time']),
        maxOrderAmount: json['max_order_amount'],
        minBalance: json['min_balance'],
        minOrderAmount: json['min_order_amount'],
        paymentInfo: json['payment_info'],
        ratingAverage: getDouble(json['rating_average']),
        recommendedAverage: getDouble(json['recommended_average']),
        recommendedCount: json['recommended_count'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        showName: getBool(json['show_name']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
        upgradableDailyLimits: json['upgradable_daily_limits'] == null
            ? null
            : UpgradableDailyLimits.fromJson(json['upgradable_daily_limits']),
        withdrawalLimit: json['withdrawal_limit'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_orders_amount'] = buyOrdersAmount;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['is_online'] = isOnline;
    resultMap['name'] = name;
    resultMap['partner_count'] = partnerCount;
    resultMap['rating_count'] = ratingCount;
    resultMap['sell_orders_amount'] = sellOrdersAmount;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['total_turnover'] = totalTurnover;
    resultMap['active_fixed_ads'] = activeFixedAds;
    resultMap['active_float_ads'] = activeFloatAds;
    resultMap['advert_rates'] = advertRates;
    resultMap['balance_available'] = balanceAvailable;
    if (blockTrade != null) {
      resultMap['block_trade'] = blockTrade!.toJson();
    }
    resultMap['blocked_by_count'] = blockedByCount;
    resultMap['blocked_until'] = getSecondsSinceEpochDateTime(blockedUntil);
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['buy_time_avg'] = buyTimeAvg;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['cancels_remaining'] = cancelsRemaining;
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['contact_info'] = contactInfo;
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['first_name'] = firstName;
    resultMap['is_blocked'] = isBlocked;
    resultMap['is_favourite'] = isFavourite;
    resultMap['is_recommended'] = isRecommended;
    resultMap['last_name'] = lastName;
    resultMap['last_online_time'] =
        getSecondsSinceEpochDateTime(lastOnlineTime);
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['min_balance'] = minBalance;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['payment_info'] = paymentInfo;
    resultMap['rating_average'] = ratingAverage;
    resultMap['recommended_average'] = recommendedAverage;
    resultMap['recommended_count'] = recommendedCount;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['show_name'] = showName;
    resultMap['total_completion_rate'] = totalCompletionRate;
    if (upgradableDailyLimits != null) {
      resultMap['upgradable_daily_limits'] = upgradableDailyLimits!.toJson();
    }
    resultMap['withdrawal_limit'] = withdrawalLimit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserInfo copyWith({
    bool? basicVerification,
    String? buyOrdersAmount,
    int? buyOrdersCount,
    DateTime? createdTime,
    String? defaultAdvertDescription,
    bool? fullVerification,
    String? id,
    bool? isApproved,
    bool? isListed,
    bool? isOnline,
    String? name,
    int? partnerCount,
    int? ratingCount,
    String? sellOrdersAmount,
    int? sellOrdersCount,
    int? totalOrdersCount,
    String? totalTurnover,
    int? activeFixedAds,
    int? activeFloatAds,
    double? advertRates,
    double? balanceAvailable,
    BlockTrade? blockTrade,
    int? blockedByCount,
    DateTime? blockedUntil,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    int? cancelsRemaining,
    String? chatToken,
    String? chatUserId,
    String? contactInfo,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? firstName,
    bool? isBlocked,
    bool? isFavourite,
    int? isRecommended,
    String? lastName,
    DateTime? lastOnlineTime,
    String? maxOrderAmount,
    String? minBalance,
    String? minOrderAmount,
    String? paymentInfo,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    bool? showName,
    double? totalCompletionRate,
    UpgradableDailyLimits? upgradableDailyLimits,
    String? withdrawalLimit,
  }) =>
      P2pAdvertiserInfo(
        basicVerification: basicVerification ?? this.basicVerification,
        buyOrdersAmount: buyOrdersAmount ?? this.buyOrdersAmount,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
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
        ratingCount: ratingCount ?? this.ratingCount,
        sellOrdersAmount: sellOrdersAmount ?? this.sellOrdersAmount,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
        totalTurnover: totalTurnover ?? this.totalTurnover,
        activeFixedAds: activeFixedAds ?? this.activeFixedAds,
        activeFloatAds: activeFloatAds ?? this.activeFloatAds,
        advertRates: advertRates ?? this.advertRates,
        balanceAvailable: balanceAvailable ?? this.balanceAvailable,
        blockTrade: blockTrade ?? this.blockTrade,
        blockedByCount: blockedByCount ?? this.blockedByCount,
        blockedUntil: blockedUntil ?? this.blockedUntil,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        buyTimeAvg: buyTimeAvg ?? this.buyTimeAvg,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        cancelsRemaining: cancelsRemaining ?? this.cancelsRemaining,
        chatToken: chatToken ?? this.chatToken,
        chatUserId: chatUserId ?? this.chatUserId,
        contactInfo: contactInfo ?? this.contactInfo,
        dailyBuy: dailyBuy ?? this.dailyBuy,
        dailyBuyLimit: dailyBuyLimit ?? this.dailyBuyLimit,
        dailySell: dailySell ?? this.dailySell,
        dailySellLimit: dailySellLimit ?? this.dailySellLimit,
        firstName: firstName ?? this.firstName,
        isBlocked: isBlocked ?? this.isBlocked,
        isFavourite: isFavourite ?? this.isFavourite,
        isRecommended: isRecommended ?? this.isRecommended,
        lastName: lastName ?? this.lastName,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minBalance: minBalance ?? this.minBalance,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        ratingAverage: ratingAverage ?? this.ratingAverage,
        recommendedAverage: recommendedAverage ?? this.recommendedAverage,
        recommendedCount: recommendedCount ?? this.recommendedCount,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        showName: showName ?? this.showName,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
        upgradableDailyLimits:
            upgradableDailyLimits ?? this.upgradableDailyLimits,
        withdrawalLimit: withdrawalLimit ?? this.withdrawalLimit,
      );
}
/// Block trade model class.
abstract class BlockTradeModel {
  /// Initializes Block trade model class .
  const BlockTradeModel({
    required this.minOrderAmount,
    required this.maxOrderAmount,
  });

  /// Minimum order amount for block trade adverts.
  final String minOrderAmount;

  /// Maximum order amount for block trade adverts.
  final String maxOrderAmount;
}

/// Block trade class.
class BlockTrade extends BlockTradeModel {
  /// Initializes Block trade class.
  const BlockTrade({
    required super.maxOrderAmount,
    required super.minOrderAmount,
  });

  /// Creates an instance from JSON.
  factory BlockTrade.fromJson(Map<String, dynamic> json) => BlockTrade(
        maxOrderAmount: json['max_order_amount'],
        minOrderAmount: json['min_order_amount'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['min_order_amount'] = minOrderAmount;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  BlockTrade copyWith({
    String? maxOrderAmount,
    String? minOrderAmount,
  }) =>
      BlockTrade(
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
      );
}
/// Upgradable daily limits model class.
abstract class UpgradableDailyLimitsModel {
  /// Initializes Upgradable daily limits model class .
  const UpgradableDailyLimitsModel({
    required this.maxDailySell,
    required this.maxDailyBuy,
    this.blockTrade,
  });

  /// Upgradable daily sell limit.
  final String maxDailySell;

  /// Upgradable daily buy limit.
  final String maxDailyBuy;

  /// When `true`, upgrade will provide block trading.
  final bool? blockTrade;
}

/// Upgradable daily limits class.
class UpgradableDailyLimits extends UpgradableDailyLimitsModel {
  /// Initializes Upgradable daily limits class.
  const UpgradableDailyLimits({
    required super.maxDailyBuy,
    required super.maxDailySell,
    super.blockTrade,
  });

  /// Creates an instance from JSON.
  factory UpgradableDailyLimits.fromJson(Map<String, dynamic> json) =>
      UpgradableDailyLimits(
        maxDailyBuy: json['max_daily_buy'],
        maxDailySell: json['max_daily_sell'],
        blockTrade: getBool(json['block_trade']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max_daily_buy'] = maxDailyBuy;
    resultMap['max_daily_sell'] = maxDailySell;
    resultMap['block_trade'] = blockTrade;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  UpgradableDailyLimits copyWith({
    String? maxDailyBuy,
    String? maxDailySell,
    bool? blockTrade,
  }) =>
      UpgradableDailyLimits(
        maxDailyBuy: maxDailyBuy ?? this.maxDailyBuy,
        maxDailySell: maxDailySell ?? this.maxDailySell,
        blockTrade: blockTrade ?? this.blockTrade,
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
    required super.id,
  });

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
