part of 'internet_bloc.dart';

/// Internet base event.
abstract class InternetEvent {}

/// Internet offline event.
class InternetOfflineEvent extends InternetEvent {
  /// Initializes internet offline state.
  InternetOfflineEvent(this.type);

  /// Offline type.
  final OfflineType type;

  @override
  String toString() =>
      'InternetEvent: InternetOfflineEvent, OfflineType: $type';
}

/// Internet online event.
class InternetOnlineEvent extends InternetEvent {
  @override
  String toString() => 'InternetEvent: InternetOnlineEvent';
}
