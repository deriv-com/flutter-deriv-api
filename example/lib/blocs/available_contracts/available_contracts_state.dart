part of 'available_contracts_bloc.dart';

/// AvailableContractsState
abstract class AvailableContractsState {
  /// Initializes
  AvailableContractsState();
}

/// AvailableContractsLoading
class AvailableContractsLoading extends AvailableContractsState {
  @override
  String toString() => 'AvailableContractsLoading...';
}

/// AvailableContractsError
class AvailableContractsError extends AvailableContractsState {
  /// Initializes
  AvailableContractsError(this.message);

  /// Error message
  final String message;

  @override
  String toString() => 'AvailableContractsError';
}

/// AvailableContractsLoaded
class AvailableContractsLoaded extends AvailableContractsState {
  ///Initializes
  AvailableContractsLoaded({
    this.contracts,
    AvailableItem selectedContract,
  }) : _selectedContract =
            selectedContract ?? contracts?.available?.first;

  /// Contracts
  final ContractsFor contracts;

  final AvailableItem _selectedContract;

  /// Selected Contract
  AvailableItem get selectedContract => _selectedContract;

  @override
  String toString() =>
      'AvailableContractsLoaded ${contracts.available.length} contracts';
}
