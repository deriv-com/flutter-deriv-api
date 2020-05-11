import 'package:flutter_deriv_api/api/application/exceptions/application_exception.dart';
import 'package:flutter_deriv_api/api/application/models/app_delete_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App delete class
class AppDelete extends AppDeleteModel {
  /// Initializes
  AppDelete({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Creates an instance from response
  factory AppDelete.fromResponse(int result) => AppDelete(
        succeeded: getBool(result),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  AppDelete copyWith({
    bool succeeded,
  }) =>
      AppDelete(
        succeeded: succeeded ?? this.succeeded,
      );

  /// The request for deleting an application.
  /// For parameters information refer to [AppDeleteRequest].
  static Future<AppDelete> deleteApplication(AppDeleteRequest request) async {
    final AppDeleteResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ApplicationException(message: response.error['message']);
    }

    return AppDelete.fromResponse(response.appDelete);
  }
}
