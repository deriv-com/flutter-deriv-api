import '../../basic_api/generated/ping_receive.dart';
import '../../basic_api/generated/ping_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Ping response model class
abstract class PingResponseModel {
  /// Initializes
  PingResponseModel({
    this.ping,
  });

  /// Will return 'pong'
  final PingEnum? ping;
}

/// Ping response class
class PingResponse extends PingResponseModel {
  /// Initializes
  PingResponse({
    PingEnum? ping,
  }) : super(
          ping: ping,
        );

  /// Creates an instance from JSON
  factory PingResponse.fromJson(
    dynamic pingJson,
  ) =>
      PingResponse(
        ping: pingJson == null ? null : pingEnumMapper[pingJson]!,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ping'] = pingEnumMapper.entries
        .firstWhere((MapEntry<String, PingEnum> entry) => entry.value == ping)
        .key;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Sends the ping request to the server.
  ///
  /// Mostly used to test the connection or to keep it alive.
  /// Throws a [PingException] if API response contains an error
  static Future<PingResponse> pingMethod([
    PingSend? request,
  ]) async {
    final PingReceive response = await _api.call(
      request: request ?? const PingSend(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          PingException(baseExceptionModel: baseExceptionModel),
    );

    return PingResponse.fromJson(response.ping);
  }

  /// Creates a copy of instance with given parameters
  PingResponse copyWith({
    PingEnum? ping,
  }) =>
      PingResponse(
        ping: ping ?? this.ping,
      );
}

/// PingEnum mapper.
final Map<String, PingEnum> pingEnumMapper = <String, PingEnum>{
  "pong": PingEnum.pong,
};

/// Ping Enum.
enum PingEnum {
  /// pong.
  pong,
}
