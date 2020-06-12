import 'package:flutter_deriv_api/api/contract/models/contract_tick_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// ContractTimeInfo
class ContractTickInfoModel extends ContractTickModel {
  /// Initializes
  ContractTickInfoModel({
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

  /// Generates an instance from JSON
  factory ContractTickInfoModel.fromJson(Map<String, dynamic> json) =>
      ContractTickInfoModel(
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

  /// Generates a copy of instance with given parameters
  @override
  ContractTickInfoModel copyWith({
    DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) =>
      ContractTickInfoModel(
        epoch: epoch ?? this.epoch,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
