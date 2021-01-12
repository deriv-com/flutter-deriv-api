import 'package:meta/meta.dart';

import '../../basic_api/generated/copytrading_list_receive.dart';
import '../../basic_api/generated/copytrading_list_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Copytrading list response model class
abstract class CopytradingListResponseModel {
  /// Initializes
  CopytradingListResponseModel({
    @required this.copytradingList,
  });

  /// The trading information of copiers or traders.
  final CopytradingList copytradingList;
}

/// Copytrading list response class
class CopytradingListResponse extends CopytradingListResponseModel {
  /// Initializes
  CopytradingListResponse({
    @required CopytradingList copytradingList,
  }) : super(
          copytradingList: copytradingList,
        );

  /// Creates an instance from JSON
  factory CopytradingListResponse.fromJson(
    dynamic copytradingListJson,
  ) =>
      CopytradingListResponse(
        copytradingList: copytradingListJson == null
            ? null
            : CopytradingList.fromJson(copytradingListJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (copytradingList != null) {
      resultMap['copytrading_list'] = copytradingList.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of active copiers and/or traders for Copy Trading
  ///
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopytradingListResponse> fetchList([
    CopytradingListSend request,
  ]) async {
    final CopytradingListReceive response = await _api.call(
      request: request ?? const CopytradingListSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          CopyTradingException(baseExceptionModel: baseExceptionModel),
    );

    return CopytradingListResponse.fromJson(response.copytradingList);
  }

  /// Creates a copy of instance with given parameters
  CopytradingListResponse copyWith({
    CopytradingList copytradingList,
  }) =>
      CopytradingListResponse(
        copytradingList: copytradingList ?? this.copytradingList,
      );
}
/// Copytrading list model class
abstract class CopytradingListModel {
  /// Initializes
  CopytradingListModel({
    @required this.copiers,
    @required this.traders,
  });

  /// List of users who are currently copy trading the authenticated user
  final List<CopiersItem> copiers;

  /// List of traders being followed by the authenticated user
  final List<TradersItem> traders;
}

/// Copytrading list class
class CopytradingList extends CopytradingListModel {
  /// Initializes
  CopytradingList({
    @required List<CopiersItem> copiers,
    @required List<TradersItem> traders,
  }) : super(
          copiers: copiers,
          traders: traders,
        );

  /// Creates an instance from JSON
  factory CopytradingList.fromJson(Map<String, dynamic> json) =>
      CopytradingList(
        copiers: json['copiers'] == null
            ? null
            : List<CopiersItem>.from(json['copiers']
                .map((dynamic item) => CopiersItem.fromJson(item))),
        traders: json['traders'] == null
            ? null
            : List<TradersItem>.from(json['traders']
                .map((dynamic item) => TradersItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (copiers != null) {
      resultMap['copiers'] =
          copiers.map<dynamic>((CopiersItem item) => item.toJson()).toList();
    }
    if (traders != null) {
      resultMap['traders'] =
          traders.map<dynamic>((TradersItem item) => item.toJson()).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  CopytradingList copyWith({
    List<CopiersItem> copiers,
    List<TradersItem> traders,
  }) =>
      CopytradingList(
        copiers: copiers ?? this.copiers,
        traders: traders ?? this.traders,
      );
}
/// Copiers item model class
abstract class CopiersItemModel {
  /// Initializes
  CopiersItemModel({
    @required this.loginid,
  });

  /// The loginid of the copier's account.
  final String loginid;
}

/// Copiers item class
class CopiersItem extends CopiersItemModel {
  /// Initializes
  CopiersItem({
    @required String loginid,
  }) : super(
          loginid: loginid,
        );

  /// Creates an instance from JSON
  factory CopiersItem.fromJson(Map<String, dynamic> json) => CopiersItem(
        loginid: json['loginid'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['loginid'] = loginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  CopiersItem copyWith({
    String loginid,
  }) =>
      CopiersItem(
        loginid: loginid ?? this.loginid,
      );
}
/// Traders item model class
abstract class TradersItemModel {
  /// Initializes
  TradersItemModel({
    @required this.assets,
    @required this.loginid,
    this.maxTradeStake,
    this.minTradeStake,
    @required this.token,
    @required this.tradeTypes,
  });

  /// The list of assets to copy the trades of.
  final List<String> assets;

  /// The loginid of the trader's account.
  final String loginid;

  /// Maximum trading stake set for the trader.
  final double maxTradeStake;

  /// Minimum trading stake set for the trader.
  final double minTradeStake;

  /// The token provided for the trader.
  final String token;

  /// The type of trades set.
  final List<String> tradeTypes;
}

/// Traders item class
class TradersItem extends TradersItemModel {
  /// Initializes
  TradersItem({
    @required List<String> assets,
    @required String loginid,
    double maxTradeStake,
    double minTradeStake,
    @required String token,
    @required List<String> tradeTypes,
  }) : super(
          assets: assets,
          loginid: loginid,
          maxTradeStake: maxTradeStake,
          minTradeStake: minTradeStake,
          token: token,
          tradeTypes: tradeTypes,
        );

  /// Creates an instance from JSON
  factory TradersItem.fromJson(Map<String, dynamic> json) => TradersItem(
        assets: json['assets'] == null
            ? null
            : List<String>.from(json['assets'].map((dynamic item) => item)),
        loginid: json['loginid'],
        maxTradeStake: getDouble(json['max_trade_stake']),
        minTradeStake: getDouble(json['min_trade_stake']),
        token: json['token'],
        tradeTypes: json['trade_types'] == null
            ? null
            : List<String>.from(
                json['trade_types'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (assets != null) {
      resultMap['assets'] = assets.map<dynamic>((String item) => item).toList();
    }
    resultMap['loginid'] = loginid;
    resultMap['max_trade_stake'] = maxTradeStake;
    resultMap['min_trade_stake'] = minTradeStake;
    resultMap['token'] = token;
    if (tradeTypes != null) {
      resultMap['trade_types'] =
          tradeTypes.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TradersItem copyWith({
    List<String> assets,
    String loginid,
    double maxTradeStake,
    double minTradeStake,
    String token,
    List<String> tradeTypes,
  }) =>
      TradersItem(
        assets: assets ?? this.assets,
        loginid: loginid ?? this.loginid,
        maxTradeStake: maxTradeStake ?? this.maxTradeStake,
        minTradeStake: minTradeStake ?? this.minTradeStake,
        token: token ?? this.token,
        tradeTypes: tradeTypes ?? this.tradeTypes,
      );
}
