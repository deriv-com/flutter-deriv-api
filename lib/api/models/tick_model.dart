import 'package:flutter_deriv_api/utils/helpers.dart';
import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Tick of entry to end time.
class TickModel extends BaseModel {
  /// Initializes
  TickModel({
    this.epoch,
    this.tick,
    this.tickDisplayValue,
  });

  /// From JSON
  factory TickModel.fromJson(Map<String, dynamic> json) => TickModel(
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
  TickModel copyWith({
    DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) =>
      TickModel(
        epoch: epoch ?? this.epoch,
        tick: tick ?? tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}

/// ContractTimeInfo
class ContractTickInfoModel extends TickModel {
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

  /// From JSON
  factory ContractTickInfoModel.fromJson(Map<String, dynamic> json) =>
      ContractTickInfoModel(
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
