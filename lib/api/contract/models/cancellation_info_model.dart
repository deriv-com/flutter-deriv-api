import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Contains information about contract cancellation option.
@immutable
class CancellationInfoModel {
  /// Initializes
  const CancellationInfoModel({
    this.askPrice,
    this.dateExpiry,
  });

  /// Generate an instance from JSON
  factory CancellationInfoModel.fromJson(Map<String, dynamic> json) =>
      CancellationInfoModel(
        askPrice: json['ask_price']?.toDouble(),
        dateExpiry: getDateTime(json['date_expiry']),
      );

  /// Ask price of contract cancellation option.
  final double? askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final DateTime? dateExpiry;

  /// Generate a copy of instance with given parameters
  CancellationInfoModel copyWith({
    double? askPrice,
    DateTime? dateExpiry,
  }) =>
      CancellationInfoModel(
        askPrice: askPrice ?? this.askPrice,
        dateExpiry: dateExpiry ?? this.dateExpiry,
      );

  /// Converts this instance to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'ask_price': askPrice,
        'date_expiry': dateExpiry,
      };

  @override
  bool operator ==(Object other) =>
      other is CancellationInfoModel && other.askPrice == askPrice;

  @override
  int get hashCode => super.hashCode;
}
