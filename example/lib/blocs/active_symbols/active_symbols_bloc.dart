import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/response/active_symbols_receive_result.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/exceptions/active_symbols_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'active_symbols_event.dart';
part 'active_symbols_state.dart';

/// ActiveSymbolsBloc
class ActiveSymbolsBloc extends Bloc<ActiveSymbolsEvent, ActiveSymbolsState> {
  ActiveSymbolsBloc() : super(ActiveSymbolsLoading());

  @override
  Stream<ActiveSymbolsState> mapEventToState(ActiveSymbolsEvent event) async* {
    if (event is FetchActiveSymbols) {
      yield ActiveSymbolsLoading();

      try {
        final List<ActiveSymbol> symbols = await _fetchActiveSymbols();
        yield ActiveSymbolsLoaded(activeSymbols: symbols);
      } on ActiveSymbolsException catch (error) {
        yield ActiveSymbolsError(error.message);
      }
    } else if (event is SelectActiveSymbol) {
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

  Future<ActiveSymbolsResponse> _fetchActiveSymbols() async =>
      ActiveSymbolsResponse.fetchActiveSymbols(const ActiveSymbolsSend(
        activeSymbols: 'brief',
        productType: 'basic',
      ));
}
