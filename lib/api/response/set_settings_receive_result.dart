import '../../basic_api/generated/set_settings_receive.dart';
import '../../basic_api/generated/set_settings_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Set settings response model class.
abstract class SetSettingsResponseModel {
  /// Initializes Set settings response model class .
  SetSettingsResponseModel({
    this.setSettings,
  });

  /// 1 on success
  final int? setSettings;
}

/// Set settings response class.
class SetSettingsResponse extends SetSettingsResponseModel {
  /// Initializes Set settings response class.
  SetSettingsResponse({
    int? setSettings,
  }) : super(
          setSettings: setSettings,
        );

  /// Creates an instance from JSON.
  factory SetSettingsResponse.fromJson(
    dynamic setSettingsJson,
  ) =>
      SetSettingsResponse(
        setSettings: setSettingsJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['set_settings'] = setSettings;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Changes the user's settings with parameters specified as [SetSettingsRequest]
  ///
  /// Throws an [AccountSettingsException] if API response contains an error
  static Future<SetSettingsResponse> changeAccountSetting(
    SetSettingsRequest request,
  ) async {
    final SetSettingsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AccountSettingsException(baseExceptionModel: baseExceptionModel),
    );

    return SetSettingsResponse(setSettings: response.setSettings ?? 0);
  }

  /// Creates a copy of instance with given parameters.
  SetSettingsResponse copyWith({
    int? setSettings,
  }) =>
      SetSettingsResponse(
        setSettings: setSettings ?? this.setSettings,
      );
}
