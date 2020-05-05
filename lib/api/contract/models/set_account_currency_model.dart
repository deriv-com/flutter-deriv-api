import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Set account currency model class
class SetAccountCurrencyModel extends APIBaseModel {
  /// Initializes
  SetAccountCurrencyModel({
    this.succeeded,
  });

  /// Generates an instance from json
  factory SetAccountCurrencyModel.fromJson(Map<String, dynamic> json) =>
      SetAccountCurrencyModel(
        succeeded: getBool(json['set_account_currency']),
      );

  /// `true`: success, `false`: no change
  final bool succeeded;

  /// Creates copy of instance with given parameters
  SetAccountCurrencyModel copyWith({
    bool succeeded,
  }) =>
      SetAccountCurrencyModel(
        succeeded: succeeded ?? this.succeeded,
      );
}
