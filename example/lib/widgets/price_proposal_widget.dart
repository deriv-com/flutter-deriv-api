import 'package:flutter/material.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/price_proposal/price_proposal_bloc.dart';

import 'contracts_type_list_dialog.dart';

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
                      child: BlocBuilder<PriceProposalBloc, PriceProposalState>(
                        bloc: _priceProposalBloc,
                        builder:
                            (BuildContext context, PriceProposalState state) {
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
