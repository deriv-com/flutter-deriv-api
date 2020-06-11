part of 'available_contracts_bloc.dart';

abstract class AvailableContractsEvent {}

class FetchAvailableContracts extends AvailableContractsEvent {
  FetchAvailableContracts({this.activeSymbol});

  final ActiveSymbol activeSymbol;

  @override
  String toString() => 'FetchAvailableContracts';
}

class SelectContract extends AvailableContractsEvent {
  SelectContract(this.index);

  final int index;

  @override
  String toString() => 'SelectContract: $index';
}
