// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_settings_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_settings_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Set settings response model class.
abstract class SetSettingsResponseModel extends Equatable {
  /// Initializes Set settings response model class .
  const SetSettingsResponseModel({
    this.setSettings,
  });

  /// 1 on success
  final int? setSettings;
}

/// Set settings response class.
class SetSettingsResponse extends SetSettingsResponseModel {
  /// Initializes Set settings response class.
  const SetSettingsResponse({
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

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
