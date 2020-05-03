import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/api/models/rate_model.dart';

/// Exchange rates model class
abstract class ExchangeRatesModel extends APIBaseModel {
  /// Initializes
  ExchangeRatesModel({
    this.baseCurrency,
    this.date,
    this.rates,
  });

  /// Base currency
  final String baseCurrency;

  /// Date retrieval epoch time represented as an integer number
  final DateTime date;

  /// Rates of exchanging a unit of base currency into the target currencies
  final List<RateModel> rates;
}
