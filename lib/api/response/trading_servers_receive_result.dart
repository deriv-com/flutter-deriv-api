import 'package:meta/meta.dart';

import '../../basic_api/generated/trading_servers_receive.dart';
import '../../basic_api/generated/trading_servers_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Trading servers response model class
abstract class TradingServersResponseModel {
  /// Initializes
  TradingServersResponseModel({
    @required this.tradingServers,
  });

  /// Array containing platform server objects.
  final List<TradingServersItem> tradingServers;
}

/// Trading servers response class
class TradingServersResponse extends TradingServersResponseModel {
  /// Initializes
  TradingServersResponse({
    @required List<TradingServersItem> tradingServers,
  }) : super(
          tradingServers: tradingServers,
        );

  /// Creates an instance from JSON
  factory TradingServersResponse.fromJson(
    dynamic tradingServersJson,
  ) =>
      TradingServersResponse(
        tradingServers: tradingServersJson == null
            ? null
            : List<TradingServersItem>.from(tradingServersJson
                .map((dynamic item) => TradingServersItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (tradingServers != null) {
      resultMap['trading_servers'] = tradingServers
          .map<dynamic>((TradingServersItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Get the list of servers for platform. Currently, only mt5 is supported
  ///
  /// For parameters information refer to [TradingServersSend].
  /// Throws a [TradingException] if API response contains an error
  static Future<TradingServersResponse> fetchTradingServers(
    TradingServersSend request,
  ) async {
    final TradingServersReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          TradingException(baseExceptionModel: baseExceptionModel),
    );

    return TradingServersResponse.fromJson(response.tradingServers);
  }

  /// Creates a copy of instance with given parameters
  TradingServersResponse copyWith({
    List<TradingServersItem> tradingServers,
  }) =>
      TradingServersResponse(
        tradingServers: tradingServers ?? this.tradingServers,
      );
}

final Map<String, EnvironmentEnum> environmentEnumMapper =
    <String, EnvironmentEnum>{
  "env_01": EnvironmentEnum.env01,
};

/// environment Enum
enum EnvironmentEnum {
  env01,
}

final Map<String, IdEnum> idEnumMapper = <String, IdEnum>{
  "real01": IdEnum.real01,
  "real02": IdEnum.real02,
  "real03": IdEnum.real03,
  "real04": IdEnum.real04,
};

/// id Enum
enum IdEnum {
  real01,
  real02,
  real03,
  real04,
}
/// Trading servers item model class
abstract class TradingServersItemModel {
  /// Initializes
  TradingServersItemModel({
    @required this.supportedAccounts,
    @required this.recommended,
    @required this.id,
    @required this.geolocation,
    @required this.environment,
    @required this.disabled,
  });

  /// Account type supported by the server.
  final List<String> supportedAccounts;

  /// Flag to represent if this is server is recommended based on client's country of residence.
  final bool recommended;

  /// Server unique id.
  final IdEnum id;

  /// Object containing geolocation information of the server.
  final Geolocation geolocation;

  /// Current environment (installation instance) where servers are deployed. Currently, there is only one environment instance.
  final EnvironmentEnum environment;

  /// Flag to represent if this server is currently disabled or not
  final bool disabled;
}

/// Trading servers item class
class TradingServersItem extends TradingServersItemModel {
  /// Initializes
  TradingServersItem({
    @required bool disabled,
    @required EnvironmentEnum environment,
    @required Geolocation geolocation,
    @required IdEnum id,
    @required bool recommended,
    @required List<String> supportedAccounts,
  }) : super(
          disabled: disabled,
          environment: environment,
          geolocation: geolocation,
          id: id,
          recommended: recommended,
          supportedAccounts: supportedAccounts,
        );

  /// Creates an instance from JSON
  factory TradingServersItem.fromJson(Map<String, dynamic> json) =>
      TradingServersItem(
        disabled: getBool(json['disabled']),
        environment: environmentEnumMapper[json['environment']],
        geolocation: json['geolocation'] == null
            ? null
            : Geolocation.fromJson(json['geolocation']),
        id: idEnumMapper[json['id']],
        recommended: getBool(json['recommended']),
        supportedAccounts: json['supported_accounts'] == null
            ? null
            : List<String>.from(
                json['supported_accounts'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['disabled'] = disabled;
    resultMap['environment'] = environmentEnumMapper.entries
        .firstWhere((entry) => entry.value == environment, orElse: () => null)
        ?.key;
    if (geolocation != null) {
      resultMap['geolocation'] = geolocation.toJson();
    }
    resultMap['id'] = idEnumMapper.entries
        .firstWhere((entry) => entry.value == id, orElse: () => null)
        ?.key;
    resultMap['recommended'] = recommended;
    if (supportedAccounts != null) {
      resultMap['supported_accounts'] =
          supportedAccounts.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TradingServersItem copyWith({
    bool disabled,
    EnvironmentEnum environment,
    Geolocation geolocation,
    IdEnum id,
    bool recommended,
    List<String> supportedAccounts,
  }) =>
      TradingServersItem(
        disabled: disabled ?? this.disabled,
        environment: environment ?? this.environment,
        geolocation: geolocation ?? this.geolocation,
        id: id ?? this.id,
        recommended: recommended ?? this.recommended,
        supportedAccounts: supportedAccounts ?? this.supportedAccounts,
      );
}
/// Geolocation model class
abstract class GeolocationModel {
  /// Initializes
  GeolocationModel({
    @required this.sequence,
    @required this.region,
    @required this.location,
  });

  /// Sequence number of the server in that region.
  final int sequence;

  /// Geolocation region where server is located.
  final String region;

  /// Geolocation country or place where server is located.
  final String location;
}

/// Geolocation class
class Geolocation extends GeolocationModel {
  /// Initializes
  Geolocation({
    @required String location,
    @required String region,
    @required int sequence,
  }) : super(
          location: location,
          region: region,
          sequence: sequence,
        );

  /// Creates an instance from JSON
  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        location: json['location'],
        region: json['region'],
        sequence: json['sequence'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['location'] = location;
    resultMap['region'] = region;
    resultMap['sequence'] = sequence;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Geolocation copyWith({
    String location,
    String region,
    int sequence,
  }) =>
      Geolocation(
        location: location ?? this.location,
        region: region ?? this.region,
        sequence: sequence ?? this.sequence,
      );
}
