import 'package:flutter_deriv_api/api/common/forget/exceptions/forget_exception.dart';
import 'package:flutter_deriv_api/api/common/models/forget_all_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Forget All class
class ForgetAll extends ForgetAllModel {
  /// Initializes
  ForgetAll({
    List<String> cancelledStreams,
  }) : super(
          cancelledStreams: cancelledStreams,
        );

  /// Creates an instance from response
  factory ForgetAll.fromResponse(ForgetAllResponse response) => ForgetAll(
        cancelledStreams:
            response.forgetAll.map((dynamic item) => item.toString()).toList(),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  ForgetAll copyWith({
    List<String> cancelledStreams,
  }) =>
      ForgetAll(
        cancelledStreams: cancelledStreams ?? this.cancelledStreams,
      );

  /// Immediately cancels the real-time streams of messages of given type.
  ///
  /// For parameters information refer to [ForgetAllRequest].
  /// Throws a [ForgetException] if API response contains an error
  static Future<ForgetAll> forgetAll(
    ForgetAllRequest request,
  ) async {
    final ForgetAllResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ForgetException(message: response.error['message']);
    }

    return ForgetAll.fromResponse(response);
  }
}
