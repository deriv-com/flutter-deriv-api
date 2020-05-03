import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Set account currency model class
abstract class SetAccountCurrencyModel extends BaseModel {
  /// Initializes
  SetAccountCurrencyModel({
    this.setAccountCurrency,
  });

  /// `true`: success, `false`: no change
  final bool setAccountCurrency;
}
