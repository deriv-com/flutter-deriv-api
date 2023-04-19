import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'active_symbols_event.dart';
part 'active_symbols_state.dart';

/// ActiveSymbolsBloc
class ActiveSymbolsBloc extends Bloc<ActiveSymbolsEvent, ActiveSymbolsState> {
  /// ActiveSymbolsBloc initializer
  ActiveSymbolsBloc() : super(ActiveSymbolsLoading()) {
    on<FetchActiveSymbols>(
        (FetchActiveSymbols event, Emitter<ActiveSymbolsState> emit) =>
            _handleFetchActiveSymbols(event, emit));

    on<SelectActiveSymbol>(
        (SelectActiveSymbol event, Emitter<ActiveSymbolsState> emit) =>
            _handleSelectActiveSymbol(event, emit));
  }

  Future<void> _handleFetchActiveSymbols(
      FetchActiveSymbols event, Emitter<ActiveSymbolsState> emit) async {
    emit(ActiveSymbolsLoading());

    try {
      final ActiveSymbolsResponse symbols = await _fetchActiveSymbols();
      emit(ActiveSymbolsLoaded(activeSymbols: symbols.activeSymbols!));
    } on ActiveSymbolsException catch (error) {
      emit(ActiveSymbolsError(error.message));
    }
  }

  Future<void> _handleSelectActiveSymbol(
      SelectActiveSymbol event, Emitter<ActiveSymbolsState> emit) async {
    if (state is ActiveSymbolsLoaded) {
      final ActiveSymbolsLoaded loadedState = state as ActiveSymbolsLoaded;

      emit(ActiveSymbolsLoaded(
        activeSymbols: loadedState.activeSymbols,
        selectedSymbol: loadedState.activeSymbols[event.index],
      ));
    } else {
      emit(ActiveSymbolsLoading());
      add(FetchActiveSymbols());
    }
  }

  Future<ActiveSymbolsResponse> _fetchActiveSymbols() async =>
      ActiveSymbolsResponse.fetchActiveSymbols(const ActiveSymbolsRequest(
        activeSymbols: 'brief',
        productType: 'basic',
      ));
}
