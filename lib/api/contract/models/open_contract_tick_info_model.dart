import 'package:flutter_deriv_api/api/contract/models/open_contract_tick_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// ContractTimeInfo
class OpenContractTickInfoModel extends OpenContractTickModel {
  /// Initializes
  OpenContractTickInfoModel({
    this.flag,
    this.name,
    DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) : super(
          epoch: epoch,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Generate an instance from json
  factory OpenContractTickInfoModel.fromJson(Map<String, dynamic> json) =>
      OpenContractTickInfoModel(
        epoch: getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: json['tick'],
        tickDisplayValue: json['tick_display_value'],
      );

  /// A flag used to highlight the record in front-end applications
  final String flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String name;

  /// Generate a copy of instance with given parameters
  @override
  OpenContractTickInfoModel copyWith({
    DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) =>
      OpenContractTickInfoModel(
        epoch: epoch ?? this.epoch,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
