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
