part of 'active_symbols_bloc.dart';

abstract class ActiveSymbolsEvent {}

class FetchActiveSymbols extends ActiveSymbolsEvent {
  FetchActiveSymbols();

  @override
  String toString() => 'FetchActiveSymbols';
}

class SelectActiveSymbol extends ActiveSymbolsEvent {
  SelectActiveSymbol(this.index);

  final int index;

  @override
  String toString() => 'SelectActiveSymbol index $index';
}
