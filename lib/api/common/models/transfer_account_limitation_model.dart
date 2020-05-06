import 'package:flutter_deriv_api/api/common/models/transfer_amount_model.dart';
import 'package:flutter_deriv_api/api/common/models/transfer_fee_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Fees and range of allowed amount for transfer between accounts with
/// different types of currencies.
class TransferAccountLimitationModel extends APIBaseModel {
  /// Initializes
  TransferAccountLimitationModel({this.fees, this.limits});

  /// Initializes from map
  factory TransferAccountLimitationModel.fromJson(Map<String, dynamic> json) =>
      TransferAccountLimitationModel(
        fees: getListFromMap(
          json['fees'].entries,
          itemToTypeCallback: (dynamic item) =>
              TransferFeeModel.fromJson(item.key, item.value),
        ),
        limits: getItemFromMap(
          json['limits'],
          itemToTypeCallback: (dynamic item) =>
              TransferAmountModel.fromJson(item),
        ),
      );

  /// The fee that applies for transfer between accounts with different types of currencies.
  final List<TransferFeeModel> fees;

  /// Range of allowed amount for transfer between accounts.
  final TransferAmountModel limits;

  /// Generate a copy of instance with given parameters
  TransferAccountLimitationModel copyWith({
    List<TransferFeeModel> fees,
    TransferAmountModel limits,
  }) =>
      TransferAccountLimitationModel(
        fees: fees ?? this.fees,
        limits: limits ?? this.limits,
      );
}
