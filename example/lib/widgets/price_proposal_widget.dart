import 'package:flutter/material.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';
import 'package:flutter_deriv_api/api/contract/models/contract_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/price_proposal/price_proposal_bloc.dart';
import 'package:flutter_deriv_api_example/widgets/drop_down_menu.dart';

class PriceProposalWidget extends StatefulWidget {
  @override
  _PriceProposalWidgetState createState() => _PriceProposalWidgetState();
}

class _PriceProposalWidgetState extends State<PriceProposalWidget> {
  // ignore: close_sinks
  AvailableContractsBloc _availableContractsBloc;
  PriceProposalBloc _priceProposalBloc;

  @override
  void initState() {
    _availableContractsBloc = BlocProvider.of<AvailableContractsBloc>(context);
    _priceProposalBloc = PriceProposalBloc(_availableContractsBloc);
    super.initState();
  }

  @override
  void dispose() {
    _priceProposalBloc.close();
    super.dispose();
  }

  String _durationUnit = 's';
  int _duration = 10;
  String _basis = 'payout';

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          child: InkWell(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          BlocBuilder<AvailableContractsBloc,
                              AvailableContractsState>(
                            builder: (BuildContext context,
                                AvailableContractsState state) {
                              if (state is AvailableContractsLoaded) {
                                return Row(
                                  children: <Widget>[
                                    DropDownMenu<int>(
                                      title: 'Duration',
                                      items: const <int>[
                                        5,
                                        10,
                                        100,
                                        1000,
                                      ],
                                      selectedItem: _duration,
                                      onItemSelected: <int>(dynamic item) {
                                        _duration = item;
                                        _subscribeToPriceWithCurrentConfig(
                                          state.selectedContract,
                                        );
                                      },
                                    ),
                                    DropDownMenu<String>(
                                      title: 'Duration Unit',
                                      items: const <String>[
                                        'd',
                                        'm',
                                        's',
                                        'h',
                                        't'
                                      ],
                                      selectedItem: _durationUnit,
                                      onItemSelected: <String>(dynamic item) {
                                        _durationUnit = item;
                                        _subscribeToPriceWithCurrentConfig(
                                          state.selectedContract,
                                        );
                                      },
                                    ),
                                    DropDownMenu<String>(
                                      title: 'Basis',
                                      items: const <String>[
                                        'payout',
                                        'stake',
                                      ],
                                      selectedItem: _basis,
                                      onItemSelected: <String>(dynamic item) {
                                        _durationUnit = item;
                                        _subscribeToPriceWithCurrentConfig(
                                          state.selectedContract,
                                        );
                                      },
                                    ),
                                  ],
                                );
                              }
                              return Container();
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          BlocBuilder<PriceProposalBloc, PriceProposalState>(
                            bloc: _priceProposalBloc,
                            builder: (BuildContext context,
                                PriceProposalState state) {
                              if (state is PriceProposalLoaded) {
                                return Column(
                                  children: <Widget>[
                                    Text(
                                      '${state.proposal.payout} ${state.proposal.askPrice} ${state.proposal.spotTime}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                );
                              } else if (state is PriceProposalError) {
                                return Text(state.message);
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void _subscribeToPriceWithCurrentConfig(ContractModel contract) {
    _priceProposalBloc.add(
      SubscribeProposal(
        contract,
        durationUnit: _durationUnit,
        duration: _duration,
        basis: _basis,
      ),
    );
  }
}
