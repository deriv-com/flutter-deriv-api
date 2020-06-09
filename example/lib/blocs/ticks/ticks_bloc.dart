import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/tick/tick.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api_example/blocs/active_symbols/active_symbols_bloc.dart';

part 'ticks_event.dart';

part 'ticks_state.dart';

class TicksBloc extends Bloc<TicksEvent, TicksState> {
  TicksBloc(this.activeSymbolsBloc) {
    activeSymbolsBloc.listen((ActiveSymbolsState activeSymbolsState) async {
      if (activeSymbolsState is ActiveSymbolsLoaded) {
        add(SubscribeTicks(activeSymbolsState.selectedSymbol));
      }
    });
  }

  final ActiveSymbolsBloc activeSymbolsBloc;

  Tick _firstTick;

  @override
  TicksState get initialState => TicksLoading();

  @override
  Stream<TicksState> mapEventToState(
    TicksEvent event,
  ) async* {
    if (event is SubscribeTicks) {
      yield TicksLoading();

      await _unsubscribeTick();

      final Stream<Tick> ticksStream = _subscribeTick(event.selectedSymbol);

      _firstTick = await ticksStream.first;

      ticksStream.listen((Tick tick) => add(YieldTick(tick)));
    } else if (event is YieldTick) {
      yield TicksLoaded(event.tick);
    }
  }

  Stream<Tick> _subscribeTick(ActiveSymbol selectedSymbol) =>
      Tick.subscribeTick(
        TicksRequest(ticks: selectedSymbol.symbol),
      );

  Future<Forget> _unsubscribeTick() => _firstTick?.unsubscribeTick();

  @override
  Future<void> close() async => super.close();
}
