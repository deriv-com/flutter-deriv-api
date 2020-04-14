import 'package:flutter_deriv_api/helpers.dart';

/// Contains information about contract cancellation option.
class Cancellation {
  /// Initializes
  Cancellation(this.askPrice, this.dateExpiry);

  /// From Json
  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        json['ask_price'],
        json['date_expiry'] != null ? getDateTime(json['date_expiry']) : null,
      );

  /// Ask price of contract cancellation option.
  final double askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final DateTime dateExpiry;

  /// Clones a new instance
  Cancellation copyWith({
    double askPrice,
    DateTime dateExpiry,
  }) =>
      Cancellation(
        askPrice ?? this.askPrice,
        dateExpiry ?? this.dateExpiry,
      );
}
