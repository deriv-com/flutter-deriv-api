part of 'available_contracts_bloc.dart';

abstract class AvailableContractsState {
  AvailableContractsState();
}

class AvailableContractsLoading extends AvailableContractsState {
  @override
  String toString() => 'AvailableContractsLoading...';
}

class AvailableContractsError extends AvailableContractsState {
  AvailableContractsError(this.message);

  final String message;

  @override
  String toString() => 'AvailableContractsError';
}

class AvailableContractsLoaded extends AvailableContractsState {
  AvailableContractsLoaded({
    this.contracts,
    AvailableContractModel selectedContract,
  }) : _selectedContract =
            selectedContract ?? contracts?.availableContracts?.first;

  final ContractsForSymbol contracts;

  final AvailableContractModel _selectedContract;

  AvailableContractModel get selectedContract => _selectedContract;

  @override
  String toString() =>
      'AvailableContractsLoaded ${contracts.availableContracts.length} contracts';
}
