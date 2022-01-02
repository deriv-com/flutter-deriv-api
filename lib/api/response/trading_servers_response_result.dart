// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_servers_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_servers_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Trading servers response model class.
abstract class TradingServersResponseModel extends Equatable {
  /// Initializes Trading servers response model class .
  const TradingServersResponseModel({
    this.tradingServers,
  });

  /// Array containing platform server objects.
  final List<TradingServersItem>? tradingServers;
}

/// Trading servers response class.
class TradingServersResponse extends TradingServersResponseModel {
  /// Initializes Trading servers response class.
  const TradingServersResponse({
    List<TradingServersItem>? tradingServers,
  }) : super(
          tradingServers: tradingServers,
        );

  /// Creates an instance from JSON.
  factory TradingServersResponse.fromJson(
    dynamic tradingServersJson,
  ) =>
      TradingServersResponse(
        tradingServers: tradingServersJson == null
            ? null
            : List<TradingServersItem>.from(
                tradingServersJson?.map(
                  (dynamic item) => TradingServersItem.fromJson(item),
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingServers != null) {
      resultMap['trading_servers'] = tradingServers!
          .map<dynamic>(
            (TradingServersItem item) => item.toJson(),
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Get the list of servers for platform. Currently, only mt5 is supported
  ///
  /// For parameters information refer to [TradingServersRequest].
  /// Throws a [TradingException] if API response contains an error
  static Future<TradingServersResponse> fetchTradingServers(
    TradingServersRequest request,
  ) async {
    final TradingServersReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          TradingException(baseExceptionModel: baseExceptionModel),
    );

    return TradingServersResponse.fromJson(response.tradingServers);
  }

  /// Creates a copy of instance with given parameters.
  TradingServersResponse copyWith({
    List<TradingServersItem>? tradingServers,
  }) =>
      TradingServersResponse(
        tradingServers: tradingServers ?? this.tradingServers,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// AccountTypeEnum mapper.
final Map<String, AccountTypeEnum> accountTypeEnumMapper =
    <String, AccountTypeEnum>{
  "demo": AccountTypeEnum.demo,
  "real": AccountTypeEnum.real,
};

/// AccountType Enum.
enum AccountTypeEnum {
  /// demo.
  demo,

  /// real.
  real,
}

/// EnvironmentEnum mapper.
final Map<String, EnvironmentEnum> environmentEnumMapper =
    <String, EnvironmentEnum>{
  "Deriv-Demo": EnvironmentEnum.derivDemo,
  "Deriv-Server": EnvironmentEnum.derivServer,
  "Deriv-Server-02": EnvironmentEnum.derivServer02,
};

/// Environment Enum.
enum EnvironmentEnum {
  /// Deriv-Demo.
  derivDemo,

  /// Deriv-Server.
  derivServer,

  /// Deriv-Server-02.
  derivServer02,
}

/// IdEnum mapper.
final Map<String, IdEnum> idEnumMapper = <String, IdEnum>{
  "p01_ts01": IdEnum.p01Ts01,
  "p01_ts02": IdEnum.p01Ts02,
  "p01_ts03": IdEnum.p01Ts03,
  "p01_ts04": IdEnum.p01Ts04,
  "p02_ts02": IdEnum.p02Ts02,
};

/// Id Enum.
enum IdEnum {
  /// p01_ts01.
  p01Ts01,

  /// p01_ts02.
  p01Ts02,

  /// p01_ts03.
  p01Ts03,

  /// p01_ts04.
  p01Ts04,

  /// p02_ts02.
  p02Ts02,
}
/// Trading servers item model class.
abstract class TradingServersItemModel extends Equatable {
  /// Initializes Trading servers item model class .
  const TradingServersItemModel({
    this.accountType,
    this.disabled,
    this.environment,
    this.geolocation,
    this.id,
    this.marketType,
    this.messageToClient,
    this.recommended,
    this.supportedAccounts,
  });

  /// Supported trading account type.
  final AccountTypeEnum? accountType;

  /// Flag to represent if this server is currently disabled or not
  final bool? disabled;

  /// Current environment (installation instance) where servers are deployed. Currently, there are one demo and two real environments.
  final EnvironmentEnum? environment;

  /// Object containing geolocation information of the server.
  final Geolocation? geolocation;

  /// Server unique id.
  final IdEnum? id;

  /// Market type
  final String? marketType;

  /// Error message to client when server is disabled
  final String? messageToClient;

  /// Flag to represent if this is server is recommended based on client's country of residence.
  final bool? recommended;

  /// Account type supported by the server.
  final List<String>? supportedAccounts;
}

/// Trading servers item class.
class TradingServersItem extends TradingServersItemModel {
  /// Initializes Trading servers item class.
  const TradingServersItem({
    AccountTypeEnum? accountType,
    bool? disabled,
    EnvironmentEnum? environment,
    Geolocation? geolocation,
    IdEnum? id,
    String? marketType,
    String? messageToClient,
    bool? recommended,
    List<String>? supportedAccounts,
  }) : super(
          accountType: accountType,
          disabled: disabled,
          environment: environment,
          geolocation: geolocation,
          id: id,
          marketType: marketType,
          messageToClient: messageToClient,
          recommended: recommended,
          supportedAccounts: supportedAccounts,
        );

  /// Creates an instance from JSON.
  factory TradingServersItem.fromJson(Map<String, dynamic> json) =>
      TradingServersItem(
        accountType: json['account_type'] == null
            ? null
            : accountTypeEnumMapper[json['account_type']],
        disabled: getBool(json['disabled']),
        environment: json['environment'] == null
            ? null
            : environmentEnumMapper[json['environment']],
        geolocation: json['geolocation'] == null
            ? null
            : Geolocation.fromJson(json['geolocation']),
        id: json['id'] == null ? null : idEnumMapper[json['id']],
        marketType: json['market_type'],
        messageToClient: json['message_to_client'],
        recommended: getBool(json['recommended']),
        supportedAccounts: json['supported_accounts'] == null
            ? null
            : List<String>.from(
                json['supported_accounts']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_type'] = accountTypeEnumMapper.entries
        .firstWhere((MapEntry<String, AccountTypeEnum> entry) =>
            entry.value == accountType)
        .key;
    resultMap['disabled'] = disabled;
    resultMap['environment'] = environmentEnumMapper.entries
        .firstWhere((MapEntry<String, EnvironmentEnum> entry) =>
            entry.value == environment)
        .key;
    if (geolocation != null) {
      resultMap['geolocation'] = geolocation!.toJson();
    }
    resultMap['id'] = idEnumMapper.entries
        .firstWhere((MapEntry<String, IdEnum> entry) => entry.value == id)
        .key;
    resultMap['market_type'] = marketType;
    resultMap['message_to_client'] = messageToClient;
    resultMap['recommended'] = recommended;
    if (supportedAccounts != null) {
      resultMap['supported_accounts'] = supportedAccounts!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  TradingServersItem copyWith({
    AccountTypeEnum? accountType,
    bool? disabled,
    EnvironmentEnum? environment,
    Geolocation? geolocation,
    IdEnum? id,
    String? marketType,
    String? messageToClient,
    bool? recommended,
    List<String>? supportedAccounts,
  }) =>
      TradingServersItem(
        accountType: accountType ?? this.accountType,
        disabled: disabled ?? this.disabled,
        environment: environment ?? this.environment,
        geolocation: geolocation ?? this.geolocation,
        id: id ?? this.id,
        marketType: marketType ?? this.marketType,
        messageToClient: messageToClient ?? this.messageToClient,
        recommended: recommended ?? this.recommended,
        supportedAccounts: supportedAccounts ?? this.supportedAccounts,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Geolocation model class.
abstract class GeolocationModel extends Equatable {
  /// Initializes Geolocation model class .
  const GeolocationModel({
    this.group,
    this.location,
    this.region,
    this.sequence,
  });

  /// Internal server grouping.
  final String? group;

  /// Geolocation country or place where server is located.
  final String? location;

  /// Geolocation region where server is located.
  final String? region;

  /// Sequence number of the server in that region.
  final int? sequence;
}

/// Geolocation class.
class Geolocation extends GeolocationModel {
  /// Initializes Geolocation class.
  const Geolocation({
    String? group,
    String? location,
    String? region,
    int? sequence,
  }) : super(
          group: group,
          location: location,
          region: region,
          sequence: sequence,
        );

  /// Creates an instance from JSON.
  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        group: json['group'],
        location: json['location'],
        region: json['region'],
        sequence: json['sequence'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['group'] = group;
    resultMap['location'] = location;
    resultMap['region'] = region;
    resultMap['sequence'] = sequence;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Geolocation copyWith({
    String? group,
    String? location,
    String? region,
    int? sequence,
  }) =>
      Geolocation(
        group: group ?? this.group,
        location: location ?? this.location,
        region: region ?? this.region,
        sequence: sequence ?? this.sequence,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
