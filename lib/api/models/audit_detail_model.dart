import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/open_contract_tick_model.dart';

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
                .map<OpenContractTickInfoModel>(
                    (dynamic entry) => OpenContractTickInfoModel.fromJson(entry))
                .toList(),
        contractEnd: json['contract_end'] == null
            ? null
            : json['contract_end']
                .map<OpenContractTickInfoModel>(
                    (dynamic entry) => OpenContractTickInfoModel.fromJson(entry))
                .toList(),
        contractStart: json['contract_start'] == null
            ? null
            : json['contract_start']
                .map<OpenContractTickInfoModel>(
                    (dynamic entry) => OpenContractTickInfoModel.fromJson(entry))
                .toList(),
      );

  /// Ticks for tick expiry contract from start time till expiry.
  final List<OpenContractTickInfoModel> allTicks;

  /// Ticks around contract end time.
  final List<OpenContractTickInfoModel> contractEnd;

  ///Ticks around contract start time.
  final List<OpenContractTickInfoModel> contractStart;
}
