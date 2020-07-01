import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api_example/blocs/active_symbols/active_symbols_bloc.dart';

class ActiveSymbolsListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ActiveSymbolsBloc, ActiveSymbolsState>(
        builder: (BuildContext context, ActiveSymbolsState state) {
          if (state is ActiveSymbolsLoaded) {
            return Material(
              child: ListView.builder(
                itemCount: state.activeSymbols.length,
                itemBuilder: (BuildContext context, int index) {
                  final ActiveSymbol activeSymbol = state.activeSymbols[index];

                  return ListTile(
                    title: Text(activeSymbol.displayName),
                    onTap: () {
                      BlocProvider.of<ActiveSymbolsBloc>(context)
                          .add(SelectActiveSymbol(index));
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
