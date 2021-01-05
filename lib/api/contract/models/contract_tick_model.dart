import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Tick of entry to end time.
class ContractTickModel extends APIBaseModel {
  /// Initializes
  ContractTickModel({
    this.epoch,
    this.tick,
    this.tickDisplayValue,
  });

  /// Generates an instance from JSON
  factory ContractTickModel.fromJson(Map<String, dynamic> json) =>
      ContractTickModel(
        epoch: getDateTime(json['epoch']),
        tick: json['tick'],
        tickDisplayValue: json['tick_display_value'],
      );

  /// Epoch time of a tick or the contract start or end time.
  final DateTime epoch;

  /// The spot value at the given epoch.
  final double tick;

  /// The spot value with the correct precision at the given epoch.
  final String tickDisplayValue;

  /// Generates a copy of instance with given parameters
  ContractTickModel copyWith({
    DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) =>
      ContractTickModel(
        epoch: epoch ?? this.epoch,
        tick: tick ?? tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
