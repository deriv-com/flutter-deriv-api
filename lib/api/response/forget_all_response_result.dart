// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Forget all response model class.
abstract class ForgetAllResponseModel {
  /// Initializes Forget all response model class .
  const ForgetAllResponseModel({
    this.forgetAll,
  });

  /// IDs of the cancelled streams
  final List<dynamic>? forgetAll;
}

/// Forget all response class.
class ForgetAllResponse extends ForgetAllResponseModel {
  /// Initializes Forget all response class.
  const ForgetAllResponse({
    List<dynamic>? forgetAll,
  }) : super(
          forgetAll: forgetAll,
        );

  /// Creates an instance from JSON.
  factory ForgetAllResponse.fromJson(
    dynamic forgetAllJson,
  ) =>
      ForgetAllResponse(
        forgetAll: forgetAllJson == null
            ? null
            : List<dynamic>.from(
                forgetAllJson?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (forgetAll != null) {
      resultMap['forget_all'] = forgetAll!
          .map<dynamic>(
            (dynamic item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector().get<BaseAPI>()!;

  /// Immediately cancels the real-time streams of messages of given type.
  ///
  /// For parameters information refer to [ForgetAllRequest].
  /// Throws a [ForgetException] if API response contains an error
  static Future<ForgetAllResponse> forgetAllMethod(
    ForgetAllRequest request,
  ) async {
    final ForgetAllReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ForgetException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Creates a copy of instance with given parameters.
  ForgetAllResponse copyWith({
    List<dynamic>? forgetAll,
  }) =>
      ForgetAllResponse(
        forgetAll: forgetAll ?? this.forgetAll,
      );
}
