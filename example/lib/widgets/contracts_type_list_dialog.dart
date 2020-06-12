import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';

class ContractsTypeListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AvailableContractsBloc, AvailableContractsState>(
        builder: (BuildContext context, AvailableContractsState state) {
          if (state is AvailableContractsLoaded) {
            final ContractsForSymbol contractsForSymbol = state.contracts;

            return Material(
              child: ListView.builder(
                  itemCount: contractsForSymbol.availableContracts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final AvailableContractModel contract =
                        contractsForSymbol.availableContracts[index];
                    return ListTile(
                      title: Text(
                        '${contract.contractDisplay}, ${contract.contractType}',
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
