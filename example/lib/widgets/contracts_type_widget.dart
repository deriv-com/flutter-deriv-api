import 'package:flutter/material.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contracts_type_dialog.dart';

class ContractsTypeWidget extends StatefulWidget {
  @override
  _ContractsTypeWidgetState createState() => _ContractsTypeWidgetState();
}

class _ContractsTypeWidgetState extends State<ContractsTypeWidget> {
  // ignore: close_sinks
  AvailableContractsBloc _availableContractsBloc;

  @override
  void initState() {
    _availableContractsBloc = BlocProvider.of<AvailableContractsBloc>(context);
    super.initState();
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
                  builder: (BuildContext context) => ContractsTypeDialog(
                        availableContractsBloc: _availableContractsBloc,
                      ));
            },
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: BlocBuilder<AvailableContractsBloc,
                          AvailableContractsState>(
                        bloc: _availableContractsBloc,
                        builder: (BuildContext context,
                            AvailableContractsState state) {
                          if (state is AvailableContractsLoaded) {
                            return Column(
                              children: <Widget>[
                                Text(
                                  '${state.contracts.contracts.length}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  'Available Contracts',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          } else if (state is AvailableContractsError) {
                            return Text(state.message);
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.keyboard_arrow_down)),
                )
              ],
            ),
          ),
        ),
      );
}
