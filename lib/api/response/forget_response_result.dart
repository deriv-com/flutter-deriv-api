// ignore_for_file: prefer_single_quotes
import 'package:equatable/equatable.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// Forget response model class.
abstract class ForgetResponseModel extends Equatable {
  /// Initializes Forget response model class .
  const ForgetResponseModel({
    this.forget,
  });

  /// If set to `true`, stream exited and stopped. If set to `false`, stream did not exist.
  final bool? forget;
}

/// Forget response class.
class ForgetResponse extends ForgetResponseModel {
  /// Initializes Forget response class.
  const ForgetResponse({
    bool? forget,
  }) : super(
          forget: forget,
        );

  /// Creates an instance from JSON.
  factory ForgetResponse.fromJson(
    dynamic forgetJson,
  ) =>
      ForgetResponse(
        forget: getBool(forgetJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['forget'] = forget;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Immediately cancels the real-time stream of messages with a specific id.
  ///
  /// For parameters information refer to [ForgetRequest].
  /// Throws a [ForgetException] if API response contains an error
  static Future<ForgetResponse> forgetMethod(
    ForgetRequest request,
  ) async {
    final ForgetReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ForgetException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Creates a copy of instance with given parameters.
  ForgetResponse copyWith({
    bool? forget,
  }) =>
      ForgetResponse(
        forget: forget ?? this.forget,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
