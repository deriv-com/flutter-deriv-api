import 'package:meta/meta.dart';

import '../../basic_api/generated/app_delete_receive.dart';
import '../../basic_api/generated/app_delete_send.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../../helpers/helpers.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// App delete response model class
abstract class AppDeleteResponseModel {
  /// Initializes
  AppDeleteResponseModel({
    @required this.appDelete,
  });

  /// 1 on success
  final int appDelete;
}

/// App delete response class
class AppDeleteResponse extends AppDeleteResponseModel {
  /// Initializes
  AppDeleteResponse({
    @required int appDelete,
  }) : super(
          appDelete: appDelete,
        );

  /// Creates an instance from JSON
  factory AppDeleteResponse.fromJson(
    dynamic appDeleteJson,
  ) =>
      AppDeleteResponse(
        appDelete: appDeleteJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['app_delete'] = appDelete;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Deletes the application by appId specified in [AppDeleteRequest.appDelete].
  ///
  /// For parameters information refer to [AppDeleteRequest].
  /// Throws an [AppException] if API response contains an error
  static Future<AppDeleteResponse> deleteApplication(
      AppDeleteSend request) async {
    final AppDeleteReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          AppException(baseExceptionModel: baseExceptionModel),
    );

    return AppDeleteResponse.fromJson(response.appDelete);
  }

  /// Creates a copy of instance with given parameters
  AppDeleteResponse copyWith({
    int appDelete,
  }) =>
      AppDeleteResponse(
        appDelete: appDelete ?? this.appDelete,
      );
}
