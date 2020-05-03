import 'api_base_model.dart';

/// Range of allowed amount for transfer between accounts.
class TransferAmountModel extends APIBaseModel {
  /// Initializes
  TransferAmountModel({this.min, this.max});

  /// From Json
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

  /// Clones a new instance
  TransferAmountModel copyWith({
    double min,
    double max,
  }) =>
      TransferAmountModel(
        max: max ?? this.max,
        min: min ?? this.min,
      );
}
