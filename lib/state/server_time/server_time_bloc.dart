import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/common/server_time/exceptions/server_time_exception.dart';
import 'package:flutter_deriv_api/api/common/server_time/server_time.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

part 'server_time_event.dart';

part 'server_time_state.dart';

/// A Bloc for fetching server time
class ServerTimeBloc extends Bloc<ServerTimeEvent, ServerTimeState> {
  /// Initializes
  ServerTimeBloc(this._connectionBloc) {
    _connectionSubscription = _connectionBloc.listen((ConnectionState state) {
      if (state is Connected) {
        add(FetchServerTime());

        _serverTimeInterval = Timer.periodic(const Duration(seconds: 90),
            (Timer timer) => add(FetchServerTime()));
      } else {
        _serverTimeInterval?.cancel();
      }
    });
  }

  final ConnectionBloc _connectionBloc;

  StreamSubscription<ConnectionState> _connectionSubscription;

  Timer _serverTimeInterval;

  @override
  ServerTimeState get initialState => InitialServerTimeState();

  @override
  Stream<ServerTimeState> mapEventToState(ServerTimeEvent event) async* {
    if (event is FetchServerTime) {
      if (_connectionBloc.state is Connected) {
        try {
          final ServerTime serverTime =
              await ServerTime.fetchTime().timeout(const Duration(seconds: 30));

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
