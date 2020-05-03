import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';
import 'open_contract_tick_info_model.dart';

/// Audit details for expired contract.
class AuditDetailModel extends APIBaseModel {
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
        allTicks: getListFromMap(
          json['all_ticks'],
          itemToTypeCallback: (dynamic item) =>
              OpenContractTickInfoModel.fromJson(item),
        ),
        contractEnd: getListFromMap(
          json['contract_end'],
          itemToTypeCallback: (dynamic item) =>
              OpenContractTickInfoModel.fromJson(item),
        ),
        contractStart: getListFromMap(
          json['contract_start'],
          itemToTypeCallback: (dynamic item) =>
              OpenContractTickInfoModel.fromJson(item),
        ),
      );

  /// Ticks for tick expiry contract from start time till expiry.
  final List<OpenContractTickInfoModel> allTicks;

  /// Ticks around contract end time.
  final List<OpenContractTickInfoModel> contractEnd;

  ///Ticks around contract start time.
  final List<OpenContractTickInfoModel> contractStart;
}
