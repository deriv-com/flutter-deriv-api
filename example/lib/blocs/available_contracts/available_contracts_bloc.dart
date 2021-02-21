import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter_deriv_api/api/response/contracts_for_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_receive_result.dart';


import '../active_symbols/active_symbols_bloc.dart';

part 'available_contracts_event.dart';
part 'available_contracts_state.dart';

/// AvailableContractsBloc
class AvailableContractsBloc
    extends Bloc<AvailableContractsEvent, AvailableContractsState> {
  /// Initializes
  AvailableContractsBloc(ActiveSymbolsBloc activeSymbolsBloc)
      : super(AvailableContractsLoading()) {
    activeSymbolsBloc.listen((ActiveSymbolsState activeSymbolsState) {
      if (activeSymbolsState is ActiveSymbolsLoaded) {
        add(FetchAvailableContracts(
          activeSymbol: activeSymbolsState.selectedSymbol,
        ));
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
        final ContractsForResponse contracts =
            await _fetchAvailableContracts(event.activeSymbol);

        yield AvailableContractsLoaded(contracts: contracts.contractsFor);
      } on ContractsForSymbolException catch (error) {
        yield AvailableContractsError(error.message);
      }
    } else if (event is SelectContract) {
      if (state is AvailableContractsLoaded) {
        final AvailableContractsLoaded loadedState = state;

        yield AvailableContractsLoaded(
          contracts: loadedState.contracts,
          selectedContract:
              loadedState.contracts.available[event.index],
        );
      } else {
        yield AvailableContractsLoading();
        add(FetchAvailableContracts());
      }
    }
  }

  Future<ContractsForResponse> _fetchAvailableContracts(
    ActiveSymbolsItem selectedSymbol,
  ) async =>
      ContractsForResponse.fetchContractsForSymbol(ContractsForSend(
        contractsFor: selectedSymbol.symbol,
      ));
}
