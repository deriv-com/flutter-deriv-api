import 'package:flutter_deriv_api/api/application/app/app_details.dart';
import 'package:flutter_deriv_api/api/application/app/app_markup_details.dart';
import 'package:flutter_deriv_api/api/application/app/app_register.dart';
import 'package:flutter_deriv_api/api/application/app/app_update.dart';
import 'package:flutter_deriv_api/api/application/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/application/models/app_delete_model.dart';
import 'package:flutter_deriv_api/api/application/new_account/new_account_real.dart';
import 'package:flutter_deriv_api/api/application/new_account/new_account_virtual.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Application calls methods
class Application {
  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Delete application
  /// For parameters information refer to [AppDeleteRequest]
  static Future<AppDeleteModel> deleteApplication({
    AppDeleteRequest request,
  }) async {
    final AppDeleteResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return AppDeleteModel.fromResponse(result: response.appDelete);
  }

  /// Fetch application details
  /// For parameters information refer to [AppGetRequest]
  static Future<AppDetails> fetchApplicationDetails({
    AppGetRequest request,
  }) async {
    final AppGetResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return AppDetails.fromJson(response.appGet);
  }

  /// Fetch application list
  /// For parameters information refer to [AppListRequest]
  static Future<List<AppDetails>> fetchApplicationList({
    AppListRequest request,
  }) async {
    final AppListResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return getListFromMap(
      response.appList,
      itemToTypeCallback: (dynamic item) => AppDetails.fromJson(item),
    );
  }

  /// Fetch application markup details
  /// For parameters information refer to [AppMarkupDetailsRequest]
  static Future<AppMarkupDetails> fetchApplicationMarkupDetails({
    AppMarkupDetailsRequest request,
  }) async {
    final AppMarkupDetailsResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return AppMarkupDetails.fromJson(response.appMarkupDetails);
  }

  /// Register application
  /// For parameters information refer to [AppRegisterRequest]
  static Future<AppRegister> registerApplication({
    AppRegisterRequest request,
  }) async {
    final AppRegisterResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return AppRegister.fromJson(response.appRegister);
  }

  /// Update application
  /// For parameters information refer to [AppUpdateRequest]
  static Future<AppUpdate> updateApplication({
    AppUpdateRequest request,
  }) async {
    final AppUpdateResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return AppUpdate.fromJson(response.appUpdate);
  }

  /// Open new real account
  /// For parameters information refer to [NewAccountRealRequest]
  static Future<NewAccountReal> openNewRealAccount({
    NewAccountRealRequest request,
  }) async {
    final NewAccountRealResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return NewAccountReal.fromJson(response.newAccountReal);
  }

  /// Open new virtual account
  /// For parameters information refer to [NewAccountVirtualRequest]
  static Future<NewAccountVirtual> openNewVirtualAccount({
    NewAccountVirtualRequest request,
  }) async {
    final NewAccountVirtualResponse response =
        await _api.call(request: request);

    if (response.error != null) {
      throw AppException(
        message: response.error['message'],
      );
    }

    return NewAccountVirtual.fromJson(response.newAccountVirtual);
  }
}
