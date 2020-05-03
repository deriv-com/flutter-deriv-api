import 'base_model.dart';

/// The result of sell expired contract
class SellExpiredContractModel extends BaseModel {
  /// Initializes
  SellExpiredContractModel({this.count});

  /// From JSON
  factory SellExpiredContractModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      SellExpiredContractModel(
        count: json['count'],
      );

  /// The number of contracts that has been sold.
  final int count;

  /// Clones a new instance
  SellExpiredContractModel copyWith({
    int count
  }) =>
      SellExpiredContractModel(
        count: count ?? this.count,
      );
}
