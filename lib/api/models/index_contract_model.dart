import 'base_model.dart';

/// Asset index contract model class
class IndexContractModel extends BaseModel {
  /// Initializes
  IndexContractModel({
    this.contractTypeCode,
    this.contractTypeName,
    this.maxDuration,
    this.minDuration,
  });

  /// Generates an instance from JSON
  factory IndexContractModel.fromJson(
    List<dynamic> jsonList,
  ) =>
      IndexContractModel(
        contractTypeCode: jsonList[0],
        contractTypeName: jsonList[1],
        maxDuration: jsonList[3],
        minDuration: jsonList[2],
      );

  /// Contract type code
  final String contractTypeCode;

  /// Contract type display name
  final String contractTypeName;

  /// Max duration available for this contract
  final String maxDuration;

  /// Min duration available for this contract
  final String minDuration;

  /// Creates a copy of this instance
  IndexContractModel copyWith({
    String contractTypeCode,
    String contractTypeName,
    String maxDuration,
    String minDuration,
  }) =>
      IndexContractModel(
        contractTypeCode: contractTypeCode ?? this.contractTypeCode,
        contractTypeName: contractTypeName ?? this.contractTypeName,
        maxDuration: maxDuration ?? this.maxDuration,
        minDuration: minDuration ?? this.minDuration,
      );
}
