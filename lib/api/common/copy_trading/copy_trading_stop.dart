import 'package:flutter_deriv_api/api/common/copy_trading/exceptions/copy_trading_exception.dart';
import 'package:flutter_deriv_api/api/common/models/copy_trading_stop_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Copy trading stop class
class CopyTradingStop extends CopyTradingStopModel {
  /// Initializes
  CopyTradingStop({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Generate an instance from response
  factory CopyTradingStop.fromResponse(CopyStopResponse response) =>
      CopyTradingStop(succeeded: getBool(response.copyStop));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  CopyTradingStop copyWith({
    bool succeeded,
  }) =>
      CopyTradingStop(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Stops copy trader bets.
  ///
  /// For parameters information refer to [CopyStopRequest].
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopyTradingStop> stop(CopyStopRequest request) async {
    final CopyStopResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          CopyTradingException(baseExceptionModel: baseExceptionModel),
    );

    return CopyTradingStop.fromResponse(response);
  }
}
