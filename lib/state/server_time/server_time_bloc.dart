import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/time_response_result.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

part 'server_time_event.dart';
part 'server_time_state.dart';

/// A Bloc for fetching server time
class ServerTimeBloc extends Bloc<ServerTimeEvent, ServerTimeState> {
  /// Initializes
  ServerTimeBloc(this._connectionCubit) : super(InitialServerTime()) {
    _connectionSubscription =
        _connectionCubit.stream.listen((ConnectionState state) {
      if (state is ConnectionConnectedState) {
        add(FetchServerTime());

        _serverTimeInterval = Timer.periodic(const Duration(seconds: 90),
            (Timer timer) => add(FetchServerTime()));
      } else {
        _serverTimeInterval?.cancel();
      }
    });
  }

  final ConnectionCubit _connectionCubit;

  StreamSubscription<ConnectionState>? _connectionSubscription;

  Timer? _serverTimeInterval;

  @override
  Stream<ServerTimeState> mapEventToState(ServerTimeEvent event) async* {
    if (event is FetchServerTime) {
      if (_connectionCubit.state is ConnectionConnectedState) {
        try {
          final TimeResponse serverTime = await TimeResponse.fetchTime()
              .timeout(const Duration(seconds: 30));

          yield ServerTimeFetched(serverTime: serverTime.time);
        } on ServerTimeException catch (e) {
          yield ServerTimeError(e.message);
        } on Exception catch (e) {
          yield ServerTimeError(e.toString());
        }
      }
    }
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();

    return super.close();
  }
}
