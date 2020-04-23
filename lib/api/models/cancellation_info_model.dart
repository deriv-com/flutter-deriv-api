import 'package:flutter_deriv_api/utils/helpers.dart';

/// Contains information about contract cancellation option.
class CancellationInfoModel {
  /// Initializes
  CancellationInfoModel(this.askPrice, this.dateExpiry);

  /// From Json
  factory CancellationInfoModel.fromJson(Map<String, dynamic> json) =>
      CancellationInfoModel(
        json['ask_price'],
        json['date_expiry'] == null ? null : getDateTime(json['date_expiry']),
      );

  /// Ask price of contract cancellation option.
  final double askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final DateTime dateExpiry;

  /// Clones a new instance
  CancellationInfoModel copyWith({
    double askPrice,
    DateTime dateExpiry,
  }) =>
      CancellationInfoModel(
        askPrice ?? this.askPrice,
        dateExpiry ?? this.dateExpiry,
      );
}
