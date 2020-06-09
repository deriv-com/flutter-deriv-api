import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/active_symbols/active_symbols_bloc.dart';

import 'active_symbols_list_dialog.dart';

class ActiveSymbolsWidget extends StatefulWidget {
  @override
  _ActiveSymbolsWidgetState createState() => _ActiveSymbolsWidgetState();
}

class _ActiveSymbolsWidgetState extends State<ActiveSymbolsWidget> {
  ActiveSymbolsBloc _activeSymbolsBloc;

  @override
  void initState() {
    super.initState();
    _activeSymbolsBloc = BlocProvider.of<ActiveSymbolsBloc>(context)
      ..add(FetchActiveSymbols());
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
                builder: (BuildContext context) => ActiveSymbolsListDialog(
                  activeSymbolsBloc: _activeSymbolsBloc,
                ),
              );
            },
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    // ignore: always_specify_types
                    child: BlocBuilder(
                        bloc: _activeSymbolsBloc,
                        builder:
                            (BuildContext context, ActiveSymbolsState state) {
                          if (state is ActiveSymbolsLoaded) {
                            return Column(
                              children: <Widget>[
                                Text(
                                  '${state.selectedSymbol.marketDisplayName}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '${state.selectedSymbol.displayName}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
//                Align(
//                  alignment: Alignment.bottomRight,
//                  child: Padding(
//                    padding: const EdgeInsets.all(2.0),
//                    child: Row(
//                      mainAxisSize: MainAxisSize.min,
//                      children: <Widget>[
//                        Flexible(
//                          child: StreamBuilder(
//                              stream: tradeScreenViewModel
//                                  .symbolsViewModel.tickStream,
//                              builder: (context,
//                                  AsyncSnapshot<TickStreamResponse> snapshot) {
//                                if (snapshot.hasData &&
//                                    snapshot.data.error == null) {
//                                  Color bgColor;
//
//                                  if (snapshot.data.tick.ask >=
//                                      tickStreamLastValue) {
//                                    bgColor = Colors.lightGreen;
//                                  } else {
//                                    bgColor = Colors.redAccent;
//                                  }
//
//                                  tickStreamLastValue = snapshot.data.tick?.ask;
//
//                                  return Container(
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(4),
//                                        color: bgColor,
//                                      ),
//                                      child: Padding(
//                                        padding: const EdgeInsets.all(2.0),
//                                        child: snapshot.data.error == null
//                                            ? Text(
//                                                '${snapshot.data.tick?.ask?.toStringAsFixed(5)}')
//                                            : Text(
//                                                '${snapshot.data.error.message}',
//                                                style: const TextStyle(
//                                                  fontSize: 9,
//                                                ),
//                                              ),
//                                      ));
//                                }
//                                return const Text('...');
//                              }),
//                        ),
//                        Icon(Icons.keyboard_arrow_down)
//                      ],
//                    ),
//                  ),
//                ),
//                Align(
//                  alignment: Alignment.topLeft,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: StreamBuilder(
//                        stream:
//                            tradeScreenViewModel.symbolsViewModel.tickStream,
//                        builder: (context,
//                            AsyncSnapshot<TickStreamResponse> snapshot) {
//                          if (snapshot.hasData && snapshot.data.error == null) {
//                            tickStreamChartValues.add(snapshot.data.tick?.ask);
//
//                            if (tickStreamChartValues.length > 15) {
//                              tickStreamChartValues.removeFirst();
//                            }
//
//                            return Container(
//                              width: 30,
//                              height: 30,
//                              child: Sparkline(
//                                data: tickStreamChartValues.toList(),
//                                pointsMode: PointsMode.last,
//                                pointSize: 2.0,
//                                pointColor: Colors.amber,
//                              ),
//                            );
//                          }
//                          return const Text('...');
//                        }),
//                  ),
//                )
              ],
            ),
          ),
        ),
      );
}
