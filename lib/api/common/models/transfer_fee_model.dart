import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// The fee that applies for transfer between accounts with different types of currencies.
class TransferFeeModel extends APIBaseModel {
  /// Initializes
  TransferFeeModel({this.code, this.value});

  /// Generate an instance from JSON
  factory TransferFeeModel.fromJson(
    String? code,
    dynamic item,
  ) =>
      TransferFeeModel(
        code: code,
        value: item?.toDouble(),
      );

  /// code
  final String? code;

  /// value
  final double? value;

  /// Generate a copy of instance with given parameters
  TransferFeeModel copyWith({
    String? code,
    double? value,
  }) =>
      TransferFeeModel(
        code: code ?? this.code,
        value: value ?? this.value,
      );
}
