import 'package:meta/meta.dart';

import '../../basic_api/generated/forget_all_receive.dart';
import '../../basic_api/generated/forget_receive.dart';
import '../../basic_api/generated/p2p_advertiser_info_receive.dart';
import '../../basic_api/generated/p2p_advertiser_info_send.dart';
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

/// P2p advertiser info response model class
abstract class P2pAdvertiserInfoResponseModel {
  /// Initializes
  P2pAdvertiserInfoResponseModel({
    @required this.p2pAdvertiserInfo,
    @required this.subscription,
  });

  /// P2P advertiser information.
  final P2pAdvertiserInfo p2pAdvertiserInfo;

  /// For subscription requests only.
  final Subscription subscription;
}

/// P2p advertiser info response class
class P2pAdvertiserInfoResponse extends P2pAdvertiserInfoResponseModel {
  /// Initializes
  P2pAdvertiserInfoResponse({
    @required P2pAdvertiserInfo p2pAdvertiserInfo,
    @required Subscription subscription,
  }) : super(
          p2pAdvertiserInfo: p2pAdvertiserInfo,
          subscription: subscription,
        );

  /// Creates an instance from JSON
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

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserInfo != null) {
      resultMap['p2p_advertiser_info'] = p2pAdvertiserInfo.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Retrieves information about a P2P (peer to peer) advertiser.
  ///
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  /// Throws a [P2PAdvertiserException] if API response contains an error
  static Future<P2pAdvertiserInfoResponse> fetchAdvertiserInformation(
    P2pAdvertiserInfoSend request,
  ) async {
    final P2pAdvertiserInfoReceive response = await _api.call(
      request: request.copyWith(subscribe: false),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserInfoResponse.fromJson(
        response.p2pAdvertiserInfo, response.subscription);
  }

  /// Subscribes to information about a P2P (peer to peer) advertiser.
  /// For parameters information refer to [P2pAdvertiserInfoRequest].
  static Stream<P2pAdvertiserInfoResponse> subscribeAdvertiserInformation(
    P2pAdvertiserInfoSend request, {
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)
          .map<P2pAdvertiserInfoResponse>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
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
  Future<ForgetResponse> unsubscribeAdvertiser() async {
    if (subscription?.id == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
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
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserInfoResponse copyWith({
    P2pAdvertiserInfo p2pAdvertiserInfo,
    Subscription subscription,
  }) =>
      P2pAdvertiserInfoResponse(
        p2pAdvertiserInfo: p2pAdvertiserInfo ?? this.p2pAdvertiserInfo,
        subscription: subscription ?? this.subscription,
      );
}
/// P2p advertiser info model class
abstract class P2pAdvertiserInfoModel {
  /// Initializes
  P2pAdvertiserInfoModel({
    @required this.basicVerification,
    this.buyCompletionRate,
    @required this.buyOrdersCount,
    this.cancelTimeAvg,
    @required this.chatToken,
    @required this.chatUserId,
    @required this.contactInfo,
    @required this.createdTime,
    @required this.dailyBuy,
    @required this.dailyBuyLimit,
    @required this.dailySell,
    @required this.dailySellLimit,
    @required this.defaultAdvertDescription,
    @required this.firstName,
    @required this.fullVerification,
    @required this.id,
    @required this.isApproved,
    @required this.isListed,
    @required this.lastName,
    @required this.name,
    @required this.paymentInfo,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    @required this.sellOrdersCount,
    @required this.showName,
    this.totalCompletionRate,
    @required this.totalOrdersCount,
  });

  /// Boolean value: `true` or `false`, indicating whether the advertiser's identify has been verified.
  final bool basicVerification;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double buyCompletionRate;

  /// The number of buy order completed within the past 30 days.
  final int buyOrdersCount;

  /// The average time in seconds taken to cancel orders as a buyer within the past 30 days.
  final DateTime cancelTimeAvg;

  /// The token to be used for authenticating the client for chat.
  final String chatToken;

  /// The unique identifier for the chat user.
  final String chatUserId;

  /// Advertiser's contact information.
  final String contactInfo;

  /// The epoch time that the client became an advertiser.
  final DateTime createdTime;

  /// Total value of P2P buy transactions in the past 24 hours.
  final String dailyBuy;

  /// Maximum allowed value of P2P buy transactions in a 24 hour period.
  final String dailyBuyLimit;

  /// Total value of P2P sell transactions in the past 24 hours.
  final String dailySell;

  /// Maximum allowed value of P2P sell transactions in a 24 hour period.
  final String dailySellLimit;

  /// Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// The advertiser's first name.
  final String firstName;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's address has been verified.
  final bool fullVerification;

  /// The advertiser's identification number.
  final String id;

  /// The approval status of the advertiser.
  final bool isApproved;

  /// Indicates if the advertiser's active adverts are listed. When `false`, adverts won't be listed regardless if they are active or not.
  final bool isListed;

  /// The advertiser's last name.
  final String lastName;

  /// The advertiser's displayed name.
  final String name;

  /// Advertiser's payment information.
  final String paymentInfo;

  /// The average time in seconds taken to release funds as a seller within the past 30 days.
  final DateTime releaseTimeAvg;

  /// The percentage of completed orders out of total orders as a seller within the past 30 days.
  final double sellCompletionRate;

  /// The number of sell order orders completed within the past 30 days.
  final int sellOrdersCount;

  /// When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
  final bool showName;

  /// The percentage of completed orders out of all orders within the past 30 days.
  final double totalCompletionRate;

  /// The total number of orders completed since advertiser registration.
  final int totalOrdersCount;
}

/// P2p advertiser info class
class P2pAdvertiserInfo extends P2pAdvertiserInfoModel {
  /// Initializes
  P2pAdvertiserInfo({
    @required bool basicVerification,
    double buyCompletionRate,
    @required int buyOrdersCount,
    DateTime cancelTimeAvg,
    @required String chatToken,
    @required String chatUserId,
    @required String contactInfo,
    @required DateTime createdTime,
    @required String dailyBuy,
    @required String dailyBuyLimit,
    @required String dailySell,
    @required String dailySellLimit,
    @required String defaultAdvertDescription,
    @required String firstName,
    @required bool fullVerification,
    @required String id,
    @required bool isApproved,
    @required bool isListed,
    @required String lastName,
    @required String name,
    @required String paymentInfo,
    DateTime releaseTimeAvg,
    double sellCompletionRate,
    @required int sellOrdersCount,
    @required bool showName,
    double totalCompletionRate,
    @required int totalOrdersCount,
  }) : super(
          basicVerification: basicVerification,
          buyCompletionRate: buyCompletionRate,
          buyOrdersCount: buyOrdersCount,
          cancelTimeAvg: cancelTimeAvg,
          chatToken: chatToken,
          chatUserId: chatUserId,
          contactInfo: contactInfo,
          createdTime: createdTime,
          dailyBuy: dailyBuy,
          dailyBuyLimit: dailyBuyLimit,
          dailySell: dailySell,
          dailySellLimit: dailySellLimit,
          defaultAdvertDescription: defaultAdvertDescription,
          firstName: firstName,
          fullVerification: fullVerification,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          lastName: lastName,
          name: name,
          paymentInfo: paymentInfo,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          sellOrdersCount: sellOrdersCount,
          showName: showName,
          totalCompletionRate: totalCompletionRate,
          totalOrdersCount: totalOrdersCount,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserInfo.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserInfo(
        basicVerification: getBool(json['basic_verification']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        buyOrdersCount: json['buy_orders_count'],
        cancelTimeAvg: getDateTime(json['cancel_time_avg']),
        chatToken: json['chat_token'],
        chatUserId: json['chat_user_id'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time']),
        dailyBuy: json['daily_buy'],
        dailyBuyLimit: json['daily_buy_limit'],
        dailySell: json['daily_sell'],
        dailySellLimit: json['daily_sell_limit'],
        defaultAdvertDescription: json['default_advert_description'],
        firstName: json['first_name'],
        fullVerification: getBool(json['full_verification']),
        id: json['id'],
        isApproved: getBool(json['is_approved']),
        isListed: getBool(json['is_listed']),
        lastName: json['last_name'],
        name: json['name'],
        paymentInfo: json['payment_info'],
        releaseTimeAvg: getDateTime(json['release_time_avg']),
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        sellOrdersCount: json['sell_orders_count'],
        showName: getBool(json['show_name']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
        totalOrdersCount: json['total_orders_count'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['basic_verification'] = basicVerification;
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['buy_orders_count'] = buyOrdersCount;
    resultMap['cancel_time_avg'] = getSecondsSinceEpochDateTime(cancelTimeAvg);
    resultMap['chat_token'] = chatToken;
    resultMap['chat_user_id'] = chatUserId;
    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['daily_buy'] = dailyBuy;
    resultMap['daily_buy_limit'] = dailyBuyLimit;
    resultMap['daily_sell'] = dailySell;
    resultMap['daily_sell_limit'] = dailySellLimit;
    resultMap['default_advert_description'] = defaultAdvertDescription;
    resultMap['first_name'] = firstName;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['last_name'] = lastName;
    resultMap['name'] = name;
    resultMap['payment_info'] = paymentInfo;
    resultMap['release_time_avg'] =
        getSecondsSinceEpochDateTime(releaseTimeAvg);
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['show_name'] = showName;
    resultMap['total_completion_rate'] = totalCompletionRate;
    resultMap['total_orders_count'] = totalOrdersCount;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserInfo copyWith({
    bool basicVerification,
    double buyCompletionRate,
    int buyOrdersCount,
    DateTime cancelTimeAvg,
    String chatToken,
    String chatUserId,
    String contactInfo,
    DateTime createdTime,
    String dailyBuy,
    String dailyBuyLimit,
    String dailySell,
    String dailySellLimit,
    String defaultAdvertDescription,
    String firstName,
    bool fullVerification,
    String id,
    bool isApproved,
    bool isListed,
    String lastName,
    String name,
    String paymentInfo,
    DateTime releaseTimeAvg,
    double sellCompletionRate,
    int sellOrdersCount,
    bool showName,
    double totalCompletionRate,
    int totalOrdersCount,
  }) =>
      P2pAdvertiserInfo(
        basicVerification: basicVerification ?? this.basicVerification,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
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
        firstName: firstName ?? this.firstName,
        fullVerification: fullVerification ?? this.fullVerification,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isListed: isListed ?? this.isListed,
        lastName: lastName ?? this.lastName,
        name: name ?? this.name,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        showName: showName ?? this.showName,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
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
