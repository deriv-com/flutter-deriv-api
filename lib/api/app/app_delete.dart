import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/app/models/app_delete_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// App delete class
class AppDelete extends AppDeleteModel {
  /// Initializes
  AppDelete({
    bool? succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory AppDelete.fromResponse(AppDeleteResponse response) =>
      AppDelete(succeeded: getBool(response.appDelete));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a copy of instance with given parameters
  AppDelete copyWith({
    bool? succeeded,
  }) =>
      AppDelete(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Deletes the application by appId specified in [AppDeleteRequest.appDelete].
  ///
  /// For parameters information refer to [AppDeleteRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<AppDelete> deleteApplication(AppDeleteRequest request) async {
    final AppDeleteResponse response =
        await _api.call<AppDeleteResponse>(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return AppDelete.fromResponse(response);
  }
}
