import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';
import 'package:flutter_deriv_api/api/response/contracts_for_response_result.dart';
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

    on<FetchAvailableContracts>((FetchAvailableContracts event,
            Emitter<AvailableContractsState> emit) =>
        _handleFetchAvailableContracts(event, emit));

    on<SelectContract>(
        (SelectContract event, Emitter<AvailableContractsState> emit) =>
            _handleSelectContract(event, emit));
  }

  Future<void> _handleFetchAvailableContracts(
    FetchAvailableContracts event,
    Emitter<AvailableContractsState> emit,
  ) async {
    emit(AvailableContractsLoading());

    try {
      final ContractsForResponse contracts =
          await _fetchAvailableContracts(event.activeSymbol);

      emit(AvailableContractsLoaded(contracts: contracts.contractsFor!));
    } on ContractsForSymbolException catch (error) {
      emit(AvailableContractsError(error.message));
    }
  }

  void _handleSelectContract(
    SelectContract event,
    Emitter<AvailableContractsState> emit,
  ) {
    if (state is AvailableContractsLoaded) {
      final AvailableContractsLoaded loadedState =
          state as AvailableContractsLoaded;

      emit(AvailableContractsLoaded(
        contracts: loadedState.contracts,
        selectedContract: loadedState.contracts.available[event.index],
      ));
    } else {
      emit(AvailableContractsLoading());
      add(FetchAvailableContracts());
    }
  }

  Future<ContractsForResponse> _fetchAvailableContracts(
    ActiveSymbolsItem? selectedSymbol,
  ) async =>
      ContractsForResponse.fetchContractsForSymbol(ContractsForRequest(
        contractsFor: selectedSymbol?.symbol,
      ));
}
