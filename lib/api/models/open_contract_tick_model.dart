import 'package:flutter_deriv_api/utils/helpers.dart';
import 'base_model.dart';

/// Tick of entry to end time.
class OpenContractTickModel extends BaseModel {
  /// Initializes
  OpenContractTickModel({
    this.epoch,
    this.tick,
    this.tickDisplayValue,
  });

  /// From JSON
  factory OpenContractTickModel.fromJson(Map<String, dynamic> json) =>
      OpenContractTickModel(
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
