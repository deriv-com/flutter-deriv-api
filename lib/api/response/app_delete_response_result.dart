// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_delete_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_delete_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// App delete response model class.
abstract class AppDeleteResponseModel {
  /// Initializes App delete response model class .
  const AppDeleteResponseModel({
    this.appDelete,
  });

  /// 1 on success
  final int? appDelete;
}

/// App delete response class.
class AppDeleteResponse extends AppDeleteResponseModel {
  /// Initializes App delete response class.
  const AppDeleteResponse({
    super.appDelete,
  });

  /// Creates an instance from JSON.
  factory AppDeleteResponse.fromJson(
    dynamic appDeleteJson,
  ) =>
      AppDeleteResponse(
        appDelete: appDeleteJson,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_delete'] = appDelete;

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Deletes the application by appId specified in [AppDeleteRequest.appDelete].
  ///
  /// For parameters information refer to [AppDeleteRequest].
  /// Throws an [BaseAPIException] if API response contains an error
  static Future<AppDeleteResponse> deleteApplication(
      AppDeleteRequest request) async {
    final AppDeleteReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return AppDeleteResponse.fromJson(response.appDelete);
  }

  /// Creates a copy of instance with given parameters.
  AppDeleteResponse copyWith({
    int? appDelete,
  }) =>
      AppDeleteResponse(
        appDelete: appDelete ?? this.appDelete,
      );
}
