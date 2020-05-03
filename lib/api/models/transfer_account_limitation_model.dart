import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';
import 'transfer_amount_model.dart';
import 'transfer_fee_model.dart';

/// Fees and range of allowed amount for transfer between accounts with
/// different types of currencies.
class TransferAccountLimitationModel extends APIBaseModel {
  /// Initializes
  TransferAccountLimitationModel({this.fees, this.limits});

  /// Initializes from map
  factory TransferAccountLimitationModel.fromJson(Map<String, dynamic> json) =>
      TransferAccountLimitationModel(
        fees: json['fees'] == null || json['fees'].isEmpty
            ? null
            : json['fees']
                .entries
                .map<TransferFeeModel>((MapEntry<String, dynamic> entry) =>
                    TransferFeeModel.fromJson(entry.key, entry.value))
                .toList(),
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

  /// Clones a new instance
  TransferAccountLimitationModel copyWith({
    List<TransferFeeModel> fees,
    TransferAmountModel limits,
  }) =>
      TransferAccountLimitationModel(
        fees: fees ?? this.fees,
        limits: limits ?? this.limits,
      );
}
