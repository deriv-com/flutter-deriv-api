// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_receive_result.dart';
import 'package:flutter_deriv_api/api/response/forget_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_info_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_info_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// P2p advertiser info response model class.
abstract class P2pAdvertiserInfoResponseModel {
  /// Initializes P2p advertiser info response model class .
  P2pAdvertiserInfoResponseModel({
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
  P2pAdvertiserInfoResponse({
    P2pAdvertiserInfo? p2pAdvertiserInfo,
    Subscription? subscription,
  }) : super(
          p2pAdvertiserInfo: p2pAdvertiserInfo,
          subscription: subscription,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves information about a P2P (peer to peer) advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  /// Throws a [P2PAdvertiserException] if API response contains an error
  static Future<P2pAdvertiserInfoResponse> fetchAdvertiserInformation(
    P2pAdvertiserInfoRequest request,
  ) async {
    final P2pAdvertiserInfoReceive response = await _api.call(
      request: request.copyWith(subscribe: false),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserInfoResponse.fromJson(
        response.p2pAdvertiserInfo, response.subscription);
  }

  /// Subscribes to information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Stream<P2pAdvertiserInfoResponse?> subscribeAdvertiserInformation(
    P2pAdvertiserInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<P2pAdvertiserInfoResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pAdvertiserInfoReceive
              ? P2pAdvertiserInfoResponse.fromJson(
                  response.p2pAdvertiserInfo,
                  response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from P2P (peer to peer) advertiser information.
  ///
  /// Throws a [P2PAdvertiserException] if API response contains an error
  Future<ForgetResponse?> unsubscribeAdvertiser() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all P2P (peer to peer) advertisers.
  ///
  /// Throws a [P2PAdvertiserException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllAdvertiser() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pAdvertiser);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
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
  P2pAdvertiserInfoModel({
    required this.totalOrdersCount,
    required this.sellOrdersCount,
    required this.name,
    required this.isListed,
    required this.isApproved,
    required this.id,
    required this.fullVerification,
    required this.favourited,
    required this.createdTime,
    required this.buyOrdersCount,
    required this.basicVerification,
    this.balanceAvailable,
    this.blockedUntil,
    this.buyCompletionRate,
    this.cancelTimeAvg,
    this.cancelsRemaining,
    this.chatToken,
    this.chatUserId,
    this.contactInfo,
    this.dailyBuy,
    this.dailyBuyLimit,
    this.dailySell,
    this.dailySellLimit,
    this.defaultAdvertDescription,
    this.firstName,
    this.isBlocked,
    this.isFavourite,
    this.lastName,
    this.maxOrderAmount,
    this.minBalance,
    this.minOrderAmount,
    this.paymentInfo,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.showName,
    this.totalCompletionRate,
  });

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;

  /// The number of sell order orders completed within the past 30 days.
  final int sellOrdersCount;

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

  /// Number of other users who have favourited this advertiser.
  final int favourited;

  /// The epoch time that the client became an advertiser.
  final DateTime createdTime;

  /// The number of buy order completed within the past 30 days.
  final int buyOrdersCount;

  /// Boolean value: 1 or 0, indicating whether the advertiser's identify has been verified.
  final int basicVerification;

  /// Amount of funds available to sell on P2P. May be less than account balance according to deposit methods used.
  final double? balanceAvailable;

  /// If a temporary bar was placed, this is the epoch time at which it will end.
  final DateTime? blockedUntil;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double? buyCompletionRate;

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

  /// Default description that can be used every time an advert is created.
  final String? defaultAdvertDescription;

  /// The advertiser's first name.
  final String? firstName;

  /// Indicates that the advertiser is blocked by the current user.
  final int? isBlocked;

  /// Indicates that the advertiser is a favourite of the current user
  final int? isFavourite;

  /// The advertiser's last name.
  final String? lastName;

  /// Maximum order amount for adverts.
  final String? maxOrderAmount;

  /// Sell ads will be hidden when your available balance or remaining daily sell limit falls beneath this value.
  final String? minBalance;

  /// Minimum order amount for adverts.
  final String? minOrderAmount;

  /// Advertiser's payment information.
  final String? paymentInfo;

  /// The average time in seconds taken to release funds as a seller within the past 30 days.
  final int? releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the past 30 days.
  final double? sellCompletionRate;

  /// When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
  final bool? showName;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double? totalCompletionRate;
}

/// P2p advertiser info class.
class P2pAdvertiserInfo extends P2pAdvertiserInfoModel {
  /// Initializes P2p advertiser info class.
  P2pAdvertiserInfo({
    required int basicVerification,
    required int buyOrdersCount,
    required DateTime createdTime,
    required int favourited,
    required int fullVerification,
    required String id,
    required bool isApproved,
    required bool isListed,
    required String name,
    required int sellOrdersCount,
    required int totalOrdersCount,
    double? balanceAvailable,
    DateTime? blockedUntil,
    double? buyCompletionRate,
    int? cancelTimeAvg,
    int? cancelsRemaining,
    String? chatToken,
    String? chatUserId,
    String? contactInfo,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? defaultAdvertDescription,
    String? firstName,
    int? isBlocked,
    int? isFavourite,
    String? lastName,
    String? maxOrderAmount,
    String? minBalance,
    String? minOrderAmount,
    String? paymentInfo,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    bool? showName,
    double? totalCompletionRate,
  }) : super(
          basicVerification: basicVerification,
          buyOrdersCount: buyOrdersCount,
          createdTime: createdTime,
          favourited: favourited,
          fullVerification: fullVerification,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          name: name,
          sellOrdersCount: sellOrdersCount,
          totalOrdersCount: totalOrdersCount,
          balanceAvailable: balanceAvailable,
          blockedUntil: blockedUntil,
          buyCompletionRate: buyCompletionRate,
          cancelTimeAvg: cancelTimeAvg,
          cancelsRemaining: cancelsRemaining,
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          dailyBuy: dailyBuy,
          dailyBuyLimit: dailyBuyLimit,
          dailySell: dailySell,
          dailySellLimit: dailySellLimit,
          defaultAdvertDescription: defaultAdvertDescription,
          firstName: firstName,
          isBlocked: isBlocked,
          isFavourite: isFavourite,
          lastName: lastName,
          maxOrderAmount: maxOrderAmount,
          minBalance: minBalance,
          minOrderAmount: minOrderAmount,
          paymentInfo: paymentInfo,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          showName: showName,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserInfo.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserInfo(
        basicVerification: json['basic_verification'],
        buyOrdersCount: json['buy_orders_count'],
        createdTime: getDateTime(json['created_time'])!,
        favourited: json['favourited'],
        fullVerification: json['full_verification'],
        id: json['id'],
        isApproved: getBool(json['is_approved'])!,
        isListed: getBool(json['is_listed'])!,
        name: json['name'],
        sellOrdersCount: json['sell_orders_count'],
        totalOrdersCount: json['total_orders_count'],
        balanceAvailable: getDouble(json['balance_available']),
        blockedUntil: getDateTime(json['blocked_until']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        cancelTimeAvg: json['cancel_time_avg'],
        cancelsRemaining: json['cancels_remaining'],
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        defaultAdvertDescription: json['default_advert_description'],
        firstName: json['first_name'],
        isBlocked: json['is_blocked'],
        isFavourite: json['is_favourite'],
        lastName: json['last_name'],
        maxOrderAmount: json['max_order_amount'],
        minBalance: json['min_balance'],
        minOrderAmount: json['min_order_amount'],
        paymentInfo: json['payment_info'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        showName: getBool(json['show_name']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['favourited'] = favourited;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['name'] = name;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['balance_available'] = balanceAvailable;
    resultMap['blocked_until'] = getSecondsSinceEpochDateTime(blockedUntil);
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['cancels_remaining'] = cancelsRemaining;
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['contact_info'] = contactInfo;
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['first_name'] = firstName;
    resultMap['is_blocked'] = isBlocked;
    resultMap['is_favourite'] = isFavourite;
    resultMap['last_name'] = lastName;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['min_balance'] = minBalance;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['payment_info'] = paymentInfo;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['show_name'] = showName;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserInfo copyWith({
    required int basicVerification,
    required int buyOrdersCount,
    required DateTime createdTime,
    required int favourited,
    required int fullVerification,
    required String id,
    required bool isApproved,
    required bool isListed,
    required String name,
    required int sellOrdersCount,
    required int totalOrdersCount,
    double? balanceAvailable,
    DateTime? blockedUntil,
    double? buyCompletionRate,
    int? cancelTimeAvg,
    int? cancelsRemaining,
    String? chatToken,
    String? chatUserId,
    String? contactInfo,
    String? dailyBuy,
    String? dailyBuyLimit,
    String? dailySell,
    String? dailySellLimit,
    String? defaultAdvertDescription,
    String? firstName,
    int? isBlocked,
    int? isFavourite,
    String? lastName,
    String? maxOrderAmount,
    String? minBalance,
    String? minOrderAmount,
    String? paymentInfo,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    bool? showName,
    double? totalCompletionRate,
  }) =>
      P2pAdvertiserInfo(
        basicVerification: basicVerification,
        buyOrdersCount: buyOrdersCount,
        createdTime: createdTime,
        favourited: favourited,
        fullVerification: fullVerification,
        id: id,
        isApproved: isApproved,
        isListed: isListed,
        name: name,
        sellOrdersCount: sellOrdersCount,
        totalOrdersCount: totalOrdersCount,
        balanceAvailable: balanceAvailable ?? this.balanceAvailable,
        blockedUntil: blockedUntil ?? this.blockedUntil,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        cancelsRemaining: cancelsRemaining ?? this.cancelsRemaining,
        chatToken: chatToken ?? this.chatToken,
        chatUserId: chatUserId ?? this.chatUserId,
        contactInfo: contactInfo ?? this.contactInfo,
        dailyBuy: dailyBuy ?? this.dailyBuy,
        dailyBuyLimit: dailyBuyLimit ?? this.dailyBuyLimit,
        dailySell: dailySell ?? this.dailySell,
        dailySellLimit: dailySellLimit ?? this.dailySellLimit,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        firstName: firstName ?? this.firstName,
        isBlocked: isBlocked ?? this.isBlocked,
        isFavourite: isFavourite ?? this.isFavourite,
        lastName: lastName ?? this.lastName,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        minBalance: minBalance ?? this.minBalance,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        showName: showName ?? this.showName,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  Subscription({
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
    required String id,
  }) =>
      Subscription(
        id: id,
      );
}
