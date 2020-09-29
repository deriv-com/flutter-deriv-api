import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exceptions/tick_exception.dart';
import 'tick_base.dart';
import 'tick_history.dart';

/// Consists of stream of type [TickBase] and its history as [TickHistory]
class TickHistorySubscription {
  /// Initializes
  TickHistorySubscription({this.tickHistory, this.tickStream});

  /// The history of tick
  final TickHistory tickHistory;

  /// The stream of the tick
  final Stream<TickBase> tickStream;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Unsubscribes from tick history stream
  ///
  /// Throws a [TickException] if API response contains an error
  Future<Forget> unsubscribe() async {
    if (tickHistory.subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response = await _api.unsubscribe(
      subscriptionId: tickHistory.subscriptionInformation.id,
    );

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          TickException(code: code, message: message),
    );

    return Forget.fromResponse(response);
  }

  /// Creates a copy of instance with given parameters
  TickHistorySubscription copyWith(
    TickHistory tickHistory,
    Stream<TickBase> tickStream,
  ) =>
      TickHistorySubscription(
        tickHistory: tickHistory ?? this.tickHistory,
        tickStream: tickStream ?? this.tickStream,
      );
}
