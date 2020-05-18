import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Set account currency model class
abstract class SetAccountCurrencyModel extends APIBaseModel {
  /// Initializes
  SetAccountCurrencyModel({
    this.succeeded,
  });

  /// `true`: success, `false`: no change
  final bool succeeded;
}
