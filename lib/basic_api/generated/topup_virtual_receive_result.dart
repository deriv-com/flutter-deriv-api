/// Topup virtual receive model class
abstract class TopupVirtualReceiveModel {
  /// Initializes
  TopupVirtualReceiveModel({
    @required this.topupVirtual,
  });

  /// The information regarding a successful top up for a virtual money account
  final TopupVirtual topupVirtual;
}

/// Topup virtual receive class
class TopupVirtualReceive extends TopupVirtualReceiveModel {
  /// Initializes
  TopupVirtualReceive({
    @required TopupVirtual topupVirtual,
  }) : super(
          topupVirtual: topupVirtual,
        );

  /// Creates an instance from JSON
  factory TopupVirtualReceive.fromJson(Map<String, dynamic> json) =>
      TopupVirtualReceive(
        topupVirtual: json['topup_virtual'] == null
            ? null
            : TopupVirtual.fromJson(json['topup_virtual']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (topupVirtual != null) {
      result['topup_virtual'] = topupVirtual.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  TopupVirtualReceive copyWith({
    TopupVirtual topupVirtual,
  }) =>
      TopupVirtualReceive(
        topupVirtual: topupVirtual ?? this.topupVirtual,
      );
}
/// Topup virtual model class
abstract class TopupVirtualModel {
  /// Initializes
  TopupVirtualModel({
    @required this.amount,
    @required this.currency,
  });

  /// Top up amount
  final double amount;

  /// Top up currency string
  final String currency;
}

/// Topup virtual class
class TopupVirtual extends TopupVirtualModel {
  /// Initializes
  TopupVirtual({
    @required double amount,
    @required String currency,
  }) : super(
          amount: amount,
          currency: currency,
        );

  /// Creates an instance from JSON
  factory TopupVirtual.fromJson(Map<String, dynamic> json) => TopupVirtual(
        amount: getDouble(json['amount']),
        currency: json['currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['amount'] = amount;
    result['currency'] = currency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  TopupVirtual copyWith({
    double amount,
    String currency,
  }) =>
      TopupVirtual(
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
      );
}
