import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Tick of entry to end time.
class OpenContractTickModel extends BaseModel {
  /// Initializes
  OpenContractTickModel({
    this.epoch,
    this.tick,
    this.tickDisplayValue,
  });

  /// From JSON
  factory OpenContractTickModel.fromJson(Map<String, dynamic> json) => OpenContractTickModel(
        epoch: json['epoch'] == null ? null : getDateTime(json['epoch']),
        tick: json['tick'],
        tickDisplayValue: json['tick_display_value'],
      );

  /// Epoch time of a tick or the contract start or end time.
  final DateTime epoch;

  /// The spot value at the given epoch.
  final double tick;

  /// The spot value with the correct precision at the given epoch.
  final String tickDisplayValue;

  /// Clones a new instance
  OpenContractTickModel copyWith({
    DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) =>
      OpenContractTickModel(
        epoch: epoch ?? this.epoch,
        tick: tick ?? tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}

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

  /// From JSON
  factory OpenContractTickInfoModel.fromJson(Map<String, dynamic> json) =>
      OpenContractTickInfoModel(
        epoch: json['epoch'] == null ? null : getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: json['tick'],
        tickDisplayValue: json['tick_display_value'],
      );

  /// A flag used to highlight the record in front-end applications
  final String flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String name;

  /// Clones a new instance
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
