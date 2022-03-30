import 'package:flutter_deriv_api/api/contract/models/spot_price_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Update contract model class
abstract class UpdateContractModel extends APIBaseModel {
  /// Initializes
  UpdateContractModel({
    this.stopLoss,
    this.takeProfit,
  });

  /// The target spot price where the contract will be closed automatically at the loss specified by the user.
  final SpotPriceModel? stopLoss;

  /// The target spot price where the contract will be closed automatically at the profit specified by the user.
  final SpotPriceModel? takeProfit;
}
