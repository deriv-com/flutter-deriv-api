import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/exceptions/contract_for_symbol_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

import '../active_symbols/active_symbols_bloc.dart';

part 'available_contracts_event.dart';
part 'available_contracts_state.dart';

/// AvailableContractsBloc
class AvailableContractsBloc
    extends Bloc<AvailableContractsEvent, AvailableContractsState> {
  /// Initializes
  AvailableContractsBloc(ActiveSymbolsBloc activeSymbolsBloc)
      : super(AvailableContractsLoading()) {
    activeSymbolsBloc.stream.listen((ActiveSymbolsState activeSymbolsState) {
      if (activeSymbolsState is ActiveSymbolsLoaded) {
        add(
          FetchAvailableContracts(
            activeSymbol: activeSymbolsState.selectedSymbol,
          ),
        );
      }
    });
  }

  @override
  Stream<AvailableContractsState> mapEventToState(
    AvailableContractsEvent event,
  ) async* {
    if (event is FetchAvailableContracts) {
      yield AvailableContractsLoading();

      try {
        final ContractsForSymbol contracts =
            await _fetchAvailableContracts(event.activeSymbol!);

        yield AvailableContractsLoaded(contracts: contracts);
      } on ContractsForSymbolException catch (error) {
        yield AvailableContractsError(error.message);
      }
    } else if (event is SelectContract) {
      if (state is AvailableContractsLoaded) {
        final AvailableContractsLoaded loadedState =
            state as AvailableContractsLoaded;

        yield AvailableContractsLoaded(
          contracts: loadedState.contracts,
          selectedContract:
              loadedState.contracts?.availableContracts?.elementAt(event.index),
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
      ContractsForSymbol.fetchContractsForSymbol(
        ContractsForRequest(contractsFor: selectedSymbol.symbol),
      );
}
