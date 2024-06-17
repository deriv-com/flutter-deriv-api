import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/active_symbols/active_symbols_bloc.dart';
import 'package:flutter_deriv_api_example/blocs/available_contracts/available_contracts_bloc.dart';
import 'package:flutter_deriv_api_example/widgets/active_symbols_widget.dart';
import 'package:flutter_deriv_api_example/widgets/contracts_type_widget.dart';
import 'package:flutter_deriv_api_example/widgets/exchange_rate_widget.dart';
import 'package:flutter_deriv_api_example/widgets/price_proposal_widget.dart';

/// MainPage
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ActiveSymbolsBloc _activeSymbolsBloc;
  late AvailableContractsBloc _availableContractsBloc;

  @override
  void initState() {
    super.initState();

    _activeSymbolsBloc = ActiveSymbolsBloc();
    _availableContractsBloc = AvailableContractsBloc(_activeSymbolsBloc);
  }

  @override
  void dispose() {
    _availableContractsBloc.close();
    _activeSymbolsBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<ActiveSymbolsBloc>.value(
            value: _activeSymbolsBloc,
          ),
          BlocProvider<AvailableContractsBloc>.value(
            value: _availableContractsBloc,
          ),
        ],
        child: Column(
          children: <Widget>[
            Expanded(child: ActiveSymbolsWidget()),
            Expanded(child: ContractsTypeWidget()),
            Expanded(flex: 2, child: PriceProposalWidget()),
            const Expanded(flex: 2, child: ExchangeRateWidget()),
          ],
        ),
      );
}
