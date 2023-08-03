// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p advertiser list response model class.
abstract class P2pAdvertiserListResponseModel {
  /// Initializes P2p advertiser list response model class .
  const P2pAdvertiserListResponseModel({
    this.p2pAdvertiserList,
  });

  /// P2P advertiser list.
  final P2pAdvertiserList? p2pAdvertiserList;
}

/// P2p advertiser list response class.
class P2pAdvertiserListResponse extends P2pAdvertiserListResponseModel {
  /// Initializes P2p advertiser list response class.
  const P2pAdvertiserListResponse({
    P2pAdvertiserList? p2pAdvertiserList,
  }) : super(
          p2pAdvertiserList: p2pAdvertiserList,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserListResponse.fromJson(
    dynamic p2pAdvertiserListJson,
  ) =>
      P2pAdvertiserListResponse(
        p2pAdvertiserList: p2pAdvertiserListJson == null
            ? null
            : P2pAdvertiserList.fromJson(p2pAdvertiserListJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertiserList != null) {
      resultMap['p2p_advertiser_list'] = p2pAdvertiserList!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Returns P2P advertiser list.
  ///
  /// For parameters information refer to [P2pAdvertiserListRequest].
  static Future<P2pAdvertiserListReceive> fetchAdvertiserListRaw(
    P2pAdvertiserListRequest request,
  ) async {
    final P2pAdvertiserListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Returns P2P advertiser list.
  ///
  /// For parameters information refer to [P2pAdvertiserListRequest].
  static Future<P2pAdvertiserListResponse> fetchAdvertiserList(
    P2pAdvertiserListRequest request,
  ) async {
    final P2pAdvertiserListReceive response =
        await fetchAdvertiserListRaw(request);

    return P2pAdvertiserListResponse.fromJson(response.p2pAdvertiserList);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserListResponse copyWith({
    P2pAdvertiserList? p2pAdvertiserList,
  }) =>
      P2pAdvertiserListResponse(
        p2pAdvertiserList: p2pAdvertiserList ?? this.p2pAdvertiserList,
      );
}

/// P2p advertiser list model class.
abstract class P2pAdvertiserListModel {
  /// Initializes P2p advertiser list model class .
  const P2pAdvertiserListModel({
    required this.list,
  });

  /// List of advertisers.
  final List<ListItem> list;
}

/// P2p advertiser list class.
class P2pAdvertiserList extends P2pAdvertiserListModel {
  /// Initializes P2p advertiser list class.
  const P2pAdvertiserList({
    required List<ListItem> list,
  }) : super(
          list: list,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserList.fromJson(Map<String, dynamic> json) =>
      P2pAdvertiserList(
        list: List<ListItem>.from(
          json['list'].map(
            (dynamic item) => ListItem.fromJson(item),
          ),
        ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['list'] = list
        .map<dynamic>(
          (ListItem item) => item.toJson(),
        )
        .toList();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserList copyWith({
    List<ListItem>? list,
  }) =>
      P2pAdvertiserList(
        list: list ?? this.list,
      );
}

/// List item model class.
abstract class ListItemModel {
  /// Initializes List item model class .
  const ListItemModel({
    required this.totalTurnover,
    required this.totalOrdersCount,
    required this.sellOrdersCount,
    required this.sellOrdersAmount,
    required this.ratingCount,
    required this.partnerCount,
    required this.name,
    required this.isOnline,
    required this.isListed,
    required this.isBlocked,
    required this.isApproved,
    required this.id,
    required this.fullVerification,
    required this.defaultAdvertDescription,
    required this.createdTime,
    required this.buyOrdersCount,
    required this.buyOrdersAmount,
    required this.basicVerification,
    this.advertRates,
    this.buyCompletionRate,
    this.buyTimeAvg,
    this.cancelTimeAvg,
    this.firstName,
    this.isFavourite,
    this.isRecommended,
    this.lastName,
    this.lastOnlineTime,
    this.ratingAverage,
    this.recommendedAverage,
    this.recommendedCount,
    this.releaseTimeAvg,
    this.sellCompletionRate,
    this.totalCompletionRate,
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

  /// Indicates that the advertiser is blocked by the current user.
  final bool isBlocked;

  /// The approval status of the advertiser.
  final bool isApproved;

  /// The advertiser's identification number.
  final String id;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's address has been verified.
  final bool fullVerification;

  /// Default description that can be used every time an advert is created.
  final String defaultAdvertDescription;

  /// The epoch time that the trade partner became an advertiser.
  final DateTime createdTime;

  /// The number of buy order completed within the past 30 days.
  final int buyOrdersCount;

  /// Buy order volume in the past 30 days.
  final String buyOrdersAmount;

  /// Boolean value: `true` or `false`, indicating whether the advertiser's identify has been verified.
  final bool basicVerification;

  /// Average difference of advert rate compared to the market rate over the past 30 days.
  final double? advertRates;

  /// The percentage of completed orders out of total orders as a buyer within the past 30 days.
  final double? buyCompletionRate;

  /// The average time in seconds taken to make payment as a buyer within the past 30 days.
  final int? buyTimeAvg;

  /// The average time in seconds taken to cancel orders as a buyer within the past 30 days.
  final int? cancelTimeAvg;

  /// The advertiser's first name.
  final String? firstName;

  /// Indicates if the trade partner is favourited by requester.
  final bool? isFavourite;

  /// Indicates if the trade partner is recommended by requester.
  final bool? isRecommended;

  /// The advertiser's last name.
  final String? lastName;

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
}

/// List item class.
class ListItem extends ListItemModel {
  /// Initializes List item class.
  const ListItem({
    required bool basicVerification,
    required String buyOrdersAmount,
    required int buyOrdersCount,
    required DateTime createdTime,
    required String defaultAdvertDescription,
    required bool fullVerification,
    required String id,
    required bool isApproved,
    required bool isBlocked,
    required bool isListed,
    required bool isOnline,
    required String name,
    required int partnerCount,
    required int ratingCount,
    required String sellOrdersAmount,
    required int sellOrdersCount,
    required int totalOrdersCount,
    required String totalTurnover,
    double? advertRates,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    String? firstName,
    bool? isFavourite,
    bool? isRecommended,
    String? lastName,
    DateTime? lastOnlineTime,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    double? totalCompletionRate,
  }) : super(
          basicVerification: basicVerification,
          buyOrdersAmount: buyOrdersAmount,
          buyOrdersCount: buyOrdersCount,
          createdTime: createdTime,
          defaultAdvertDescription: defaultAdvertDescription,
          fullVerification: fullVerification,
          id: id,
          isApproved: isApproved,
          isBlocked: isBlocked,
          isListed: isListed,
          isOnline: isOnline,
          name: name,
          partnerCount: partnerCount,
          ratingCount: ratingCount,
          sellOrdersAmount: sellOrdersAmount,
          sellOrdersCount: sellOrdersCount,
          totalOrdersCount: totalOrdersCount,
          totalTurnover: totalTurnover,
          advertRates: advertRates,
          buyCompletionRate: buyCompletionRate,
          buyTimeAvg: buyTimeAvg,
          cancelTimeAvg: cancelTimeAvg,
          firstName: firstName,
          isFavourite: isFavourite,
          isRecommended: isRecommended,
          lastName: lastName,
          lastOnlineTime: lastOnlineTime,
          ratingAverage: ratingAverage,
          recommendedAverage: recommendedAverage,
          recommendedCount: recommendedCount,
          releaseTimeAvg: releaseTimeAvg,
          sellCompletionRate: sellCompletionRate,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON.
  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        basicVerification: getBool(json['basic_verification'])!,
        buyOrdersAmount: json['buy_orders_amount'],
        buyOrdersCount: json['buy_orders_count'],
        createdTime: getDateTime(json['created_time'])!,
        defaultAdvertDescription: json['default_advert_description'],
        fullVerification: getBool(json['full_verification'])!,
        id: json['id'],
        isApproved: getBool(json['is_approved'])!,
        isBlocked: getBool(json['is_blocked'])!,
        isListed: getBool(json['is_listed'])!,
        isOnline: getBool(json['is_online'])!,
        name: json['name'],
        partnerCount: json['partner_count'],
        ratingCount: json['rating_count'],
        sellOrdersAmount: json['sell_orders_amount'],
        sellOrdersCount: json['sell_orders_count'],
        totalOrdersCount: json['total_orders_count'],
        totalTurnover: json['total_turnover'],
        advertRates: getDouble(json['advert_rates']),
        buyCompletionRate: getDouble(json['buy_completion_rate']),
        buyTimeAvg: json['buy_time_avg'],
        cancelTimeAvg: json['cancel_time_avg'],
        firstName: json['first_name'],
        isFavourite: getBool(json['is_favourite']),
        isRecommended: getBool(json['is_recommended']),
        lastName: json['last_name'],
        lastOnlineTime: getDateTime(json['last_online_time']),
        ratingAverage: getDouble(json['rating_average']),
        recommendedAverage: getDouble(json['recommended_average']),
        recommendedCount: json['recommended_count'],
        releaseTimeAvg: json['release_time_avg'],
        sellCompletionRate: getDouble(json['sell_completion_rate']),
        totalCompletionRate: getDouble(json['total_completion_rate']),
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
    resultMap['is_blocked'] = isBlocked;
    resultMap['is_listed'] = isListed;
    resultMap['is_online'] = isOnline;
    resultMap['name'] = name;
    resultMap['partner_count'] = partnerCount;
    resultMap['rating_count'] = ratingCount;
    resultMap['sell_orders_amount'] = sellOrdersAmount;
    resultMap['sell_orders_count'] = sellOrdersCount;
    resultMap['total_orders_count'] = totalOrdersCount;
    resultMap['total_turnover'] = totalTurnover;
    resultMap['advert_rates'] = advertRates;
    resultMap['buy_completion_rate'] = buyCompletionRate;
    resultMap['buy_time_avg'] = buyTimeAvg;
    resultMap['cancel_time_avg'] = cancelTimeAvg;
    resultMap['first_name'] = firstName;
    resultMap['is_favourite'] = isFavourite;
    resultMap['is_recommended'] = isRecommended;
    resultMap['last_name'] = lastName;
    resultMap['last_online_time'] =
        getSecondsSinceEpochDateTime(lastOnlineTime);
    resultMap['rating_average'] = ratingAverage;
    resultMap['recommended_average'] = recommendedAverage;
    resultMap['recommended_count'] = recommendedCount;
    resultMap['release_time_avg'] = releaseTimeAvg;
    resultMap['sell_completion_rate'] = sellCompletionRate;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ListItem copyWith({
    bool? basicVerification,
    String? buyOrdersAmount,
    int? buyOrdersCount,
    DateTime? createdTime,
    String? defaultAdvertDescription,
    bool? fullVerification,
    String? id,
    bool? isApproved,
    bool? isBlocked,
    bool? isListed,
    bool? isOnline,
    String? name,
    int? partnerCount,
    int? ratingCount,
    String? sellOrdersAmount,
    int? sellOrdersCount,
    int? totalOrdersCount,
    String? totalTurnover,
    double? advertRates,
    double? buyCompletionRate,
    int? buyTimeAvg,
    int? cancelTimeAvg,
    String? firstName,
    bool? isFavourite,
    bool? isRecommended,
    String? lastName,
    DateTime? lastOnlineTime,
    double? ratingAverage,
    double? recommendedAverage,
    int? recommendedCount,
    int? releaseTimeAvg,
    double? sellCompletionRate,
    double? totalCompletionRate,
  }) =>
      ListItem(
        basicVerification: basicVerification ?? this.basicVerification,
        buyOrdersAmount: buyOrdersAmount ?? this.buyOrdersAmount,
        buyOrdersCount: buyOrdersCount ?? this.buyOrdersCount,
        createdTime: createdTime ?? this.createdTime,
        defaultAdvertDescription:
            defaultAdvertDescription ?? this.defaultAdvertDescription,
        fullVerification: fullVerification ?? this.fullVerification,
        id: id ?? this.id,
        isApproved: isApproved ?? this.isApproved,
        isBlocked: isBlocked ?? this.isBlocked,
        isListed: isListed ?? this.isListed,
        isOnline: isOnline ?? this.isOnline,
        name: name ?? this.name,
        partnerCount: partnerCount ?? this.partnerCount,
        ratingCount: ratingCount ?? this.ratingCount,
        sellOrdersAmount: sellOrdersAmount ?? this.sellOrdersAmount,
        sellOrdersCount: sellOrdersCount ?? this.sellOrdersCount,
        totalOrdersCount: totalOrdersCount ?? this.totalOrdersCount,
        totalTurnover: totalTurnover ?? this.totalTurnover,
        advertRates: advertRates ?? this.advertRates,
        buyCompletionRate: buyCompletionRate ?? this.buyCompletionRate,
        buyTimeAvg: buyTimeAvg ?? this.buyTimeAvg,
        cancelTimeAvg: cancelTimeAvg ?? this.cancelTimeAvg,
        firstName: firstName ?? this.firstName,
        isFavourite: isFavourite ?? this.isFavourite,
        isRecommended: isRecommended ?? this.isRecommended,
        lastName: lastName ?? this.lastName,
        lastOnlineTime: lastOnlineTime ?? this.lastOnlineTime,
        ratingAverage: ratingAverage ?? this.ratingAverage,
        recommendedAverage: recommendedAverage ?? this.recommendedAverage,
        recommendedCount: recommendedCount ?? this.recommendedCount,
        releaseTimeAvg: releaseTimeAvg ?? this.releaseTimeAvg,
        sellCompletionRate: sellCompletionRate ?? this.sellCompletionRate,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );
}
