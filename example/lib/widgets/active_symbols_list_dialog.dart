import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/active_symbols/active_symbols_bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';

class ActiveSymbolsListDialog extends StatelessWidget {
  const ActiveSymbolsListDialog({Key key, this.activeSymbolsBloc})
      : super(key: key);
  final ActiveSymbolsBloc activeSymbolsBloc;

  @override
  Widget build(BuildContext context) => BlocBuilder(
        bloc: activeSymbolsBloc,
        builder: (BuildContext context, ActiveSymbolsState state) {
          if (state is ActiveSymbolsLoaded) {
            return Material(
              child: ListView.builder(
                itemCount: state.activeSymbols.length,
                itemBuilder: (BuildContext context, int index) {
                  final ActiveSymbol aS = state.activeSymbols[index];

                  return ListTile(
                    title: Text(aS.displayName),
                    onTap: () {
                      activeSymbolsBloc.add(SelectActiveSymbols(index));
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
