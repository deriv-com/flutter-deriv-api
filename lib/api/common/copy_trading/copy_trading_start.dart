import 'package:flutter_deriv_api/api/common/copy_trading/exceptions/copy_trading_exception.dart';
import 'package:flutter_deriv_api/api/common/models/copy_trading_start_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Copy trading start class
class CopyTradingStart extends CopyTradingStartModel {
  /// Initializes
  CopyTradingStart({
    bool succeeded,
  }) : super(succeeded: succeeded);

  /// Generate an instance from response
  factory CopyTradingStart.fromResponse(CopyStartResponse response) =>
      CopyTradingStart(succeeded: getBool(response.copyStart));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  CopyTradingStart copyWith({
    bool succeeded,
  }) =>
      CopyTradingStart(
        succeeded: succeeded ?? this.succeeded,
      );

  /// Starts copy trader bets.
  ///
  /// For parameters information refer to [CopyStartRequest].
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopyTradingStart> start(CopyStartRequest request) async {
    final CopyStartResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseException baseException}) => CopyTradingException(
          code: baseException.code, message: baseException.message),
    );

    return CopyTradingStart.fromResponse(response);
  }
}
