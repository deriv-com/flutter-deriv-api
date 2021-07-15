import '../../basic_api/generated/set_self_exclusion_receive.dart';
import '../../basic_api/generated/set_self_exclusion_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Set self exclusion response model class.
abstract class SetSelfExclusionResponseModel {
  /// Initializes Set self exclusion response model class .
  SetSelfExclusionResponseModel({
    this.setSelfExclusion,
  });

  /// `1` on success
  final int? setSelfExclusion;
}

/// Set self exclusion response class.
class SetSelfExclusionResponse extends SetSelfExclusionResponseModel {
  /// Initializes Set self exclusion response class.
  SetSelfExclusionResponse({
    int? setSelfExclusion,
  }) : super(
          setSelfExclusion: setSelfExclusion,
        );

  /// Creates an instance from JSON.
  factory SetSelfExclusionResponse.fromJson(
    dynamic setSelfExclusionJson,
  ) =>
      SetSelfExclusionResponse(
        setSelfExclusion: setSelfExclusionJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['set_self_exclusion'] = setSelfExclusion;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Sets Self-Exclusion (this call should be used in conjunction with [fetchSelfExclusion])
  ///
  /// For parameters information refer to [SetSelfExclusionRequest].
  /// Throws a [SelfExclusionException] if API response contains an error
  static Future<SetSelfExclusionResponse> setSelfExclusionMethod(
      SetSelfExclusionRequest request) async {
    final SetSelfExclusionReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          SelfExclusionException(baseExceptionModel: baseExceptionModel),
    );

    return SetSelfExclusionResponse.fromJson(response.setSelfExclusion);
  }

  /// Creates a copy of instance with given parameters.
  SetSelfExclusionResponse copyWith({
    int? setSelfExclusion,
  }) =>
      SetSelfExclusionResponse(
        setSelfExclusion: setSelfExclusion ?? this.setSelfExclusion,
      );
}
