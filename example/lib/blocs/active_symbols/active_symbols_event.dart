part of 'active_symbols_bloc.dart';

/// ActiveSymbolsEvent
abstract class ActiveSymbolsEvent {}

/// FetchActiveSymbols
class FetchActiveSymbols extends ActiveSymbolsEvent {
  /// Initializes
  FetchActiveSymbols();

  @override
  String toString() => 'FetchActiveSymbols';
}

/// SelectActiveSymbol
class SelectActiveSymbol extends ActiveSymbolsEvent {
  /// Initializes
  SelectActiveSymbol(this.index);

  /// Index of selected symbol
  final int index;

  @override
  String toString() => 'SelectActiveSymbol index: $index';
}
