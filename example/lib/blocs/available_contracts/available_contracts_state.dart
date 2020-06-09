part of 'available_contracts_bloc.dart';

abstract class AvailableContractsState {
  AvailableContractsState();
}

class AvailableContractsLoading extends AvailableContractsState {
  @override
  String toString() => 'AvailableContractsLoading';
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
  }) : super();

  final ContractsForSymbol contracts;

  @override
  String toString() =>
      'AvailableContractsLoaded ${contracts.contracts.length} contracts';
}
