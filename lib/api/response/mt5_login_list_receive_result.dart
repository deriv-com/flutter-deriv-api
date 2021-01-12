import 'package:meta/meta.dart';

import '../../basic_api/generated/mt5_login_list_receive.dart';
import '../../basic_api/generated/mt5_login_list_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Mt5 login list response model class
abstract class Mt5LoginListResponseModel {
  /// Initializes
  Mt5LoginListResponseModel({
    @required this.mt5LoginList,
  });

  /// Array containing MT5 account objects.
  final List<Mt5LoginListItem> mt5LoginList;
}

/// Mt5 login list response class
class Mt5LoginListResponse extends Mt5LoginListResponseModel {
  /// Initializes
  Mt5LoginListResponse({
    @required List<Mt5LoginListItem> mt5LoginList,
  }) : super(
          mt5LoginList: mt5LoginList,
        );

  /// Creates an instance from JSON
  factory Mt5LoginListResponse.fromJson(
    dynamic mt5LoginListJson,
  ) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginListJson == null
            ? null
            : List<Mt5LoginListItem>.from(mt5LoginListJson
                .map((dynamic item) => Mt5LoginListItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5LoginList != null) {
      resultMap['mt5_login_list'] = mt5LoginList
          .map<dynamic>((Mt5LoginListItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of MT5 accounts for client.
  ///
  /// For parameters information refer to [Mt5LoginListRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5LoginListResponse> fetchLoginList(
    Mt5LoginListSend request,
  ) async {
    final Mt5LoginListReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5LoginListResponse.fromJson(response.mt5LoginList);
  }

  /// Creates a copy of instance with given parameters
  Mt5LoginListResponse copyWith({
    List<Mt5LoginListItem> mt5LoginList,
  }) =>
      Mt5LoginListResponse(
        mt5LoginList: mt5LoginList ?? this.mt5LoginList,
      );
}
/// Mt5 login list item model class
abstract class Mt5LoginListItemModel {
  /// Initializes
  Mt5LoginListItemModel({
    @required this.balance,
    @required this.country,
    @required this.currency,
    @required this.displayBalance,
    @required this.email,
    @required this.group,
    @required this.leverage,
    @required this.login,
    @required this.name,
  });

  /// Balance of the MT5 account.
  final double balance;

  /// Residence of the MT5 account.
  final String country;

  /// Currency of the MT5 account.
  final String currency;

  /// Account balance, formatted to appropriate decimal places.
  final String displayBalance;

  /// Email address of the MT5 account.
  final String email;

  /// Group type of the MT5 account, e.g. `demo\svg_financial`
  final String group;

  /// Leverage of the MT5 account (1 to 1000).
  final double leverage;

  /// Login of MT5 account.
  final String login;

  /// Name of the owner of the MT5 account.
  final String name;
}

/// Mt5 login list item class
class Mt5LoginListItem extends Mt5LoginListItemModel {
  /// Initializes
  Mt5LoginListItem({
    @required double balance,
    @required String country,
    @required String currency,
    @required String displayBalance,
    @required String email,
    @required String group,
    @required double leverage,
    @required String login,
    @required String name,
  }) : super(
          balance: balance,
          country: country,
          currency: currency,
          displayBalance: displayBalance,
          email: email,
          group: group,
          leverage: leverage,
          login: login,
          name: name,
        );

  /// Creates an instance from JSON
  factory Mt5LoginListItem.fromJson(Map<String, dynamic> json) =>
      Mt5LoginListItem(
        balance: getDouble(json['balance']),
        country: json['country'],
        currency: json['currency'],
        displayBalance: json['display_balance'],
        email: json['email'],
        group: json['group'],
        leverage: getDouble(json['leverage']),
        login: json['login'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['balance'] = balance;
    resultMap['country'] = country;
    resultMap['currency'] = currency;
    resultMap['display_balance'] = displayBalance;
    resultMap['email'] = email;
    resultMap['group'] = group;
    resultMap['leverage'] = leverage;
    resultMap['login'] = login;
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Mt5LoginListItem copyWith({
    double balance,
    String country,
    String currency,
    String displayBalance,
    String email,
    String group,
    double leverage,
    String login,
    String name,
  }) =>
      Mt5LoginListItem(
        balance: balance ?? this.balance,
        country: country ?? this.country,
        currency: currency ?? this.currency,
        displayBalance: displayBalance ?? this.displayBalance,
        email: email ?? this.email,
        group: group ?? this.group,
        leverage: leverage ?? this.leverage,
        login: login ?? this.login,
        name: name ?? this.name,
      );
}
