import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_deriv_api/api/response/exchange_rates_response_result.dart';
import 'package:flutter_deriv_api/api/response/exchange_rates_response_extended.dart';
import 'package:flutter_deriv_api/basic_api/generated/exchange_rates_send.dart';

/// Test widget for the exchange rates for BTC -> USD.
class ExchangeRateWidget extends StatefulWidget {
  /// Test widget for exchange rates for BTC -> USD
  const ExchangeRateWidget({super.key});

  @override
  State<ExchangeRateWidget> createState() => _ExchangeRateWidgetState();
}

class _ExchangeRateWidgetState extends State<ExchangeRateWidget> {
  double value = 0;

  bool isSubscribed = false;
  int exchangeUpdateTime = 0;
  String subscriptionId = '';

  Timer? _refreshingTimer;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () =>
                isSubscribed ? _unsubscribe() : _subscribeUSDtoBTC(),
            child: isSubscribed
                ? const Text('Unsubscribe')
                : const Text('Subscribe to exchange rate'),
          ),
          const Text('USD:'),
          Text(value.toString()),
          const SizedBox(height: 12),
          const SizedBox(height: 12),
          Text(
            'Last updated after: ${exchangeUpdateTime.toStringAsFixed(2)} seconds',
          )
        ],
      );

  Future<void> _subscribeUSDtoBTC() async {
    final Stream<ExchangeRatesResponse?> ratesStream =
        ExchangeRatesResponseExtended.subscribeToExchangeRates(
            const ExchangeRatesRequest(
      baseCurrency: 'BTC',
      targetCurrency: 'USD',
      subscribe: true,
    ));

    // ignore: cascade_invocations
    ratesStream.listen((ExchangeRatesResponse? response) {
      setState(() {
        subscriptionId = response!.subscription!.id;
        isSubscribed = true;
        value = response.exchangeRates!.rates!['USD'] as double;
        _resetTimer();
      });
    });
  }

  void _resetTimer() {
    _refreshingTimer?.cancel();

    _refreshingTimer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        exchangeUpdateTime = timer.tick;
      },
    );
  }

  Future<void> _unsubscribe() async {
    try {
      final bool $ =
          await ExchangeRatesResponseExtended.unsubscribeFromExchangeRates(
              subscriptionId);
      $.toString();
      _refreshingTimer?.cancel();
    } on Exception catch (e) {
      log(e.toString());
    }
    setState(() {
      isSubscribed = false;
    });
  }
}
