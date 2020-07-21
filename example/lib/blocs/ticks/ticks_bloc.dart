import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_api/api/common/tick/exceptions/tick_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

import '../active_symbols/active_symbols_bloc.dart';

part 'ticks_event.dart';

part 'ticks_state.dart';

/// TicksBloc
class TicksBloc extends Bloc<TicksEvent, TicksState> {
  /// Initializes
  TicksBloc(ActiveSymbolsBloc activeSymbolsBloc) {
    activeSymbolsBloc.listen((ActiveSymbolsState activeSymbolsState) async {
      if (activeSymbolsState is ActiveSymbolsLoaded) {
        add(SubscribeTicks(activeSymbolsState.selectedSymbol));
      }
    });
  }

  @override
  TicksState get initialState => TicksLoading();

  @override
  Stream<TicksState> mapEventToState(
    TicksEvent event,
  ) async* {
    if (event is SubscribeTicks) {
      yield TicksLoading();

      await _unsubscribeTick();

      _subscribeTick(event.selectedSymbol)
          .handleError((dynamic error) => error is TickException
              ? add(YieldError(error.message))
              : add(YieldError(error.toString())))
          .listen((Tick tick) => add(YieldTick(tick)));
    } else if (event is YieldTick) {
      yield TicksLoaded(event.tick);
    } else if (event is YieldError) {
      yield TicksError(event.message);
    }
  }

  Stream<Tick> _subscribeTick(ActiveSymbol selectedSymbol) =>
      Tick.subscribeTick(
        TicksRequest(ticks: selectedSymbol.symbol),
      );

  Future<ForgetAll> _unsubscribeTick() => Tick.unsubscribeAllTicks();

  @override
  Future<void> close() async {
    await _unsubscribeTick();

    await super.close();
  }
}
