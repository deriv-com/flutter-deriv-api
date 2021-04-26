part of 'internet_bloc.dart';

/// Internet base event.
abstract class InternetEvent {}

/// Internet offline event.
class InternetOfflineEvent extends InternetEvent {
  /// Initializes internet offline state.
  InternetOfflineEvent({this.isWebSocketClosed});

  /// True if webSocket is closed.
  final bool isWebSocketClosed;

  @override
  String toString() =>
      'InternetEvent: InternetOfflineEvent, isWebSocketClosed: $isWebSocketClosed';
}

/// Internet online event.
class InternetOnlineEvent extends InternetEvent {
  @override
  String toString() => 'InternetEvent: InternetOnlineEvent';
}
