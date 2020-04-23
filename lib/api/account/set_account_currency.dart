import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/api/models/set_account_currency_model.dart';

/// Set account currency class
class SetAccountCurrency extends SetAccountCurrencyModel {
  /// Class constructor
  SetAccountCurrency({
    bool setAccountCurrency,
  }) : super(
          setAccountCurrency: setAccountCurrency,
        );

  /// Creates instance from json
  factory SetAccountCurrency.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrency(
        setAccountCurrency: getBool(json['set_account_currency']),
      );

  /// Creates copy of instance with given parameters
  SetAccountCurrency copyWith({
    bool setAccountCurrency,
  }) =>
      SetAccountCurrency(
        setAccountCurrency: setAccountCurrency ?? this.setAccountCurrency,
      );
}
