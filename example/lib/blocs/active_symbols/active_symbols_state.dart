part of 'active_symbols_bloc.dart';

abstract class ActiveSymbolsState {
  ActiveSymbolsState();
}

class ActiveSymbolsLoading extends ActiveSymbolsState {
  @override
  String toString() => 'ActiveSymbolsLoading...';
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
    ActiveSymbol selectedSymbol,
  }) : _selectedSymbol = selectedSymbol ?? activeSymbols?.first;

  final List<ActiveSymbol> activeSymbols;

  final ActiveSymbol _selectedSymbol;

  ActiveSymbol get selectedSymbol => _selectedSymbol;

  @override
  String toString() => 'ActiveSymbolsLoaded ${activeSymbols.length} symbols';
}
