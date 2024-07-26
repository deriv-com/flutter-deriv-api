// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_update_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_update_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p advertiser update response model class.
abstract class P2pAdvertiserUpdateResponseModel {
  /// Initializes P2p advertiser update response model class .
  const P2pAdvertiserUpdateResponseModel({
    this.p2pAdvertiserUpdate,
  });

  /// P2P advertiser information.
  final P2pAdvertiserUpdate? p2pAdvertiserUpdate;
}

/// P2p advertiser update response class.
class P2pAdvertiserUpdateResponse extends P2pAdvertiserUpdateResponseModel {
  /// Initializes P2p advertiser update response class.
  const P2pAdvertiserUpdateResponse({
    super.p2pAdvertiserUpdate,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserUpdateResponse.fromJson(
    dynamic p2pAdvertiserUpdateJson,
  ) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdateJson == null
            ? null
            : P2pAdvertiserUpdate.fromJson(p2pAdvertiserUpdateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserUpdate != null) {
      resultMap['p2p_advertiser_update'] = p2pAdvertiserUpdate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Updates the information of the P2P (peer to peer) advertiser for the current account.
  /// Can only be used by an approved P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserUpdateRequest].
  static Future<P2pAdvertiserUpdateResponse> updateAdvertiser(
    P2pAdvertiserUpdateRequest request,
  ) async {
    final P2pAdvertiserUpdateReceive response =
        await updateAdvertiserRaw(request);

    return P2pAdvertiserUpdateResponse.fromJson(response.p2pAdvertiserUpdate);
  }

  /// Updates the information of the P2P (peer to peer) advertiser for the current account.
  /// Can only be used by an approved P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserUpdateRequest].
  static Future<P2pAdvertiserUpdateReceive> updateAdvertiserRaw(
    P2pAdvertiserUpdateRequest request,
  ) async {
    final P2pAdvertiserUpdateReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserUpdateResponse copyWith({
    P2pAdvertiserUpdate? p2pAdvertiserUpdate,
  }) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
      );
}
/// P2p advertiser update model class.
abstract class P2pAdvertiserUpdateModel {
  /// Initializes P2p advertiser update model class .
  const P2pAdvertiserUpdateModel({
    required this.totalTurnover,
    required this.totalOrdersCount,
    required this.showName,
    required this.sellOrdersCount,
    required this.sellOrdersAmount,
    required this.ratingCount,
    required this.paymentInfo,
    required this.partnerCount,
    required this.name,
    required this.isScheduleAvailable,
    required this.isOnline,
    required this.isListed,
    required this.isApproved,
    required this.id,
    required this.fullVerification,
    required this.defaultAdvertDescription,
    required this.createdTime,
    required this.contactInfo,
    required this.cancelsRemaining,
    required this.buyOrdersCount,
    required this.buyOrdersAmount,
    required this.blockedByCount,
    required this.basicVerification,
    required this.balanceAvailable,
    this.activeFixedAds,
    this.activeFloatAds,
    this.advertRates,
    this.blockTrade,
    this.blockedUntil,
    this.buyCompletionRate,
    this.buyTimeAvg,
    this.cancelTimeAvg,
    this.chatToken,
    this.chatUserId,
    this.dailyBuy,
    this.dailyBuyLimit,
    this.dailySell,
    this.dailySellLimit,
    this.firstName,
    this.lastName,
    this.lastOnlineTime,
    this.maxOrderAmount,
    this.minBalance,
    this.minOrderAmount,
    this.ratingAverage,
    this.recommendedAverage,
    this.recommendedCount,
    this.releaseTimeAvg,
    this.schedule,
    this.sellCompletionRate,
    this.totalCompletionRate,
    this.upgradableDailyLimits,
    this.withdrawalLimit,
  });

  /// Total order volume since advertiser registration.
  final String totalTurnover;

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;

  /// When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
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

  /// Inidcates whether the advertiser's schedule allows P2P transactions at the current time.
  final bool isScheduleAvailable;

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

  /// Number of active fixed rate adverts belonging to the advertiser.
  final int? activeFixedAds;

  /// Number of active floating rate adverts belonging to the advertiser.
  final int? activeFloatAds;

  /// Average difference of advert rate compared to the market rate over the past 30 days.
  final double? advertRates;

  /// Block trading limits, if block trading is allowed.
  final BlockTrade? blockTrade;

  /// If a temporary bar was placed, this is the epoch time at which it will end.
  final DateTime? blockedUntil;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double? buyCompletionRate;

  /// The average time in seconds taken to make payment as a buyer within the past 30 days.
  final int? buyTimeAvg;

  /// The average time in seconds taken to cancel orders as a buyer within the past 30 days.
  final int? cancelTimeAvg;

  /// The token to be used for authenticating the client for chat.
  final String? chatToken;

  /// The unique identifier for the chat user.
  final String? chatUserId;

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

  /// Average rating of the advertiser, range is 1-5.
  final double? ratingAverage;

  /// Percentage of users who have recommended the advertiser.
  final double? recommendedAverage;

  /// Number of times the advertiser has been recommended.
  final int? recommendedCount;

  /// The average time in seconds taken to release funds as a seller within the past 30 days.
  final int? releaseTimeAvg;

  /// [Optional] Weekly availability schedule. Ads are visible and orders can be created only during available periods.
  final List<ScheduleItem>? schedule;

  /// The percentage of completed orders out of total orders as a seller within the past 30 days.
  final double? sellCompletionRate;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double? totalCompletionRate;

  /// New daily limits available.
  final UpgradableDailyLimits? upgradableDailyLimits;

  /// Remaining withdrawal_limit of a non-fully authenticated advertiser.
  final String? withdrawalLimit;
}

/// P2p advertiser update class.
class P2pAdvertiserUpdate extends P2pAdvertiserUpdateModel {
  /// Initializes P2p advertiser update class.
  const P2pAdvertiserUpdate({
    required super.balanceAvailable,
    required super.basicVerification,
    required super.blockedByCount,
    required super.buyOrdersAmount,
    required super.buyOrdersCount,
    required super.cancelsRemaining,
    required super.contactInfo,
    required super.createdTime,
    required super.defaultAdvertDescription,
    required super.fullVerification,
    required super.id,
    required super.isApproved,
    required super.isListed,
    required super.isOnline,
    required super.isScheduleAvailable,
    required super.name,
    required super.partnerCount,
    required super.paymentInfo,
    required super.ratingCount,
    required super.sellOrdersAmount,
    required super.sellOrdersCount,
    required super.showName,
    required super.totalOrdersCount,
    required super.totalTurnover,
    super.activeFixedAds,
    super.activeFloatAds,
    super.advertRates,
    super.blockTrade,
    super.blockedUntil,
    super.buyCompletionRate,
    super.buyTimeAvg,
    super.cancelTimeAvg,
    super.chatToken,
    super.chatUserId,
    super.dailyBuy,
    super.dailyBuyLimit,
    super.dailySell,
    super.dailySellLimit,
    super.firstName,
    super.lastName,
    super.lastOnlineTime,
    super.maxOrderAmount,
    super.minBalance,
    super.minOrderAmount,
    super.ratingAverage,
    super.recommendedAverage,
    super.recommendedCount,
    super.releaseTimeAvg,
    super.schedule,
    super.sellCompletionRate,
    super.totalCompletionRate,
    super.upgradableDailyLimits,
    super.withdrawalLimit,
  });

  /// Creates an instance from JSON.
  factory P2pAdvertiserUpdate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdate(
        balanceAvailable: getDouble(json['balance_available'])!,
        basicVerification: getBool(json['basic_verification'])!,
        blockedByCount: json['blocked_by_count'],
        buyOrdersAmount: json['buy_orders_amount'],
        buyOrdersCount: json['buy_orders_count'],
        cancelsRemaining: json['cancels_remaining'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time'])!,
        defaultAdvertDescription: json['default_advert_description'],
        fullVerification: getBool(json['full_verification'])!,
        id: json['id'],
        isApproved: getBool(json['is_approved'])!,
        isListed: getBool(json['is_listed'])!,
        isOnline: getBool(json['is_online'])!,
        isScheduleAvailable: getBool(json['is_schedule_available'])!,
        name: json['name'],
        partnerCount: json['partner_count'],
        paymentInfo: json['payment_info'],
        ratingCount: json['rating_count'],
        sellOrdersAmount: json['sell_orders_amount'],
        sellOrdersCount: json['sell_orders_count'],
        showName: getBool(json['show_name'])!,
        totalOrdersCount: json['total_orders_count'],
        totalTurnover: json['total_turnover'],
        activeFixedAds: json['active_fixed_ads'],
        activeFloatAds: json['active_float_ads'],
        advertRates: getDouble(json['advert_rates']),
        blockTrade: json['block_trade'] == null
            ? null
            : BlockTrade.fromJson(json['block_trade']),
        blockedUntil: getDateTime(json['blocked_until']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        buyTimeAvg: json['buy_time_avg'],
        cancelTimeAvg: json['cancel_time_avg'],
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        lastOnlineTime: getDateTime(json['last_online_time']),
        maxOrderAmount: json['max_order_amount'],
        minBalance: json['min_balance'],
        minOrderAmount: json['min_order_amount'],
        ratingAverage: getDouble(json['rating_average']),
        recommendedAverage: getDouble(json['recommended_average']),
        recommendedCount: json['recommended_count'],
        releaseTimeAvg: json['release_time_avg'],
        schedule: json['schedule'] == null
            ? null
            : List<ScheduleItem>.from(
                json['schedule']?.map(
                  (dynamic item) => ScheduleItem.fromJson(item),
                ),
              ),
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
        upgradableDailyLimits: json['upgradable_daily_limits'] == null
            ? null
            : UpgradableDailyLimits.fromJson(json['upgradable_daily_limits']),
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
    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['is_online'] = isOnline;
    resultMap['is_schedule_available'] = isScheduleAvailable;
    resultMap['name'] = name;
    resultMap['partner_count'] = partnerCount;
    resultMap['payment_info'] = paymentInfo;
    resultMap['rating_count'] = ratingCount;
    resultMap['sell_orders_amount'] = sellOrdersAmount;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['show_name'] = showName;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['total_turnover'] = totalTurnover;
    resultMap['active_fixed_ads'] = activeFixedAds;
    resultMap['active_float_ads'] = activeFloatAds;
    resultMap['advert_rates'] = advertRates;
    if (blockTrade != null) {
      resultMap['block_trade'] = blockTrade!.toJson();
    }
    resultMap['blocked_until'] = getSecondsSinceEpochDateTime(blockedUntil);
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['buy_time_avg'] = buyTimeAvg;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['last_online_time'] =
        getSecondsSinceEpochDateTime(lastOnlineTime);
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['min_balance'] = minBalance;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['rating_average'] = ratingAverage;
    resultMap['recommended_average'] = recommendedAverage;
    resultMap['recommended_count'] = recommendedCount;
    resultMap['release_time_avg'] = releaseTimeAvg;
    if (schedule != null) {
      resultMap['schedule'] = schedule!
          .map<dynamic>(
            (ScheduleItem item) => item.toJson(),
          )
          .toList();
    }
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['total_completion_rate'] = totalCompletionRate;
    if (upgradableDailyLimits != null) {
      resultMap['upgradable_daily_limits'] = upgradableDailyLimits!.toJson();
    }
    resultMap['withdrawal_limit'] = withdrawalLimit;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserUpdate copyWith({
    double? balanceAvailable,
    bool? basicVerification,
    int? blockedByCount,
    String? buyOrdersAmount,
    int? buyOrdersCount,
    int? cancelsRemaining,
    String? contactInfo,
    DateTime? createdTime,
    String? defaultAdvertDescription,
    bool? fullVerification,
    String? id,
    bool? isApproved,
    bool? isListed,
    bool? isOnline,
    bool? isScheduleAvailable,
    String? name,
    int? partnerCount,
    String? paymentInfo,
    int? ratingCount,
    String? sellOrdersAmount,
    int? sellOrdersCount,
    bool? showName,
    int? totalOrdersCount,
    String? totalTurnover,
    int? activeFixedAds,
    int? activeFloatAds,
    double? advertRates,
    BlockTrade? blockTrade,
    DateTime? blockedUntil,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    String? chatToken,
    String? chatUserId,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? firstName,
    String? lastName,
    DateTime? lastOnlineTime,
    String? maxOrderAmount,
    String? minBalance,
    String? minOrderAmount,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    int? releaseTimeAvg,
    List<ScheduleItem>? schedule,
    double? sellCompletionRate,
    double? totalCompletionRate,
    UpgradableDailyLimits? upgradableDailyLimits,
    String? withdrawalLimit,
  }) =>
      P2pAdvertiserUpdate(
        balanceAvailable: balanceAvailable ?? this.balanceAvailable,
        basicVerification: basicVerification ?? this.basicVerification,
        blockedByCount: blockedByCount ?? this.blockedByCount,
        buyOrdersAmount: buyOrdersAmount ?? this.buyOrdersAmount,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        cancelsRemaining: cancelsRemaining ?? this.cancelsRemaining,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        fullVerification: fullVerification ?? this.fullVerification,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isListed: isListed ?? this.isListed,
        isOnline: isOnline ?? this.isOnline,
        isScheduleAvailable: isScheduleAvailable ?? this.isScheduleAvailable,
        name: name ?? this.name,
        partnerCount: partnerCount ?? this.partnerCount,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        ratingCount: ratingCount ?? this.ratingCount,
        sellOrdersAmount: sellOrdersAmount ?? this.sellOrdersAmount,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        showName: showName ?? this.showName,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
        totalTurnover: totalTurnover ?? this.totalTurnover,
        activeFixedAds: activeFixedAds ?? this.activeFixedAds,
        activeFloatAds: activeFloatAds ?? this.activeFloatAds,
        advertRates: advertRates ?? this.advertRates,
        blockTrade: blockTrade ?? this.blockTrade,
        blockedUntil: blockedUntil ?? this.blockedUntil,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        buyTimeAvg: buyTimeAvg ?? this.buyTimeAvg,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        chatToken: chatToken ?? this.chatToken,
        chatUserId: chatUserId ?? this.chatUserId,
        dailyBuy: dailyBuy ?? this.dailyBuy,
        dailyBuyLimit: dailyBuyLimit ?? this.dailyBuyLimit,
        dailySell: dailySell ?? this.dailySell,
        dailySellLimit: dailySellLimit ?? this.dailySellLimit,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minBalance: minBalance ?? this.minBalance,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        ratingAverage: ratingAverage ?? this.ratingAverage,
        recommendedAverage: recommendedAverage ?? this.recommendedAverage,
        recommendedCount: recommendedCount ?? this.recommendedCount,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        schedule: schedule ?? this.schedule,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
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
/// Schedule item model class.
abstract class ScheduleItemModel {
  /// Initializes Schedule item model class .
  const ScheduleItemModel({
    this.endMin,
    this.startMin,
  });

  /// Minute of week when availablility ends. Zero is Sunday 00:00 UST.
  final int? endMin;

  /// Minute of week when availablility starts. Zero is Sunday 00:00 UST.
  final int? startMin;
}

/// Schedule item class.
class ScheduleItem extends ScheduleItemModel {
  /// Initializes Schedule item class.
  const ScheduleItem({
    super.endMin,
    super.startMin,
  });

  /// Creates an instance from JSON.
  factory ScheduleItem.fromJson(Map<String, dynamic> json) => ScheduleItem(
        endMin: json['end_min'],
        startMin: json['start_min'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['end_min'] = endMin;
    resultMap['start_min'] = startMin;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ScheduleItem copyWith({
    int? endMin,
    int? startMin,
  }) =>
      ScheduleItem(
        endMin: endMin ?? this.endMin,
        startMin: startMin ?? this.startMin,
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
