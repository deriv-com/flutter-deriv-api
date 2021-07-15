import '../../basic_api/generated/copy_stop_receive.dart';
import '../../basic_api/generated/copy_stop_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Copy stop response model class.
abstract class CopyStopResponseModel {
  /// Initializes Copy stop response model class .
  CopyStopResponseModel({
    this.copyStop,
  });

  /// Copy stopping confirmation. Returns 1 is success.
  final int? copyStop;
}

/// Copy stop response class.
class CopyStopResponse extends CopyStopResponseModel {
  /// Initializes Copy stop response class.
  CopyStopResponse({
    int? copyStop,
  }) : super(
          copyStop: copyStop,
        );

  /// Creates an instance from JSON.
  factory CopyStopResponse.fromJson(
    dynamic copyStopJson,
  ) =>
      CopyStopResponse(
        copyStop: copyStopJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['copy_stop'] = copyStop;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Stops copy trader bets.
  ///
  /// For parameters information refer to [CopyStopRequest].
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopyStopResponse> stop(CopyStopRequest request) async {
    final CopyStopReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          CopyTradingException(baseExceptionModel: baseExceptionModel),
    );

    return CopyStopResponse.fromJson(response.copyStop);
  }

  /// Creates a copy of instance with given parameters.
  CopyStopResponse copyWith({
    int? copyStop,
  }) =>
      CopyStopResponse(
        copyStop: copyStop ?? this.copyStop,
      );
}
