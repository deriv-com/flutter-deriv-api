import 'package:flutter_deriv_api/api/contract/models/contract_tick_info_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Audit details for expired contract.
class AuditDetailModel extends APIBaseModel {
  /// Initializes
  AuditDetailModel({
    this.allTicks,
    this.contractEnd,
    this.contractStart,
  });

  /// Generate an instance from JSON
  factory AuditDetailModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AuditDetailModel(
        allTicks: getListFromMap(
          json['all_ticks'],
          itemToTypeCallback: (dynamic item) =>
              ContractTickInfoModel.fromJson(item),
        ),
        contractEnd: getListFromMap(
          json['contract_end'],
          itemToTypeCallback: (dynamic item) =>
              ContractTickInfoModel.fromJson(item),
        ),
        contractStart: getListFromMap(
          json['contract_start'],
          itemToTypeCallback: (dynamic item) =>
              ContractTickInfoModel.fromJson(item),
        ),
      );

  /// Ticks for tick expiry contract from start time till expiry.
  final List<ContractTickInfoModel> allTicks;

  /// Ticks around contract end time.
  final List<ContractTickInfoModel> contractEnd;

  ///Ticks around contract start time.
  final List<ContractTickInfoModel> contractStart;
}
