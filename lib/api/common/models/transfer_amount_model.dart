import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Range of allowed amount for transfer between accounts.
class TransferAmountModel extends APIBaseModel {
  /// Initializes
  TransferAmountModel({this.min, this.max});

  /// Generates an instance from json
  factory TransferAmountModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      TransferAmountModel(
        max: json['max']?.toDouble(),
        min: json['min']?.toDouble(),
      );

  /// Maximum allowed amount for transfer between accounts
  /// with different types of currencies.
  final double max;

  /// Minimum allowed amount for transfer between accounts
  /// with different types of currencies.
  final double min;

  /// Generates a copy of instance with given parameters
  TransferAmountModel copyWith({
    double min,
    double max,
  }) =>
      TransferAmountModel(
        max: max ?? this.max,
        min: min ?? this.min,
      );
}
