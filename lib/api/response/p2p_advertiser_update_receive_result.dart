import 'package:meta/meta.dart';

import '../../basic_api/generated/p2p_advertiser_update_receive.dart';
import '../../basic_api/generated/p2p_advertiser_update_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// P2p advertiser update response model class
abstract class P2pAdvertiserUpdateResponseModel {
  /// Initializes
  P2pAdvertiserUpdateResponseModel({
    @required this.p2pAdvertiserUpdate,
  });

  /// P2P advertiser information.
  final P2pAdvertiserUpdate p2pAdvertiserUpdate;
}

/// P2p advertiser update response class
class P2pAdvertiserUpdateResponse extends P2pAdvertiserUpdateResponseModel {
  /// Initializes
  P2pAdvertiserUpdateResponse({
    @required P2pAdvertiserUpdate p2pAdvertiserUpdate,
  }) : super(
          p2pAdvertiserUpdate: p2pAdvertiserUpdate,
        );

  /// Creates an instance from JSON
  factory P2pAdvertiserUpdateResponse.fromJson(
    dynamic p2pAdvertiserUpdateJson,
  ) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdateJson == null
            ? null
            : P2pAdvertiserUpdate.fromJson(p2pAdvertiserUpdateJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserUpdate != null) {
      resultMap['p2p_advertiser_update'] = p2pAdvertiserUpdate.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Updates the information of the P2P (peer to peer) advertiser for the current account.
  /// Can only be used by an approved P2P advertiser.
  /// For parameters information refer to [P2pAdvertiserUpdateRequest].
  static Future<P2pAdvertiserUpdateResponse> updateAdvertiser(
    P2pAdvertiserUpdateSend request,
  ) async {
    final P2pAdvertiserUpdateReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertiserUpdateResponse.fromJson(response.p2pAdvertiserUpdate);
  }

  /// Creates a copy of instance with given parameters
  P2pAdvertiserUpdateResponse copyWith({
    P2pAdvertiserUpdate p2pAdvertiserUpdate,
  }) =>
      P2pAdvertiserUpdateResponse(
        p2pAdvertiserUpdate: p2pAdvertiserUpdate ?? this.p2pAdvertiserUpdate,
      );
}
/// P2p advertiser update model class
abstract class P2pAdvertiserUpdateModel {
  /// Initializes
  P2pAdvertiserUpdateModel({
    @required this.totalOrdersCount,
    @required this.showName,
    @required this.sellOrdersCount,
    @required this.paymentInfo,
    @required this.name,
    @required this.lastName,
    @required this.isListed,
    @required this.isApproved,
    @required this.id,
    @required this.fullVerification,
    @required this.firstName,
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

  /// When `true`, the advertiser's real name will be displayed on to other users on adverts and orders.
  final bool showName;

  /// The number of sell order orders completed within the past 30 days.
  final int sellOrdersCount;

  /// Advertiser's payment information.
  final String paymentInfo;

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's last name.
  final String lastName;

  /// Indicates if the advertiser's active adverts are listed. When `false`, adverts won't be listed regardless if they are active or not.
  final bool isListed;

  /// The approval status of the advertiser.
  final bool isApproved;

  /// The advertiser's identification number.
  final String id;

  /// Boolean value: 1 or 0, indicating whether the advertiser's address has been verified.
  final int fullVerification;

  /// The advertiser's first name.
  final String firstName;

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

/// P2p advertiser update class
class P2pAdvertiserUpdate extends P2pAdvertiserUpdateModel {
  /// Initializes
  P2pAdvertiserUpdate({
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
    @required String firstName,
    @required int fullVerification,
    @required String id,
    @required bool isApproved,
    @required bool isListed,
    @required String lastName,
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
          firstName: firstName,
          fullVerification: fullVerification,
          id: id,
          isApproved: isApproved,
          isListed: isListed,
          lastName: lastName,
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
  factory P2pAdvertiserUpdate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserUpdate(
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
        firstName: json['first_name'],
        fullVerification: json['full_verification'],
        id: json['id'],
        isApproved: getBool(json['is_approved']),
        isListed: getBool(json['is_listed']),
        lastName: json['last_name'],
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
    resultMap['first_name'] = firstName;
    resultMap['full_verification'] = fullVerification;
    resultMap['id'] = id;
    resultMap['is_approved'] = isApproved;
    resultMap['is_listed'] = isListed;
    resultMap['last_name'] = lastName;
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
  P2pAdvertiserUpdate copyWith({
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
    String firstName,
    int fullVerification,
    String id,
    bool isApproved,
    bool isListed,
    String lastName,
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
      P2pAdvertiserUpdate(
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
        firstName: firstName ?? this.firstName,
        fullVerification: fullVerification ?? this.fullVerification,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isListed: isListed ?? this.isListed,
        lastName: lastName ?? this.lastName,
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
