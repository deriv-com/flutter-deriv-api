part of 'active_symbols_bloc.dart';

abstract class ActiveSymbolsEvent {}

class FetchActiveSymbols extends ActiveSymbolsEvent {
  FetchActiveSymbols();

  @override
  String toString() => 'FetchActiveSymbols';
}

class SelectActiveSymbols extends ActiveSymbolsEvent {
  SelectActiveSymbols(this.index);

  final int index;

  @override
  String toString() => 'SelectActiveSymbols index $index';
}
