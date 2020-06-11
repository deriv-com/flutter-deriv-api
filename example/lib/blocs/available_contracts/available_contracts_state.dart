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
    ContractModel selectedContract,
  }) : _selectedContract = selectedContract ?? contracts?.contracts?.first;

  final ContractsForSymbol contracts;

  final ContractModel _selectedContract;

  ContractModel get selectedContract => _selectedContract;

  @override
  String toString() =>
      'AvailableContractsLoaded ${contracts.contracts.length} contracts';
}
