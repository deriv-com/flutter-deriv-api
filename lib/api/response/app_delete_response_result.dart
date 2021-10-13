// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_delete_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/app_delete_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// App delete response model class.
abstract class AppDeleteResponseModel extends Equatable {
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
    int? appDelete,
  }) : super(
          appDelete: appDelete,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Deletes the application by appId specified in [AppDeleteRequest.appDelete].
  ///
  /// For parameters information refer to [AppDeleteRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<AppDeleteResponse> deleteApplication(
      AppDeleteRequest request) async {
    final AppDeleteReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
