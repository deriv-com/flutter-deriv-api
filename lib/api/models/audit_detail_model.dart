import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/tick_model.dart';

/// Audit details for expired contract.
class AuditDetailModel extends BaseModel {
  /// Initializes
  AuditDetailModel({
    this.allTicks,
    this.contractEnd,
    this.contractStart,
  });

  /// From JSON
  factory AuditDetailModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AuditDetailModel(
        allTicks: json['all_ticks'] == null
            ? null
            : json['all_ticks']
                .map<ContractTickInfoModel>(
                    (dynamic entry) => ContractTickInfoModel.fromJson(entry))
                .toList(),
        contractEnd: json['contract_end'] == null
            ? null
            : json['contract_end']
                .map<ContractTickInfoModel>(
                    (dynamic entry) => ContractTickInfoModel.fromJson(entry))
                .toList(),
        contractStart: json['contract_start'] == null
            ? null
            : json['contract_start']
                .map<ContractTickInfoModel>(
                    (dynamic entry) => ContractTickInfoModel.fromJson(entry))
                .toList(),
      );

  /// Ticks for tick expiry contract from start time till expiry.
  final List<ContractTickInfoModel> allTicks;

  /// Ticks around contract end time.
  final List<ContractTickInfoModel> contractEnd;

  ///Ticks around contract start time.
  final List<ContractTickInfoModel> contractStart;
}
