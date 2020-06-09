part of 'available_contracts_bloc.dart';

abstract class AvailableContractsEvent {}

class FetchAvailableContracts extends AvailableContractsEvent {
  FetchAvailableContracts({this.activeSymbol});

  final ActiveSymbol activeSymbol;

  @override
  String toString() => 'FetchAvailableContracts';
}
