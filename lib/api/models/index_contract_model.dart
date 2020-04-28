import 'base_model.dart';

/// Index of contract type code
const int contractTypeCodeIndex = 0;

/// Index of contract type name
const int contractTypeNameIndex = 1;

/// Index of max duration
const int maxDurationIndex = 3;

/// Index of min duration
const int minDurationIndex = 2;

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
        contractTypeCode: jsonList[contractTypeCodeIndex],
        contractTypeName: jsonList[contractTypeNameIndex],
        maxDuration: jsonList[maxDurationIndex],
        minDuration: jsonList[minDurationIndex],
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
