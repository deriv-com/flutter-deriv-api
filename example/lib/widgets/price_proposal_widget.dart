import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/price_proposal/price_proposal_bloc.dart';
import 'package:flutter_deriv_api_example/widgets/drop_down_menu.dart';
import 'package:flutter_deriv_api/api/response/contracts_for_response_result.dart';

/// PriceProposalWidget
class PriceProposalWidget extends StatefulWidget {
  @override
  _PriceProposalWidgetState createState() => _PriceProposalWidgetState();
}

class _PriceProposalWidgetState extends State<PriceProposalWidget> {
  // ignore: close_sinks
  late AvailableContractsBloc _availableContractsBloc;
  PriceProposalBloc? _priceProposalBloc;

  @override
  void initState() {
    super.initState();

    _availableContractsBloc = BlocProvider.of<AvailableContractsBloc>(context);
    _priceProposalBloc = PriceProposalBloc(_availableContractsBloc);
  }

  // Duration units are hardcoded in this example.
  // Available durations and Duration units can be retrieved via fetching available contracts
  static const List<String> _durationUnits = <String>['t', 's', 'm', 'h', 'd'];
  String _durationUnit = _durationUnits.first;

  static const List<int> _durations = <int>[5, 10, 100, 1000];
  int _duration = _durations.first;

  static const List<String> _basisOptions = <String>['payout', 'stake'];
  String _basis = _basisOptions.first;

  static const List<double> _amounts = <double>[5, 10, 100, 1000];
  double _amount = _amounts.first;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 4,
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        _buildProposalConfigMenus(),
                        const SizedBox(height: 24),
                        _buildProposalResult(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  BlocBuilder<AvailableContractsBloc, AvailableContractsState>
      _buildProposalConfigMenus() =>
          BlocBuilder<AvailableContractsBloc, AvailableContractsState>(
            builder: (BuildContext context, AvailableContractsState state) {
              if (state is AvailableContractsLoaded) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        DropDownMenu<int>(
                          title: 'Duration',
                          items: _durations,
                          initialItem: _duration,
                          onItemSelected: <int>(dynamic item) {
                            _duration = item;
                            _subscribeToPriceWithCurrentConfig(
                              state.selectedContract,
                            );
                          },
                        ),
                        DropDownMenu<String>(
                          title: 'Duration Unit',
                          items: _durationUnits,
                          initialItem: _durationUnit,
                          onItemSelected: <String>(dynamic item) {
                            _durationUnit = item;
                            _subscribeToPriceWithCurrentConfig(
                              state.selectedContract,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        DropDownMenu<String>(
                          title: 'Basis',
                          items: _basisOptions,
                          initialItem: _basis,
                          onItemSelected: <String>(dynamic item) {
                            _basis = item;
                            _subscribeToPriceWithCurrentConfig(
                              state.selectedContract,
                            );
                          },
                        ),
                        DropDownMenu<double>(
                          title: 'Amount',
                          items: _amounts,
                          initialItem: _amount,
                          onItemSelected: <double>(dynamic item) {
                            _amount = item;
                            _subscribeToPriceWithCurrentConfig(
                              state.selectedContract,
                            );
                          },
                        ),
                      ],
                    )
                  ],
                );
              }
              return Container();
            },
          );

  BlocBuilder<PriceProposalBloc, PriceProposalState> _buildProposalResult() =>
      BlocBuilder<PriceProposalBloc, PriceProposalState>(
        bloc: _priceProposalBloc,
        builder: (BuildContext context, PriceProposalState state) {
          if (state is PriceProposalLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildEntry(
                  'payout',
                  '${state.proposal!.payout}',
                ),
                _buildEntry(
                  'askPrice',
                  '${state.proposal!.askPrice}',
                ),
                _buildEntry(
                  'spot',
                  '${state.proposal!.spot}',
                ),
              ],
            );
          } else if (state is PriceProposalError) {
            return Text(state.message ?? 'An error occurred');
          } else {
            return const CircularProgressIndicator();
          }
        },
      );

  Widget _buildEntry(String title, String value) => Column(
        children: <Widget>[
          Text(title),
          const SizedBox(
            height: 8,
          ),
          Text(value, style: const TextStyle(fontSize: 18))
        ],
      );

  void _subscribeToPriceWithCurrentConfig(AvailableItem? contract) {
    _priceProposalBloc?.add(
      SubscribeProposal(
        contract,
        durationUnit: _durationUnit,
        duration: _duration,
        basis: _basis,
        amount: _amount,
      ),
    );
  }

  @override
  void dispose() {
    _priceProposalBloc?.close();

    super.dispose();
  }
}
