/// Contains information about contract cancellation option.
class Cancellation {
  /// Initializes
  Cancellation(this.askPrice, this.dateExpiry);

  /// From Json
  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        json['ask_price'],
        json['date_expiry'],
      );

  /// Ask price of contract cancellation option.
  final double askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final int dateExpiry;

  /// Clones a new instance
  Cancellation copyWith({
    double askPrice,
    int dateExpiry,
  }) =>
      Cancellation(
        askPrice ?? this.askPrice,
        dateExpiry ?? this.dateExpiry,
      );
}
