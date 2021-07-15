import '../../basic_api/generated/trading_servers_receive.dart';
import '../../basic_api/generated/trading_servers_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Trading servers response model class.
abstract class TradingServersResponseModel {
  /// Initializes Trading servers response model class .
  TradingServersResponseModel({
    this.tradingServers,
  });

  /// Array containing platform server objects.
  final List<TradingServersItem>? tradingServers;
}

/// Trading servers response class.
class TradingServersResponse extends TradingServersResponseModel {
  /// Initializes Trading servers response class.
  TradingServersResponse({
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
abstract class TradingServersItemModel {
  /// Initializes Trading servers item model class .
  TradingServersItemModel({
    this.disabled,
    this.environment,
    this.geolocation,
    this.id,
    this.messageToClient,
    this.recommended,
    this.supportedAccounts,
  });

  /// Flag to represent if this server is currently disabled or not
  final bool? disabled;

  /// Current environment (installation instance) where servers are deployed. Currently, there are one demo and two real environments.
  final EnvironmentEnum? environment;

  /// Object containing geolocation information of the server.
  final Geolocation? geolocation;

  /// Server unique id.
  final IdEnum? id;

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
  TradingServersItem({
    bool? disabled,
    EnvironmentEnum? environment,
    Geolocation? geolocation,
    IdEnum? id,
    String? messageToClient,
    bool? recommended,
    List<String>? supportedAccounts,
  }) : super(
          disabled: disabled,
          environment: environment,
          geolocation: geolocation,
          id: id,
          messageToClient: messageToClient,
          recommended: recommended,
          supportedAccounts: supportedAccounts,
        );

  /// Creates an instance from JSON.
  factory TradingServersItem.fromJson(Map<String, dynamic> json) =>
      TradingServersItem(
        disabled: getBool(json['disabled']),
        environment: json['environment'] == null
            ? null
            : environmentEnumMapper[json['environment']]!,
        geolocation: json['geolocation'] == null
            ? null
            : Geolocation.fromJson(json['geolocation']),
        id: json['id'] == null ? null : idEnumMapper[json['id']]!,
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
    bool? disabled,
    EnvironmentEnum? environment,
    Geolocation? geolocation,
    IdEnum? id,
    String? messageToClient,
    bool? recommended,
    List<String>? supportedAccounts,
  }) =>
      TradingServersItem(
        disabled: disabled ?? this.disabled,
        environment: environment ?? this.environment,
        geolocation: geolocation ?? this.geolocation,
        id: id ?? this.id,
        messageToClient: messageToClient ?? this.messageToClient,
        recommended: recommended ?? this.recommended,
        supportedAccounts: supportedAccounts ?? this.supportedAccounts,
      );
}
/// Geolocation model class.
abstract class GeolocationModel {
  /// Initializes Geolocation model class .
  GeolocationModel({
    this.location,
    this.region,
    this.sequence,
  });

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
  Geolocation({
    String? location,
    String? region,
    int? sequence,
  }) : super(
          location: location,
          region: region,
          sequence: sequence,
        );

  /// Creates an instance from JSON.
  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        location: json['location'],
        region: json['region'],
        sequence: json['sequence'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['location'] = location;
    resultMap['region'] = region;
    resultMap['sequence'] = sequence;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Geolocation copyWith({
    String? location,
    String? region,
    int? sequence,
  }) =>
      Geolocation(
        location: location ?? this.location,
        region: region ?? this.region,
        sequence: sequence ?? this.sequence,
      );
}
