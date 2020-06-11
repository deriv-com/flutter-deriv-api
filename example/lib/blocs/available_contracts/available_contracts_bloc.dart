import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/exceptions/contract_for_symbol_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api_example/blocs/active_symbols/active_symbols_bloc.dart';

part 'available_contracts_event.dart';

part 'available_contracts_state.dart';

class AvailableContractsBloc
    extends Bloc<AvailableContractsEvent, AvailableContractsState> {
  AvailableContractsBloc(ActiveSymbolsBloc activeSymbolsBloc) {
    activeSymbolsBloc.listen((ActiveSymbolsState activeSymbolsState) {
      if (activeSymbolsState is ActiveSymbolsLoaded) {
        add(FetchAvailableContracts(
          activeSymbol: activeSymbolsState.selectedSymbol,
        ));
      }
    });
  }

  @override
  AvailableContractsState get initialState => AvailableContractsLoading();

  @override
  Stream<AvailableContractsState> mapEventToState(
    AvailableContractsEvent event,
  ) async* {
    if (event is FetchAvailableContracts) {
      yield AvailableContractsLoading();

      try {
        final ContractsForSymbol contracts =
            await _fetchAvailableContracts(event.activeSymbol);

        yield AvailableContractsLoaded(contracts: contracts);
      } on ContractsForSymbolException catch (error) {
        yield AvailableContractsError(error.message);
      }
    } else if (event is SelectContract) {
      if (state is AvailableContractsLoaded) {
        final AvailableContractsLoaded loadedState = state;

        yield AvailableContractsLoaded(
          contracts: loadedState.contracts,
          selectedContract: loadedState.contracts.contracts[event.index],
        );
      } else {
        yield AvailableContractsLoading();
        add(FetchAvailableContracts());
      }
    }
  }

  Future<ContractsForSymbol> _fetchAvailableContracts(
    ActiveSymbol selectedSymbol,
  ) async =>
      ContractsForSymbol.fetchContractsForSymbol(ContractsForRequest(
        contractsFor: selectedSymbol.symbol,
      ));
}
