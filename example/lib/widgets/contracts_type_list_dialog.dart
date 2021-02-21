import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/response/contracts_for_receive_result.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';

/// ContractsTypeListDialog
class ContractsTypeListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AvailableContractsBloc, AvailableContractsState>(
        builder: (BuildContext context, AvailableContractsState state) {
          if (state is AvailableContractsLoaded) {
            final ContractsFor contractsForSymbol = state.contracts;

            return Material(
              child: ListView.builder(
                  itemCount: contractsForSymbol.available.length,
                  itemBuilder: (BuildContext context, int index) {
                    final AvailableItem contract =
                        contractsForSymbol.available[index];
                    return ListTile(
                      title: Text(
                        '${contract.contractsDisplay}, ${contract.contractType}',
                      ),
                      subtitle: Text('${contract.contractCategory}'),
                      onTap: () {
                        BlocProvider.of<AvailableContractsBloc>(context)
                            .add(SelectContract(index));
                        Navigator.of(context).pop();
                      },
                    );
                  }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
