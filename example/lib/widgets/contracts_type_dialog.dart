import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';

class ContractsTypeDialog extends StatelessWidget {
  const ContractsTypeDialog({Key key, this.availableContractsBloc})
      : super(key: key);

  final AvailableContractsBloc availableContractsBloc;

  @override
  Widget build(BuildContext context) => BlocBuilder(
        bloc: availableContractsBloc,
        builder: (BuildContext context, AvailableContractsState state) {
          if (state is AvailableContractsLoaded) {
            final ContractsForSymbol contractsForSymbol = state.contracts;

            return Material(
              child: ListView.builder(
                itemCount: contractsForSymbol.contracts.length,
                itemBuilder: (BuildContext context, int index) {
                  final ContractModel contract = contractsForSymbol.contracts[index];
                  return ListTile(
                    title: Text(
                      '${contract.contractDisplay}, ${contract.contractType}',
                    ),
                    subtitle: Text('${contract.contractCategory}'),
                  );
                }
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
