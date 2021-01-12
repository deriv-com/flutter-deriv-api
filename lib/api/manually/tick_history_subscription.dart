import '../../basic_api/generated/forget_receive.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../response/forget_receive_result.dart';
import '../response/ticks_history_receive_result.dart';
import 'tick_base.dart';

/// Consists of stream of type [TickBase] and its history as [TickHistory]
class TickHistorySubscription {
  /// Initializes
  TickHistorySubscription({this.tickHistory, this.tickStream});

  /// The history of tick
  final TicksHistoryResponse tickHistory;

  /// The stream of the tick
  final Stream<TickBase> tickStream;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Unsubscribes from tick history stream
  ///
  /// Throws a [TickException] if API response contains an error
  Future<ForgetResponse> unsubscribe() async {
    if (tickHistory.subscription?.id == null) {
      return null;
    }

    final ForgetReceive response = await _api.unsubscribe(
      subscriptionId: tickHistory.subscription.id,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          TickException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Creates a copy of instance with given parameters
  TickHistorySubscription copyWith(
    TicksHistoryResponse tickHistory,
    Stream<TickBase> tickStream,
  ) =>
      TickHistorySubscription(
        tickHistory: tickHistory ?? this.tickHistory,
        tickStream: tickStream ?? this.tickStream,
      );
}
