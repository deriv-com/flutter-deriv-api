part of 'active_symbols_bloc.dart';

abstract class ActiveSymbolsState {
  ActiveSymbolsState();
}

class ActiveSymbolsLoading extends ActiveSymbolsState {
  @override
  String toString() => 'ActiveSymbolsLoading';
}

class ActiveSymbolsError extends ActiveSymbolsState {
  ActiveSymbolsError(this.message);

  final String message;

  @override
  String toString() => 'ActiveSymbolsError';
}

class ActiveSymbolsLoaded extends ActiveSymbolsState {
  ActiveSymbolsLoaded({
    this.activeSymbols,
    this.selectedSymbol,
  }) : super();

  final ActiveSymbol selectedSymbol;

  final List<ActiveSymbol> activeSymbols;

  @override
  String toString() => 'ActiveSymbolsLoaded ${activeSymbols.length} symbols';
}
