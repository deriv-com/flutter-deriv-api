import 'base_model.dart';

/// Range of allowed amount for transfer between accounts.
class TransferAmountModel extends BaseModel {
  /// Initializes
  TransferAmountModel(this.min, this.max);

  /// From Json
  factory TransferAmountModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      TransferAmountModel(
        json['min'].toDouble(),
        json['max'].toDouble(),
      );

  /// Minimum allowed amount for transfer between accounts
  /// with different types of currencies.
  final double min;

  /// Maximum allowed amount for transfer between accounts
  /// with different types of currencies.
  final double max;

  /// Clones a new instance
  TransferAmountModel copyWith({
    double min,
    double max,
  }) =>
      TransferAmountModel(
        min ?? this.min,
        max ?? this.max,
      );
}
