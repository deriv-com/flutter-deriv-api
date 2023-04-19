// ignore_for_file: deprecated_member_use

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/ticks_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

import '../active_symbols/active_symbols_bloc.dart';

part 'ticks_event.dart';
part 'ticks_state.dart';

/// TicksBloc
class TicksBloc extends Bloc<TicksEvent, TicksState> {
  /// Initializes
  TicksBloc(ActiveSymbolsBloc activeSymbolsBloc) : super(TicksLoading()) {
    activeSymbolsBloc.stream
        .listen((ActiveSymbolsState activeSymbolsState) async {
      if (activeSymbolsState is ActiveSymbolsLoaded) {
        add(SubscribeTicks(activeSymbolsState.selectedSymbol));
      }
    });

    on<SubscribeTicks>((SubscribeTicks event, Emitter<TicksState> emit) =>
        _handleSubscribeTicks(event, emit));

    on<YieldTick>((YieldTick event, Emitter<TicksState> emit) =>
        emit(TicksLoaded(event.tick?.tick)));

    on<YieldError>((YieldError event, Emitter<TicksState> emit) =>
        emit(TicksError(event.message)));
  }

  Future<void> _handleSubscribeTicks(
      SubscribeTicks event, Emitter<TicksState> emit) async {
    emit(TicksLoading());

    await _unsubscribeTick();

    _subscribeTick(event.selectedSymbol!)
        .handleError((dynamic error) => error is TickException
            ? add(YieldError(error.message))
            : add(YieldError(error.toString())))
        .listen((TicksResponse? tick) => add(YieldTick(tick)));
  }

  Stream<TicksResponse?> _subscribeTick(ActiveSymbolsItem selectedSymbol) =>
      TicksResponse.subscribeTick(
        TicksRequest(ticks: selectedSymbol.symbol),
      );

  Future<ForgetAllResponse> _unsubscribeTick() =>
      TicksResponse.unsubscribeAllTicks();

  @override
  Future<void> close() async {
    await _unsubscribeTick();

    await super.close();
  }
}
