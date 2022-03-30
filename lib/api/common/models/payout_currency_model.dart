import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Payout currency model class
abstract class PayoutCurrencyModel extends APIBaseModel {
  /// Initializes
  PayoutCurrencyModel({this.currency});

  /// Currency symbol
  final String? currency;
}
