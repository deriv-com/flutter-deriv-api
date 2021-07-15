import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/response/active_symbols_receive_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';

part 'active_symbols_event.dart';
part 'active_symbols_state.dart';

/// ActiveSymbolsBloc
class ActiveSymbolsBloc extends Bloc<ActiveSymbolsEvent, ActiveSymbolsState> {
  
  /// ActiveSymbolsBloc initializer
  ActiveSymbolsBloc() : super(ActiveSymbolsLoading());

  @override
  Stream<ActiveSymbolsState> mapEventToState(ActiveSymbolsEvent event) async* {
    if (event is FetchActiveSymbols) {
      yield ActiveSymbolsLoading();

      try {
        final ActiveSymbolsResponse symbols = await _fetchActiveSymbols();
        yield ActiveSymbolsLoaded(activeSymbols: symbols.activeSymbols!);
      } on ActiveSymbolsException catch (error) {
        yield ActiveSymbolsError(error.message);
      }
    } else if (event is SelectActiveSymbol) {
      if (state is ActiveSymbolsLoaded) {
        // ignore: avoid_as
        final ActiveSymbolsLoaded loadedState = state as ActiveSymbolsLoaded;

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
      ActiveSymbolsResponse.fetchActiveSymbols(const ActiveSymbolsRequest(
        activeSymbols: 'brief',
        productType: 'basic',
      ));
}
