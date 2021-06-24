part of 'available_contracts_bloc.dart';

/// AvailableContractsEvent
abstract class AvailableContractsEvent {}

/// FetchAvailableContracts
class FetchAvailableContracts extends AvailableContractsEvent {
  /// Initializes
  FetchAvailableContracts({this.activeSymbol});

  /// Fetch contract for this symbol
  final ActiveSymbol? activeSymbol;

  @override
  String toString() => 'FetchAvailableContracts';
}

/// SelectContract
class SelectContract extends AvailableContractsEvent {
  /// Initializes
  SelectContract(this.index);

  /// Selected contract index
  final int index;

  @override
  String toString() => 'SelectContract index: $index';
}
