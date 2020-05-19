import 'package:flutter_deriv_api/api/app/app.dart';
import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/app/models/app_register_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// App register class
class AppRegister extends AppRegisterModel {
  /// Initializes
  AppRegister({
    App appDetails,
  }) : super(
          appDetails: appDetails,
        );

  /// Creates an instance from JSON
  factory AppRegister.fromJson(Map<String, dynamic> json) => AppRegister(
        appDetails: getItemFromMap(
          json,
          itemToTypeCallback: (dynamic item) => App.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  AppRegister copyWith({
    App appDetails,
  }) =>
      AppRegister(
        appDetails: appDetails ?? this.appDetails,
      );

  /// Register a new OAuth application.
  /// For parameters information refer to [AppRegisterRequest].
  static Future<AppRegister> registerApplication(
    AppRegisterRequest request,
  ) async {
    final AppRegisterResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) => AppException(
        message: message,
      ),
    );

    return AppRegister.fromJson(response.appRegister);
  }
}
