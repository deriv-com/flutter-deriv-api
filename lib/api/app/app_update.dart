import 'package:flutter_deriv_api/api/app/app.dart';
import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/app/models/app_update_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// App update class
class AppUpdate extends AppUpdateModel {
  /// Initializes
  AppUpdate({
    App? appDetails,
  }) : super(
          appDetails: appDetails,
        );

  /// Creates an instance from JSON
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        appDetails: getItemFromMap(
          json,
          itemToTypeCallback: (dynamic item) => App.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a copy of instance with given parameters
  AppUpdate copyWith({
    App? appDetails,
  }) =>
      AppUpdate(
        appDetails: appDetails ?? this.appDetails as App?,
      );

  /// Updates the application specified in [request].
  ///
  /// For parameters information refer to [AppUpdateRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<AppUpdate> updateApplication(AppUpdateRequest request) async {
    final AppUpdateResponse response =
        await _api.call<AppUpdateResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return AppUpdate.fromJson(response.appUpdate!);
  }
}
