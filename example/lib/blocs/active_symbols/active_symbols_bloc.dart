import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'active_symbols_event.dart';

part 'active_symbols_state.dart';

class ActiveSymbolsBloc extends Bloc<ActiveSymbolsEvent, ActiveSymbolsState> {
  ActiveSymbolsBloc();

  @override
  ActiveSymbolsState get initialState => ActiveSymbolsLoading();

  @override
  Stream<ActiveSymbolsState> mapEventToState(ActiveSymbolsEvent event) async* {
    if (event is FetchActiveSymbols) {
      yield ActiveSymbolsLoading();

      try {
        final List<ActiveSymbol> symbols = await _fetchActiveSymbols();
        yield ActiveSymbolsLoaded(
          activeSymbols: symbols,
          selectedSymbol: symbols.first,
        );
      } on Exception catch (e) {
        yield ActiveSymbolsError(e.toString());
      }
    } else if (event is SelectActiveSymbols) {
      if (state is ActiveSymbolsLoaded) {
        final ActiveSymbolsLoaded loadedState = state;
        yield ActiveSymbolsLoaded(
          activeSymbols: loadedState.activeSymbols,
          selectedSymbol: loadedState.activeSymbols[event.index],
        );
      } else {
        yield ActiveSymbolsLoading();
        add(FetchActiveSymbols());
      }
    }
  }

  Future<List<ActiveSymbol>> _fetchActiveSymbols() async =>
      ActiveSymbol.fetchActiveSymbols(const ActiveSymbolsRequest(
        activeSymbols: 'brief',
        productType: 'basic',
      ));

  @override
  Future<void> close() async => super.close();
}
