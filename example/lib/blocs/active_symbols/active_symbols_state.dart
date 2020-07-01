part of 'active_symbols_bloc.dart';

/// ActiveSymbolsState
abstract class ActiveSymbolsState {
  /// Initializes
  ActiveSymbolsState();
}

/// ActiveSymbolsLoading
class ActiveSymbolsLoading extends ActiveSymbolsState {
  @override
  String toString() => 'ActiveSymbolsLoading...';
}

/// ActiveSymbolsError
class ActiveSymbolsError extends ActiveSymbolsState {
  /// Initializes
  ActiveSymbolsError(this.message);

  /// Error message
  final String message;

  @override
  String toString() => 'ActiveSymbolsError';
}

/// ActiveSymbolsLoaded
class ActiveSymbolsLoaded extends ActiveSymbolsState {
  /// Initializes
  ActiveSymbolsLoaded({
    this.activeSymbols,
    ActiveSymbol selectedSymbol,
  }) : _selectedSymbol = selectedSymbol ?? activeSymbols?.first;

  /// List of symbols
  final List<ActiveSymbol> activeSymbols;

  final ActiveSymbol _selectedSymbol;

  /// Selected symbol
  ActiveSymbol get selectedSymbol => _selectedSymbol;

  @override
  String toString() => 'ActiveSymbolsLoaded ${activeSymbols.length} symbols';
}
