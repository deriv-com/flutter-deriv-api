import 'package:flutter_deriv_api/api/common/forget/exceptions/forget_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:meta/meta.dart';

/// Base forget all model class
abstract class BaseForgetAllModel {
  /// Initializes
  BaseForgetAllModel({
    @required this.forgetAll,
  });

  /// IDs of the cancelled streams
  final List<dynamic> forgetAll;
}

/// Base forget all class
class BaseForgetAll extends BaseForgetAllModel {
  /// Initializes
  BaseForgetAll({
    @required List<dynamic> forgetAll,
  }) : super(
          forgetAll: forgetAll,
        );

  /// Creates an instance from JSON
  factory BaseForgetAll.fromJson(
    dynamic forgetAllJson,
  ) =>
      BaseForgetAll(
        forgetAll: forgetAllJson == null
            ? null
            : List<dynamic>.from(forgetAllJson.map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (forgetAll != null) {
      resultMap['forget_all'] =
          forgetAll.map<dynamic>((dynamic item) => item).toList();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Immediately cancels the real-time streams of messages of given type.
  ///
  /// For parameters information refer to [ForgetAllRequest].
  /// Throws a [ForgetException] if API response contains an error
  static Future<BaseForgetAll> forgetAllMethod(
    ForgetAllRequest request,
  ) async {
    final ForgetAllResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          ForgetException(baseExceptionModel: baseExceptionModel),
    );

    return BaseForgetAll.fromJson(response);
  }

  /// Creates a copy of instance with given parameters
  BaseForgetAll copyWith({
    List<dynamic> forgetAll,
  }) =>
      BaseForgetAll(
        forgetAll: forgetAll ?? this.forgetAll,
      );
}
