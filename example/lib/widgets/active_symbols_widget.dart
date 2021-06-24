import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api_example/blocs/active_symbols/active_symbols_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/ticks/ticks_bloc.dart';

import 'active_symbols_list_dialog.dart';

/// ActiveSymbolsWidget
class ActiveSymbolsWidget extends StatefulWidget {
  @override
  _ActiveSymbolsWidgetState createState() => _ActiveSymbolsWidgetState();
}

class _ActiveSymbolsWidgetState extends State<ActiveSymbolsWidget> {
  // ignore: close_sinks
  ActiveSymbolsBloc? _activeSymbolsBloc;
  TicksBloc? _ticksBloc;

  double? _lastTickValue = 0;

  @override
  void initState() {
    super.initState();

    _activeSymbolsBloc = BlocProvider.of<ActiveSymbolsBloc>(context)
      ..add(FetchActiveSymbols());
    _ticksBloc = TicksBloc(_activeSymbolsBloc!);
  }

  @override
  void dispose() {
    _ticksBloc!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          child: InkWell(
            onTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    BlocProvider<ActiveSymbolsBloc>.value(
                  value: _activeSymbolsBloc!,
                  child: ActiveSymbolsListDialog(),
                ),
              );
            },
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    // ignore: always_specify_types
                    child: BlocBuilder<ActiveSymbolsBloc, ActiveSymbolsState>(
                        bloc: _activeSymbolsBloc,
                        builder:
                            (BuildContext context, ActiveSymbolsState state) {
                          if (state is ActiveSymbolsLoaded) {
                            return Column(
                              children: <Widget>[
                                Text(
                                  '${state.selectedSymbol!.marketDisplayName}',
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '${state.selectedSymbol!.displayName}',
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          } else if (state is ActiveSymbolsError) {
                            return Text(state.message ?? 'An error occurred');
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: BlocBuilder<TicksBloc, TicksState>(
                              bloc: _ticksBloc,
                              builder:
                                  (BuildContext context, TicksState state) {
                                if (state is TicksLoaded) {
                                  final Color tickColor =
                                      state.tick!.ask! > _lastTickValue!
                                          ? Colors.green
                                          : state.tick!.ask == _lastTickValue
                                              ? Colors.black
                                              : Colors.red;

                                  _lastTickValue = state.tick!.ask;

                                  return Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      '${state.tick?.ask?.toStringAsFixed(5)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: tickColor,
                                      ),
                                    ),
                                  );
                                }

                                if (state is TicksError) {
                                  return Text(
                                    state.message!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  );
                                }
                                return const Text(
                                  '---',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 12),
                        const Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
