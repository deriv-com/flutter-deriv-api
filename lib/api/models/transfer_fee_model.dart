import 'base_model.dart';

/// The fee that applies for transfer between accounts with different types of currencies.
class TransferFeeModel extends BaseModel {
  /// Initializes
  TransferFeeModel(this.code, this.value);

  /// From Json
  factory TransferFeeModel.fromJson(
    String code,
    dynamic item,
  ) =>
      TransferFeeModel(
        code,
        item.toDouble(),
      );

  /// code
  final String code;

  /// value
  final double value;

  /// Clones a new instance
  TransferFeeModel copyWith({
    String code,
    double value,
  }) =>
      TransferFeeModel(
        code ?? this.code,
        value ?? this.value,
      );
}
